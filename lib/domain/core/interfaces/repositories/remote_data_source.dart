import 'package:dio/dio.dart';

import '../../dto/use_cases/responses/confirm_response_dto_use_case.dart';

abstract class RemoteDataSource {
  /// Calls the method http-get https://server.com/identity/customer/refreshToken endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<ConfirmResponseDtoUseCase> refreshToken({required Dio dio});
}
