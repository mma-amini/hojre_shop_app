import 'package:get/get.dart';
import 'package:hojre_shop_app/injection_container.dart';

import '../../../../presentation/home/controllers/home.controller.dart';

class HomeControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(
        iShopInfoUseCase: sl(),
      ),
    );
  }
}
