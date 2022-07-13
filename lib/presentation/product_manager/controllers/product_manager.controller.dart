import 'dart:convert';

import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_group_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_model.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/request_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/helpers/log_helper.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_product_groups_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_shop_products_use_case.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductManagerController extends GetxController {
  final isLoading = false.obs;
  bool loadData = false;

  int skip = 0;

  RefreshController refreshController = RefreshController(initialRefresh: false);
  final selectedCategory = VMProductGroup().obs;
  IProductGroupsUseCase iProductGroupsUseCase;
  IShopProductsUseCase iShopProductsUseCase;

  final productGroupsList = List<VMProductGroup>.empty(growable: true).obs;
  final shopProductsList = List<VMProduct>.empty(growable: true).obs;

  ProductManagerController({required this.iProductGroupsUseCase, required this.iShopProductsUseCase});

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
    this.selectedCategory.value = selectedCategory;
    shopProductsList.clear();

    startApiShopProducts();
  }

  updateSkip() {
    skip++;
    update();
  }

  onRefresh() {
    shopProductsList.clear();

    startApiShopProducts();
  }

  startApiProductGroups() async {
    await iProductGroupsUseCase.handler().then((response) {
      var data = response.getOrElse(() => []);

      List<VMProductGroup> tempProductGroupsList = List<VMProductGroup>.empty(growable: true);

      VMProductGroup emptyGroup = VMProductGroup(categoryName: "همه گروه ها", categoryId: "");
      tempProductGroupsList.add(emptyGroup);

      for (var element in data) {
        VMProductGroup productGroup = VMProductGroup(
          categoryId: element.categoryId,
          categoryName: element.categoryName,
          picture: element.picture,
          parentId: element.parentId,
        );

        tempProductGroupsList.add(productGroup);
      }

      updateProductGroupsList(productGroupsList: tempProductGroupsList);
    }).catchError((error) {
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
    });
  }

  startApiShopProducts() async {
    updateLoading(isLoading: true);
    await iShopProductsUseCase
        .handler(params: ShopProductsRequestDtoUseCase(categoryId: selectedCategory.value.categoryId ?? ""))
        .then((response) {
      updateLoading(isLoading: false);
      refreshController.refreshCompleted();
      refreshController.loadComplete();

      var data = response.getOrElse(() => []);

      List<VMProduct> tempShopProductsList = List<VMProduct>.empty(growable: true);

      for (var element in data) {
        var js = json.encode(element);
        Map<String, dynamic> jsData = json.decode(js);
        VMProduct product = VMProduct.fromJson(jsData);

        tempShopProductsList.add(product);
      }

      updateShopProductsList(shopProductsList: tempShopProductsList);
    }).catchError((error) {
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
      updateLoading(isLoading: false);
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    });
  }
}
