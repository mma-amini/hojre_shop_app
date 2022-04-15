import 'package:dio/dio.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/check_user_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/login_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/product_groups_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/check_user_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/product_groups_response_dto_use_case.dart';

import '../../dto/use_cases/responses/login_response_dto_use_case.dart';

abstract class RemoteDataSource {
  /// Calls the method http-get https://server.com/api/v1/user/checkUser endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CheckUserResponseDtoUseCase> checkUser({required CheckUserRequestDtoUseCase checkUserRequestDtoUseCase});

  /// Calls the method http-get https://server.com/api/v1/user/login endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LoginResponseDtoUseCase> login({required LoginRequestDtoUseCase loginRequestDtoUseCase});

  /// Calls the method http-get https://server.com/api/v1/user/refreshToken endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LoginResponseDtoUseCase> refreshToken({required Dio dio});

  /// Calls the method http-get https://server.com/api/v1/shop/productGroups endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ProductGroupsResponseDtoUseCase>> productCategories(
      {required ProductGroupsRequestDtoUseCase productGroupsRequestDtoUseCase});
}
