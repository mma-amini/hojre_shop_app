import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Scaffold(
          body: Container(
            width: Get.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue.withOpacity(0.7),
                  Color.fromARGB(255, 5, 49, 88),
                ],
              ),
            ),
            child: Center(
              child: Container(
                width: Get.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/media/images/hojre_shop_management_logo.png',
                      height: 120.0,
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'screen_login_welcome'.tr,
                      style: TextStyle(
                        fontFamily: 'Vazir Med',
                        fontSize: 24.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      'screen_login_please_login'.tr,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
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
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              label: Text(
                                'screen_login_user_text_field_hint'.tr,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextField(
                            controller: controller.passwordTextController,
                            textAlign: TextAlign.center,
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.white,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              label: Text(
                                'screen_login_pass_text_field_hint'.tr,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Material(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(100.0),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(100.0),
                              onTap: () {},
                              child: Container(
                                width: Get.width,
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'screen_login_buttons_login'.tr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          SelectableText(
                            'screen_login_forget_pass'.tr,
                            style: TextStyle(
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
        );
      },
    );
  }
}
