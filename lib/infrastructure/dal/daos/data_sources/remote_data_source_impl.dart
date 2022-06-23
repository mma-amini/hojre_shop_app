import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/brands_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/check_user_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/group_specs_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/insert_product_picture_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/insert_product_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/login_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/product_design_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/shop_products_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/brand_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/check_user_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/group_specs_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/login_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/message_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/product_desing_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/product_groups_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/response_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/shop_products_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/helpers/api.dart';
import 'package:hojre_shop_app/domain/core/helpers/brain.dart';
import 'package:hojre_shop_app/domain/core/helpers/log_helper.dart';
import 'package:hojre_shop_app/domain/core/helpers/show_message.dart';
import 'package:hojre_shop_app/domain/core/interfaces/repositories/remote_data_source.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_use_case.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  headers() {
    var headers = {
      "type": "Flutter",
      "Access-Control-Allow-Origin": "*",
    };
    return headers;
  }

  getRefreshToken() {
    var checkToken = (Brain.token.AccessToken ?? "").isNotEmpty;

    return checkToken ? Brain.token.RefreshToken : "";
  }

  checkMessage({MessageDtoUseCase? messageDtoUseCase}) {
    if (messageDtoUseCase != null) {
      if ((messageDtoUseCase.Text ?? "").isNotEmpty) {
        ShowMessage.getSnackBar(
          message: messageDtoUseCase.Text!,
        );
      }
    }
  }

  @override
  Future<LoginResponseDtoUseCase> refreshToken({required Dio dio}) async {
    var body = {
      "grant_type": "refresh_token",
      "refresh_token": getRefreshToken(),
      "client_id": 2,
      "client_secret": Brain.account.ClientSecret,
    };
    var jsonData = json.encode(body);
    var result = await dio
        .post(
      "${Brain.baseDomain}${Api.REFRESH_TOKEN_API}",
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
      "${Brain.baseDomain}${Api.CHECK_USER_API}",
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
      "client_secret": loginRequestDtoUseCase.ClientSecret,
    };
    var jsonData = json.encode(body);

    var result = await Brain.dio
        .post(
      "${Brain.baseDomain}${Api.LOGIN_API}",
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
      "${Brain.baseDomain}${Api.PRODUCT_GROUPS_API}",
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
      "${Brain.baseDomain}${Api.SHOP_PRODUCTS_API}",
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

  @override
  Future<List<GroupSpecsResponseDtoUseCase>> groupSpecs(
      {required GroupSpecsRequestDtoUseCase groupSpecsRequestDtoUseCase}) async {
    var body = {"categoryId": groupSpecsRequestDtoUseCase.categoryId};
    var result = await Brain.dio
        .get(
      "${Brain.baseDomain}${Api.GROUP_SPECS_API}",
      queryParameters: body,
      options: Options(
        headers: headers(),
      ),
    )
        .then((response) {
      var apiResult = ResponseDtoUseCase.fromJson(response.data);
      checkMessage(messageDtoUseCase: apiResult.Message);
      List<dynamic> arrayData = apiResult.Content;

      List<GroupSpecsResponseDtoUseCase> dataList = List<GroupSpecsResponseDtoUseCase>.empty(growable: true);

      for (var json in arrayData) {
        GroupSpecsResponseDtoUseCase groupSpecsResponseDtoUseCase = GroupSpecsResponseDtoUseCase.fromJson(json);

        dataList.add(groupSpecsResponseDtoUseCase);
      }

      return dataList;
    }).catchError((error) {
      LogHelper.printLog(data: error);
      return [];
    });

    return result;
  }

  @override
  Future<List<ProductDesignResponseDtoUseCase>> productDesigns(
      {required ProductDesignRequestDtoUseCase productDesignRequestDtoUseCase}) async {
    var body = {"productId": productDesignRequestDtoUseCase.ProductId};
    var result = await Brain.dio
        .get(
      "${Brain.baseDomain}${Api.PRODUCT_DESIGNS_API}",
      queryParameters: body,
      options: Options(
        headers: headers(),
      ),
    )
        .then((response) {
      var apiResult = ResponseDtoUseCase.fromJson(response.data);
      checkMessage(messageDtoUseCase: apiResult.Message);
      List<dynamic> arrayData = apiResult.Content;

      List<ProductDesignResponseDtoUseCase> dataList = List<ProductDesignResponseDtoUseCase>.empty(growable: true);

      for (var json in arrayData) {
        ProductDesignResponseDtoUseCase productDesignResponseDtoUseCase =
            ProductDesignResponseDtoUseCase.fromJson(json);

        dataList.add(productDesignResponseDtoUseCase);
      }

      return dataList;
    }).catchError((error) {
      LogHelper.printLog(data: error);
      return [];
    });

    return result;
  }

  @override
  Future<List<BrandResponseDtoUseCase>> brands({required BrandsRequestDtoUseCase brandsRequestDtoUseCase}) async {
    var body = {"keyword": brandsRequestDtoUseCase.keyword};
    var result = await Brain.dio
        .get(
      "${Brain.baseDomain}${Api.BRANDS_API}",
      queryParameters: body,
      options: Options(
        headers: headers(),
      ),
    )
        .then((response) {
      var apiResult = ResponseDtoUseCase.fromJson(response.data);
      checkMessage(messageDtoUseCase: apiResult.Message);
      List<dynamic> arrayData = apiResult.Content;

      List<BrandResponseDtoUseCase> dataList = List<BrandResponseDtoUseCase>.empty(growable: true);

      for (var json in arrayData) {
        BrandResponseDtoUseCase brandResponseDtoUseCase = BrandResponseDtoUseCase.fromJson(json);

        dataList.add(brandResponseDtoUseCase);
      }

      return dataList;
    }).catchError((error) {
      LogHelper.printLog(data: error);
      return [];
    });

    return result;
  }

  @override
  Future<InsertProductResponseDtoUseCase> insertProduct(
      {required InsertProductRequestDtoUseCase insertProductRequestDtoUseCase}) async {
    var jsonBody = json.encode(insertProductRequestDtoUseCase.toJson());
    var result = await Brain.dio
        .post(
      "${Brain.baseDomain}${Api.INSERT_PRODUCT_API}",
      data: jsonBody,
      options: Options(
        headers: headers(),
      ),
    )
        .then((response) {
      var apiResult = ResponseDtoUseCase.fromJson(response.data);
      checkMessage(messageDtoUseCase: apiResult.Message);
      InsertProductResponseDtoUseCase insertProductResponseDtoUseCase =
          InsertProductResponseDtoUseCase.fromJson(apiResult.Content);
      return insertProductResponseDtoUseCase;
    }).catchError((error) {
      LogHelper.printLog(data: error);
      return InsertProductResponseDtoUseCase();
    });

    return result;
  }

  @override
  Future<NoParams> insertProductImages(
      {required InsertProductPictureRequestDtoUseCase insertProductPictureRequestDtoUseCase}) async {
    var body = FormData.fromMap({
      "Id": insertProductPictureRequestDtoUseCase.Id,
      "ProductId": insertProductPictureRequestDtoUseCase.ProductId,
      "Image": MultipartFile.fromBytes(
        insertProductPictureRequestDtoUseCase.PickedFile!,
        filename: "${insertProductPictureRequestDtoUseCase.Id}.jpg",
      ),
      "Sort": insertProductPictureRequestDtoUseCase.Sort,
      "IsMain": insertProductPictureRequestDtoUseCase.IsMain,
    });
    var result = await Brain.dio
        .post(
      "${Brain.baseDomain}${Api.INSERT_PRODUCT_IMAGE_API}",
      data: body,
      options: Options(
        headers: headers(),
      ),
    )
        .then((response) {
      return NoParams();
    }).catchError((error) {
      LogHelper.printLog(data: error);
      return NoParams();
    });

    return result;
  }
}
