import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  updateLocale() {
    var locale = Get.locale;

    print(locale);

    if (locale.toString() == "fa_IR") {
      Get.updateLocale(Locale('en', 'US'));
    } else {
      Get.updateLocale(Locale('fa', 'IR'));
    }

    update();
  }
}
