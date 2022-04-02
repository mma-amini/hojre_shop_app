import 'package:dartz/dartz.dart';
import 'package:dio/src/dio.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/check_user_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/login_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/check_user_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/login_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/helpers/exceptions.dart';
import 'package:hojre_shop_app/domain/core/helpers/failure.dart';
import 'package:hojre_shop_app/domain/core/interfaces/repositories/remote_data_source.dart';
import 'package:hojre_shop_app/domain/core/interfaces/repositories/repositories.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource baseRemoteDataSource;

  RepositoryImpl({required this.baseRemoteDataSource});

  @override
  Future<Either<Failure, LoginResponseDtoUseCase>>? refreshToken({required Dio dio}) async {
    try {
      var result = await baseRemoteDataSource.refreshToken(dio: dio);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CheckUserResponseDtoUseCase>>? checkUser(
      {required CheckUserRequestDtoUseCase checkUserRequestDtoUseCase}) async {
    try {
      var result = await baseRemoteDataSource.checkUser(checkUserRequestDtoUseCase: checkUserRequestDtoUseCase);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LoginResponseDtoUseCase>>? login(
      {required LoginRequestDtoUseCase loginRequestDtoUseCase}) async {
    try {
      var result = await baseRemoteDataSource.login(loginRequestDtoUseCase: loginRequestDtoUseCase);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
