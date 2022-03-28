import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../dto/use_cases/responses/confirm_response_dto_use_case.dart';
import '../helpers/failure.dart';
import '../interfaces/repositories/repositories.dart';
import '../interfaces/use_cases/i_refresh_token_use_case.dart';

class RefreshTokenUseCase implements IRefreshTokenUseCase {
  final Repository repository;

  RefreshTokenUseCase({required this.repository});

  @override
  Future<Either<Failure, ConfirmResponseDtoUseCase>> Handler({Dio? params}) async {
    return await repository.refreshToken(dio: params!)!;
  }
}
