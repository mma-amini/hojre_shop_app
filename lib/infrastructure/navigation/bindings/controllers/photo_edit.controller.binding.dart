import 'package:get/get.dart';

import '../../../../presentation/photo_edit/controllers/photo_edit.controller.dart';

class PhotoEditControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoEditController>(
      () => PhotoEditController(),
    );
  }
}
