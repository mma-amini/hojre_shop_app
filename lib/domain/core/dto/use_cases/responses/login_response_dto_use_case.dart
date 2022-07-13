import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_dto_use_case.freezed.dart';
part 'login_response_dto_use_case.g.dart';

@freezed
class LoginResponseDtoUseCase with _$LoginResponseDtoUseCase {
  factory LoginResponseDtoUseCase({
    String? userId,
    String? username,
    String? firstName,
    String? lastName,
    String? shopId,
    String? shopName,
    String? accessToken,
    String? refreshToken,
    String? tokenType,
    int? expiresIn,
  }) = _LoginResponseDtoUseCase;

  factory LoginResponseDtoUseCase.fromJson(Map<String, dynamic> json) => _$LoginResponseDtoUseCaseFromJson(json);
}
