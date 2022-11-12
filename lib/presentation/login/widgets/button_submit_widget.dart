import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/helpers/show_message.dart';

import '../../../generated/locales.g.dart';
import '../controllers/login.controller.dart';

class ButtonSubmitWidget extends StatelessWidget {
  ButtonSubmitWidget({Key? key}) : super(key: key);

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      borderRadius: BorderRadius.circular(100.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(100.0),
        onTap: () {
          if (controller.isLogin.value) {
            if (controller.passwordTextController.text.isEmpty) {
              ShowMessage.getSnackBar(message: LocaleKeys.screen_login_enter_sms_code.tr);
              return;
            }
            controller.startApiLogin();
          } else {
            if (controller.userTextController.text.isEmpty) {
              ShowMessage.getSnackBar(message: LocaleKeys.screen_login_enter_user_name.tr);
              return;
            }
            controller.startApiCheckUser();
          }
        },
        child: SizedBox(
          width: Get.width,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(() {
                return Text(
                  controller.isLogin.value ? LocaleKeys.screen_login_buttons_login.tr : LocaleKeys.screen_login_buttons_check_user.tr,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
