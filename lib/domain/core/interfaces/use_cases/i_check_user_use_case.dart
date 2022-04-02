import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/check_user_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/check_user_response_dto_use_case.dart';

import 'i_use_case.dart';

abstract class ICheckUserUseCase implements IUseCase<CheckUserResponseDtoUseCase, CheckUserRequestDtoUseCase> {}
