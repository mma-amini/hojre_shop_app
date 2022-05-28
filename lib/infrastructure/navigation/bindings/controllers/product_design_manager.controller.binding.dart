import 'package:get/get.dart';

import '../../../../presentation/product_design_manager/controllers/product_design_manager.controller.dart';

class ProductDesignManagerControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDesignManagerController>(
      () => ProductDesignManagerController(),
    );
  }
}
