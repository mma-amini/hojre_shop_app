import 'package:get/get.dart';
import 'package:hojre_shop_app/injection_container.dart';

import '../../../../presentation/add_product/controllers/add_product.controller.dart';

class AddProductControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductController>(
      () => AddProductController(
        iProductGroupsUseCase: sl(),
        iGroupSpecsUseCase: sl(),
        iBrandsUseCase: sl(),
        iInsertProductUseCase: sl(),
      ),
    );
  }
}
