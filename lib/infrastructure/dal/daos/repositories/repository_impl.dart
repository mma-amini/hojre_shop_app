import 'package:dartz/dartz.dart';
import 'package:dio/src/dio.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/confirm_response_dto_use_case.dart';

import '../../../../domain/core/helpers/exceptions.dart';
import '../../../../domain/core/helpers/failure.dart';
import '../../../../domain/core/interfaces/repositories/remote_data_source.dart';
import '../../../../domain/core/interfaces/repositories/repositories.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource baseRemoteDataSource;

  RepositoryImpl({required this.baseRemoteDataSource});

  @override
  Future<Either<Failure, ConfirmResponseDtoUseCase>>? refreshToken({required Dio dio}) async {
    try {
      var result = await baseRemoteDataSource.refreshToken(dio: dio);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
