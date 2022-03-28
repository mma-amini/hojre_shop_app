import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../dto/use_cases/responses/confirm_response_dto_use_case.dart';
import '../../helpers/failure.dart';

abstract class Repository {
  Future<Either<Failure, ConfirmResponseDtoUseCase>>? refreshToken({required Dio dio});
}
