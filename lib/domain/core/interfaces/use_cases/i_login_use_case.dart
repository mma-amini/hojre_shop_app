import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/login_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/login_response_dto_use_case.dart';

import 'i_use_case.dart';

abstract class ILoginUseCase implements IUseCase<LoginResponseDtoUseCase, LoginRequestDtoUseCase> {}
