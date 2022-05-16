import 'package:dio/dio.dart';

import '../../dto/use_cases/requests/request_dto_use_case_exports.dart';
import '../../dto/use_cases/responses/response_dto_use_case_exports.dart';

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
  Future<List<ProductGroupsResponseDtoUseCase>> productCategories();

  /// Calls the method http-get https://server.com/api/v1/shop/shopProducts endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<ShopProductsResponseDtoUseCase>> shopProducts(
      {required ShopProductsRequestDtoUseCase shopProductsRequestDtoUseCase});

  /// Calls the method http-get https://server.com/api/v1/shop/groupSpecs endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<GroupSpecsResponseDtoUseCase>> groupSpecs(
      {required GroupSpecsRequestDtoUseCase groupSpecsRequestDtoUseCase});
}
