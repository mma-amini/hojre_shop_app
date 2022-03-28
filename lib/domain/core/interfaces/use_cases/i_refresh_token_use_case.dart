import 'package:dio/dio.dart';

import '../../dto/use_cases/responses/confirm_response_dto_use_case.dart';
import 'i_use_case.dart';

abstract class IRefreshTokenUseCase implements IUseCase<ConfirmResponseDtoUseCase, Dio> {}
