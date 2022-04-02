import 'package:dio/dio.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/check_user_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/login_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/check_user_response_dto_use_case.dart';

import '../../dto/use_cases/responses/login_response_dto_use_case.dart';

abstract class RemoteDataSource {
  /// Calls the method http-get https://server.com/user/checkUser endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<CheckUserResponseDtoUseCase> checkUser({required CheckUserRequestDtoUseCase checkUserRequestDtoUseCase});

  /// Calls the method http-get https://server.com/user/login endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LoginResponseDtoUseCase> login({required LoginRequestDtoUseCase loginRequestDtoUseCase});

  /// Calls the method http-get https://server.com/user/refreshToken endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<LoginResponseDtoUseCase> refreshToken({required Dio dio});
}
