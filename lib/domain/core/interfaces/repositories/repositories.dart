import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/check_user_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/login_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/check_user_response_dto_use_case.dart';

import '../../dto/use_cases/responses/login_response_dto_use_case.dart';
import '../../helpers/failure.dart';

abstract class Repository {
  Future<Either<Failure, CheckUserResponseDtoUseCase>>? checkUser(
      {required CheckUserRequestDtoUseCase checkUserRequestDtoUseCase});

  Future<Either<Failure, LoginResponseDtoUseCase>>? login({required LoginRequestDtoUseCase loginRequestDtoUseCase});

  Future<Either<Failure, LoginResponseDtoUseCase>>? refreshToken({required Dio dio});
}
