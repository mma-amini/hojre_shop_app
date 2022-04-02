import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/check_user_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/login_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/check_user_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/login_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/helpers/log_helper.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_check_user_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_login_use_case.dart';

class LoginController extends GetxController {
  final isLoading = false.obs, isLogin = false.obs;

  final formKey = GlobalKey<FormState>();

  TextEditingController userTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  ICheckUserUseCase iCheckUserUseCase;
  ILoginUseCase iLoginUseCase;

  LoginController({required this.iCheckUserUseCase, required this.iLoginUseCase});

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

  updateLoading({required bool isLoading}) {
    this.isLoading.update((val) {
      this.isLoading.value = isLoading;
    });
  }

  updateIsLogin({required bool isLogin}) {
    this.isLogin.update((val) {
      this.isLogin.value = isLogin;
    });
  }

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

  startApiCheckUser() async {
    updateLoading(isLoading: true);
    CheckUserRequestDtoUseCase checkUserRequestDtoUseCase =
        CheckUserRequestDtoUseCase(phoneNumber: userTextController.text);

    var result = await iCheckUserUseCase.Handler(params: checkUserRequestDtoUseCase);

    updateLoading(isLoading: false);
    var data = result.getOrElse(() => CheckUserResponseDtoUseCase());

    if ((data.Code ?? "").isNotEmpty) {
      updateIsLogin(isLogin: true);
    }
  }

  startApiLogin() async {
    updateLoading(isLoading: true);
    LoginRequestDtoUseCase loginResponseDtoUseCase =
        LoginRequestDtoUseCase(phoneNumber: userTextController.text, Code: passwordTextController.text);

    var result = await iLoginUseCase.Handler(params: loginResponseDtoUseCase);

    updateLoading(isLoading: false);
    var data = result.getOrElse(() => LoginResponseDtoUseCase());

    LogHelper.printLog(data: data);
  }
}
