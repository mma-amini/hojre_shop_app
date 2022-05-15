import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Obx(() {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blue.withOpacity(0.7),
                        const Color.fromARGB(255, 5, 49, 88),
                      ],
                    ),
                  ),
                  child: Center(
                    child: SizedBox(
                      width: Get.width * 0.8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/media/images/hojre_shop_management_logo.png',
                            height: 120.0,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            LocaleKeys.screen_login_welcome.tr,
                            style: const TextStyle(
                              fontFamily: 'Vazir Med',
                              fontSize: 24.0,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            LocaleKeys.screen_login_please_login.tr,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Form(
                            key: controller.formKey,
                            child: Column(
                              children: [
                                TextFormField(
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
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                Visibility(
                                  visible: controller.isLogin.value,
                                  child: Text(
                                    LocaleKeys.screen_login_enter_sms_code.tr,
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: controller.isLogin.value,
                                  child: const SizedBox(
                                    height: 16.0,
                                  ),
                                ),
                                Visibility(
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
                                ),
                                Visibility(
                                  visible: controller.isLogin.value,
                                  child: const SizedBox(
                                    height: 16.0,
                                  ),
                                ),
                                Material(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(100.0),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(100.0),
                                    onTap: () {
                                      if (controller.isLogin.value) {
                                        controller.startApiLogin();
                                      } else {
                                        controller.startApiCheckUser();
                                      }
                                    },
                                    child: SizedBox(
                                      width: Get.width,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            controller.isLogin.value
                                                ? LocaleKeys.screen_login_buttons_login.tr
                                                : LocaleKeys.screen_login_buttons_check_user.tr,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                SelectableText(
                                  LocaleKeys.screen_login_forget_pass.tr,
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  onTap: () {
                                    controller.updateLocale();
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                controller.isLoading.value
                    ? Container(
                        color: const Color.fromARGB(50, 255, 255, 255),
                        child: SpinKitCircle(
                          itemBuilder: (BuildContext context, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: index.isEven ? Colors.lightBlueAccent : Colors.yellow,
                              ),
                            );
                          },
                        ),
                      )
                    : Container()
              ],
            ),
          );
        });
      },
    );
  }
}
