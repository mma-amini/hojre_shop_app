import 'dart:convert';

import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_design_model.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/request_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_use_case_exports.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ProductDesignManagerController extends GetxController {
  final isLoading = false.obs;

  final productId = "".obs;

  RefreshController refreshController = RefreshController(initialRefresh: false);

  IProductDesignsUseCase? iProductDesignsUseCase;

  final productDesignsList = List<VMProductDesign>.empty(growable: true).obs;

  ProductDesignManagerController({this.iProductDesignsUseCase});

  @override
  void onInit() {
    var parData = Get.parameters;

    productId.value = parData["productId"] ?? "";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    startApiProductDesigns();
  }

  @override
  void onClose() {}

  updateLoading({required bool isLoading}) {
    this.isLoading.update((val) {
      this.isLoading.value = isLoading;
    });
  }

  updateProductDesignsList({required List<VMProductDesign> productDesignsList}) {
    this.productDesignsList.obs.update((val) {
      this.productDesignsList.addAll(productDesignsList);
    });
  }

  startApiProductDesigns() async {
    updateLoading(isLoading: true);
    await iProductDesignsUseCase!
        .handler(params: ProductDesignRequestDtoUseCase(productId: productId.value))
        .then((response) {
      updateLoading(isLoading: false);
      refreshController.refreshCompleted();
      refreshController.loadComplete();

      var data = response.getOrElse(() => []);

      List<VMProductDesign> tempProductDesignsList = List<VMProductDesign>.empty(growable: true);

      for (var element in data) {
        var js = json.encode(element);
        Map<String, dynamic> jsData = json.decode(js);
        VMProductDesign productDesign = VMProductDesign.fromJson(jsData);

        tempProductDesignsList.add(productDesign);
      }
      updateProductDesignsList(productDesignsList: tempProductDesignsList);
    }).catchError((error) {
      updateLoading(isLoading: false);
    });
  }
}
