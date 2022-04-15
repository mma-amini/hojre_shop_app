import 'package:get/get.dart';
import 'package:hojre_shop_app/injection_container.dart';

import '../../../../presentation/product_manager/controllers/product_manager.controller.dart';

class ProductManagerControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductManagerController>(
      () => ProductManagerController(
        iProductGroupsUseCase: sl(),
      ),
    );
  }
}
