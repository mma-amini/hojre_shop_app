import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/check_user_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/login_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/shop_products_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/check_user_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/login_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/message_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/product_groups_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/shop_products_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/helpers/api.dart';
import 'package:hojre_shop_app/domain/core/helpers/brain.dart';
import 'package:hojre_shop_app/domain/core/helpers/log_helper.dart';
import 'package:hojre_shop_app/domain/core/helpers/show_message.dart';
import 'package:hojre_shop_app/domain/core/interfaces/repositories/remote_data_source.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  headers() {
    var headers = {"type": "Flutter"};
    return headers;
  }

  getRefreshToken() {
    var checkToken = (Brain.token.AccessToken ?? "").isNotEmpty;

    return checkToken ? Brain.token.RefreshToken : "";
  }

  checkMessage({MessageDtoUseCase? messageDtoUseCase}) {
    if (messageDtoUseCase != null) {
      if ((messageDtoUseCase.Text ?? "").isNotEmpty) {
        ShowMessage.GetSnackBar(message: messageDtoUseCase.Text!, context: Get.context!);
      }
    }
  }

  @override
  Future<LoginResponseDtoUseCase> refreshToken({required Dio dio}) async {
    var body = {
      "grant_type": "refresh_token",
      "refresh_token": getRefreshToken(),
      "client_id": 2,
      "client_secret": "6xIllgWHhFimZXKGBvRdGNJNqbKJAz9HwSQMjj0q",
    };
    var jsonData = json.encode(body);
    var result = await dio
        .post(
      Api.REFRESH_TOKEN_API,
      data: jsonData,
      options: Options(
        headers: headers(),
      ),
    )
        .then((response) {
      LogHelper.printLog(data: "Refresh Token Response: $response");
      var apiResult = ResponseDtoUseCase.fromJson(response.data);
      LoginResponseDtoUseCase confirmResponseDtoUseCase = LoginResponseDtoUseCase.fromJson(apiResult.Content);
      return confirmResponseDtoUseCase;
    }).catchError((error) {
      LogHelper.printLog(data: error);
      return LoginResponseDtoUseCase();
    });

    return result;
  }

  @override
  Future<CheckUserResponseDtoUseCase> checkUser(
      {required CheckUserRequestDtoUseCase checkUserRequestDtoUseCase}) async {
    var body = {"phoneNumber": checkUserRequestDtoUseCase.phoneNumber};
    var jsonData = json.encode(body);

    var result = await Brain.dio
        .post(
      Api.CHECK_USER_API,
      data: jsonData,
      options: Options(
        headers: headers(),
      ),
    )
        .then((response) {
      var apiResult = ResponseDtoUseCase.fromJson(response.data);
      checkMessage(messageDtoUseCase: apiResult.Message);
      CheckUserResponseDtoUseCase checkUserResponseDtoUseCase = CheckUserResponseDtoUseCase.fromJson(apiResult.Content);
      return checkUserResponseDtoUseCase;
    }).catchError((error) {
      LogHelper.printLog(data: error);
      return CheckUserResponseDtoUseCase();
    });

    return result;
  }

  @override
  Future<LoginResponseDtoUseCase> login({required LoginRequestDtoUseCase loginRequestDtoUseCase}) async {
    var body = {
      "username": loginRequestDtoUseCase.phoneNumber,
      "password": loginRequestDtoUseCase.Code,
      "grant_type": "password",
      "client_id": 2,
      "client_secret": "6xIllgWHhFimZXKGBvRdGNJNqbKJAz9HwSQMjj0q",
    };
    var jsonData = json.encode(body);

    var result = await Brain.dio
        .post(
      Api.LOGIN_API,
      data: jsonData,
      options: Options(
        headers: headers(),
      ),
    )
        .then((response) {
      var apiResult = ResponseDtoUseCase.fromJson(response.data);
      checkMessage(messageDtoUseCase: apiResult.Message);
      LoginResponseDtoUseCase loginResponseDtoUseCase = LoginResponseDtoUseCase.fromJson(apiResult.Content);
      return loginResponseDtoUseCase;
    }).catchError((error) {
      LogHelper.printLog(data: error);
      return LoginResponseDtoUseCase();
    });

    return result;
  }

  @override
  Future<List<ProductGroupsResponseDtoUseCase>> productCategories() async {
    var result = await Brain.dio
        .get(
      Api.PRODUCT_GROUPS_API,
      options: Options(
        headers: headers(),
      ),
    )
        .then((response) {
      var apiResult = ResponseDtoUseCase.fromJson(response.data);
      checkMessage(messageDtoUseCase: apiResult.Message);
      List<dynamic> arrayData = apiResult.Content;

      List<ProductGroupsResponseDtoUseCase> dataList = List<ProductGroupsResponseDtoUseCase>.empty(growable: true);

      for (var json in arrayData) {
        ProductGroupsResponseDtoUseCase productGroupsResponseDtoUseCase =
            ProductGroupsResponseDtoUseCase.fromJson(json);

        dataList.add(productGroupsResponseDtoUseCase);
      }

      return dataList;
    }).catchError((error) {
      LogHelper.printLog(data: error);
      return [];
    });

    return result;
  }

  @override
  Future<List<ShopProductsResponseDtoUseCase>> shopProducts(
      {required ShopProductsRequestDtoUseCase shopProductsRequestDtoUseCase}) async {
    var body = {"categoryId": shopProductsRequestDtoUseCase.categoryId};
    var result = await Brain.dio
        .get(
      Api.SHOP_PRODUCTS_API,
      queryParameters: body,
      options: Options(
        headers: headers(),
      ),
    )
        .then((response) {
      var apiResult = ResponseDtoUseCase.fromJson(response.data);
      checkMessage(messageDtoUseCase: apiResult.Message);
      List<dynamic> arrayData = apiResult.Content;

      List<ShopProductsResponseDtoUseCase> dataList = List<ShopProductsResponseDtoUseCase>.empty(growable: true);

      for (var json in arrayData) {
        ShopProductsResponseDtoUseCase shopProductsResponseDtoUseCase = ShopProductsResponseDtoUseCase.fromJson(json);

        dataList.add(shopProductsResponseDtoUseCase);
      }

      return dataList;
    }).catchError((error) {
      LogHelper.printLog(data: error);
      return [];
    });

    return result;
  }
}
