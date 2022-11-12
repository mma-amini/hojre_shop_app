import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/models/account_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/token_model.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/check_user_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/login_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/check_user_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/login_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/helpers/brain.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_check_user_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_login_use_case.dart';
import 'package:hojre_shop_app/infrastructure/dal/daos/data_sources/local_data_source_impl.dart';
import 'package:hojre_shop_app/infrastructure/navigation/routes.dart';

import '../../widgets/loading_view/controller/loading_view.controller.dart';

class LoginController extends GetxController {
  final isLogin = false.obs;

  final clientSecret = "".obs;

  final formKey = GlobalKey<FormState>();

  TextEditingController userTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  final loadingWidgetController = Get.put(LoadingViewWidgetController());

  ICheckUserUseCase iCheckUserUseCase;
  ILoginUseCase iLoginUseCase;

  LoginController({required this.iCheckUserUseCase, required this.iLoginUseCase});

  @override
  void onClose() {}

  updateIsLogin({required bool isLogin}) {
    this.isLogin.update((val) {
      this.isLogin.value = isLogin;
    });
  }

  updateLocale() {
    var locale = Get.locale;

    if (locale.toString() == "fa_IR") {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('fa', 'IR'));
    }

    update();
  }

  startApiCheckUser() async {
    loadingWidgetController.showLoading.value = true;
    CheckUserRequestDtoUseCase checkUserRequestDtoUseCase = CheckUserRequestDtoUseCase(phoneNumber: userTextController.text);

    var result = await iCheckUserUseCase.handler(params: checkUserRequestDtoUseCase);

    loadingWidgetController.showLoading.value = false;
    var data = result.getOrElse(() => CheckUserResponseDtoUseCase());

    if ((data.code ?? "").isNotEmpty) {
      clientSecret.value = data.clientSecret ?? "";
      updateIsLogin(isLogin: true);
    }
  }

  startApiLogin() async {
    loadingWidgetController.showLoading.value = true;
    LoginRequestDtoUseCase loginResponseDtoUseCase =
        LoginRequestDtoUseCase(phoneNumber: userTextController.text, code: passwordTextController.text, clientSecret: clientSecret.value);

    var result = await iLoginUseCase.handler(params: loginResponseDtoUseCase);

    loadingWidgetController.showLoading.value = false;
    var data = result.getOrElse(() => LoginResponseDtoUseCase());

    VMAccount account = VMAccount(
      userId: data.userId,
      firstName: data.firstName,
      lastName: data.lastName,
      username: data.userId,
      shopId: data.shopId,
      shopName: data.shopName,
      clientSecret: clientSecret.value,
    );

    VMToken token = VMToken(
      tokenType: data.tokenType,
      accessToken: data.accessToken,
      refreshToken: data.refreshToken,
      expiresIn: data.expiresIn,
    );

    await LocalDataSourceImpl.saveAccount(account);
    await LocalDataSourceImpl.saveToken(token);

    if ((Brain.account.userId ?? "").isNotEmpty && (Brain.token.accessToken ?? "").isNotEmpty) {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
