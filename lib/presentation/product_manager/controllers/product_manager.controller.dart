import 'dart:convert';

import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_group_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_model.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/request_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/helpers/log_helper.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_product_groups_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_shop_products_use_case.dart';

class ProductManagerController extends GetxController {
  final isLoading = false.obs;

  final productGroupsList = List<VMProductGroup>.empty(growable: true).obs;
  final shopProductsList = List<VMProduct>.empty(growable: true).obs;
  VMProductGroup selectedCategory = VMProductGroup();

  IProductGroupsUseCase iProductGroupsUseCase;
  IShopProductsUseCase iShopProductsUseCase;

  ProductManagerController({required this.iProductGroupsUseCase, required this.iShopProductsUseCase});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    startApiProductGroups();
    startApiShopProducts();
  }

  @override
  void onClose() {}

  updateLoading({required bool isLoading}) {
    this.isLoading.update((val) {
      this.isLoading.value = isLoading;
    });
  }

  updateProductGroupsList({required List<VMProductGroup> productGroupsList}) {
    this.productGroupsList.obs.update((val) {
      this.productGroupsList.addAll(productGroupsList);
    });
  }

  updateShopProductsList({required List<VMProduct> shopProductsList}) {
    this.shopProductsList.obs.update((val) {
      this.shopProductsList.addAll(shopProductsList);
    });
  }

  updateSelectedCategory({required VMProductGroup selectedCategory}) {
    this.selectedCategory = selectedCategory;

    startApiShopProducts();
  }

  startApiProductGroups() async {
    await iProductGroupsUseCase.Handler().then((response) {
      var data = response.getOrElse(() => []);

      List<VMProductGroup> tempProductGroupsList = List<VMProductGroup>.empty(growable: true);

      VMProductGroup emptyGroup = VMProductGroup(CategoryName: "همه", CategoryId: "");
      tempProductGroupsList.add(emptyGroup);

      data.forEach((element) {
        VMProductGroup productGroup = VMProductGroup(
          CategoryId: element.CategoryId,
          CategoryName: element.CategoryName,
          Picture: element.Picture,
          ParentId: element.ParentId,
        );

        tempProductGroupsList.add(productGroup);
      });

      updateProductGroupsList(productGroupsList: tempProductGroupsList);
    }).catchError((error) {
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
    });
  }

  startApiShopProducts() async {
    updateLoading(isLoading: true);
    await iShopProductsUseCase.Handler(
            params: ShopProductsRequestDtoUseCase(categoryId: selectedCategory.CategoryId ?? ""))
        .then((response) {
      updateLoading(isLoading: false);
      var data = response.getOrElse(() => []);

      List<VMProduct> tempShopProductsList = List<VMProduct>.empty(growable: true);

      data.forEach((element) {
        var js = json.encode(element);
        Map<String, dynamic> jsData = json.decode(js);
        VMProduct product = VMProduct.fromJson(jsData);

        tempShopProductsList.add(product);
      });

      updateShopProductsList(shopProductsList: tempShopProductsList);
    }).catchError((error) {
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
      updateLoading(isLoading: false);
    });
  }
}
