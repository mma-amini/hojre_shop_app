import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_group_model.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/product_groups_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/helpers/brain.dart';
import 'package:hojre_shop_app/domain/core/helpers/log_helper.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_product_groups_use_case.dart';

class ProductManagerController extends GetxController {
  final isLoading = false.obs;

  final productGroupsList = List<VMProductGroup>.empty(growable: true).obs;

  IProductGroupsUseCase iProductGroupsUseCase;

  ProductManagerController({required this.iProductGroupsUseCase});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    startApiProductGroups();
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

  startApiProductGroups() async {
    updateLoading(isLoading: true);
    await iProductGroupsUseCase.Handler(params: ProductGroupsRequestDtoUseCase(ShopId: Brain.account.ShopId ?? ""))
        .then((response) {
      updateLoading(isLoading: false);
      var data = response.getOrElse(() => []);

      List<VMProductGroup> tempProductGroupsList = List<VMProductGroup>.empty(growable: true);

      data.forEach((element) {
        VMProductGroup productGroup = VMProductGroup(
          CategoryId: element.CategoryId,
          CategoryName: element.CategoryName,
          Picture: element.Picture,
          ParentId: element.ParentId,
        );

        LogHelper.printLog(data: productGroup.CategoryName);

        tempProductGroupsList.add(productGroup);
      });

      updateProductGroupsList(productGroupsList: tempProductGroupsList);
    }).catchError((error) {
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
    });
  }
}
