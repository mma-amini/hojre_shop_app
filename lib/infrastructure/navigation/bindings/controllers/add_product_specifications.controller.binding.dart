import 'package:get/get.dart';

import '../../../../presentation/add_product_specifications/controllers/add_product_specifications.controller.dart';

class AddProductSpecificationsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddProductSpecificationsController>(
      () => AddProductSpecificationsController(),
    );
  }
}
