import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login.controller.dart';
import 'widgets_export.dart';

class BodyWidget extends StatelessWidget {
  BodyWidget({Key? key}) : super(key: key);

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: Get.width * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageLogoWidget(key: Key('ImageLogoWidget')),
            const SizedBox(
              height: 8.0,
            ),
            TextWelcomeWidget(key: Key('WelcomeTextWidget')),
            const SizedBox(
              height: 8.0,
            ),
            TextPleaseLoginWidget(key: Key('TextPleaseLoginWidget')),
            const SizedBox(
              height: 16.0,
            ),
            Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextInputUsernameWidget(key: Key('TextInputUsernameWidget')),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextEnterSMSCodeWidget(key: Key('TextEnterSMSCode')),
                  Obx(() {
                    return Visibility(
                      visible: controller.isLogin.value,
                      child: const SizedBox(
                        height: 16.0,
                      ),
                    );
                  }),
                  TextInputPasswordWidget(key: Key('TextInputPasswordWidget')),
                  Obx(() {
                    return Visibility(
                      visible: controller.isLogin.value,
                      child: const SizedBox(
                        height: 16.0,
                      ),
                    );
                  }),
                  ButtonSubmitWidget(key: Key('ButtonSubmitWidget')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
