import 'package:get/get.dart';

import '../../../../presentation/developer/controllers/developer.controller.dart';

class DeveloperControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeveloperController>(
      () => DeveloperController(),
    );
  }
}
