import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../controllers/login.controller.dart';

class TextEnterSMSCodeWidget extends StatelessWidget {
  TextEnterSMSCodeWidget({Key? key}) : super(key: key);

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: controller.isLogin.value,
        child: Text(
          LocaleKeys.screen_login_enter_sms_code.tr,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    });
  }
}
