import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../controllers/login.controller.dart';

class TextInputPasswordWidget extends StatelessWidget {
  TextInputPasswordWidget({Key? key}) : super(key: key);

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: controller.isLogin.value,
        child: TextField(
          controller: controller.passwordTextController,
          textAlign: TextAlign.center,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(100.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.white,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(100.0),
            ),
            label: Text(
              LocaleKeys.screen_login_pass_text_field_hint.tr,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    });
  }
}
