import 'package:dartz/dartz.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/check_user_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/check_user_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_check_user_use_case.dart';

import '../helpers/failure.dart';
import '../interfaces/repositories/repositories.dart';

class CheckUserUseCase implements ICheckUserUseCase {
  final Repository repository;

  CheckUserUseCase({required this.repository});

  @override
  Future<Either<Failure, CheckUserResponseDtoUseCase>> Handler({CheckUserRequestDtoUseCase? params}) async {
    return await repository.checkUser(checkUserRequestDtoUseCase: params!)!;
  }
}
