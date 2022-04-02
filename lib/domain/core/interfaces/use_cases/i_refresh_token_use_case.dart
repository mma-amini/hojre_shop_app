import 'package:dio/dio.dart';

import '../../dto/use_cases/responses/login_response_dto_use_case.dart';
import 'i_use_case.dart';

abstract class IRefreshTokenUseCase implements IUseCase<LoginResponseDtoUseCase, Dio> {}
