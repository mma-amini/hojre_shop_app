import 'package:get/get.dart';
import 'package:hojre_shop_app/injection_container.dart';

import '../../../../presentation/login/controllers/login.controller.dart';

class LoginControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(iCheckUserUseCase: sl(), iLoginUseCase: sl()),
    );
  }
}
