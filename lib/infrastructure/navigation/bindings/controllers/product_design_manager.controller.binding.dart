import 'package:get/get.dart';
import 'package:hojre_shop_app/injection_container.dart';

import '../../../../presentation/product_design_manager/controllers/product_design_manager.controller.dart';

class ProductDesignManagerControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDesignManagerController>(
      () => ProductDesignManagerController(
        iProductDesignsUseCase: sl(),
      ),
    );
  }
}
