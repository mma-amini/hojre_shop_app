import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../controllers/login.controller.dart';

class TextInputUsernameWidget extends StatelessWidget {
  TextInputUsernameWidget({Key? key}) : super(key: key);

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller.userTextController,
      textAlign: TextAlign.center,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        alignLabelWithHint: true,
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
          LocaleKeys.screen_login_user_text_field_hint.tr,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }
}
