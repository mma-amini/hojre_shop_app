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

class LoginController extends GetxController {
  final isLoading = false.obs, isLogin = false.obs;

  final clientSecret = "".obs;

  final formKey = GlobalKey<FormState>();

  TextEditingController userTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  ICheckUserUseCase iCheckUserUseCase;
  ILoginUseCase iLoginUseCase;

  LoginController({required this.iCheckUserUseCase, required this.iLoginUseCase});

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
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('fa', 'IR'));
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
      clientSecret.value = data.ClientSecret ?? "";
      updateIsLogin(isLogin: true);
    }
  }

  startApiLogin() async {
    updateLoading(isLoading: true);
    LoginRequestDtoUseCase loginResponseDtoUseCase = LoginRequestDtoUseCase(
        phoneNumber: userTextController.text, Code: passwordTextController.text, ClientSecret: clientSecret.value);

    var result = await iLoginUseCase.Handler(params: loginResponseDtoUseCase);

    updateLoading(isLoading: false);
    var data = result.getOrElse(() => LoginResponseDtoUseCase());

    VMAccount account = VMAccount(
      UserId: data.UserId,
      FirstName: data.FirstName,
      LastName: data.LastName,
      Username: data.Username,
      ShopId: data.ShopId,
      ShopName: data.ShopName,
      ClientSecret: clientSecret.value,
    );

    VMToken token = VMToken(
      TokenType: data.TokenType,
      AccessToken: data.AccessToken,
      RefreshToken: data.RefreshToken,
      ExpiresIn: data.ExpiresIn,
    );

    await LocalDataSourceImpl.saveAccount(account);
    await LocalDataSourceImpl.saveToken(token);

    if ((Brain.account.UserId ?? "").isNotEmpty && (Brain.token.AccessToken ?? "").isNotEmpty) {
      Get.offAllNamed(Routes.HOME);
    }
  }
}
