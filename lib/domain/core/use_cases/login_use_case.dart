import 'package:dartz/dartz.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/login_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_login_use_case.dart';

import '../dto/use_cases/responses/login_response_dto_use_case.dart';
import '../helpers/failure.dart';
import '../interfaces/repositories/repositories.dart';

class LoginUseCase implements ILoginUseCase {
  final Repository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<Failure, LoginResponseDtoUseCase>> handler({LoginRequestDtoUseCase? params}) async {
    return await repository.login(loginRequestDtoUseCase: params!)!;
  }
}
