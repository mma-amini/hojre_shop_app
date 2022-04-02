import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_dto_use_case.freezed.dart';
part 'login_response_dto_use_case.g.dart';

@freezed
class LoginResponseDtoUseCase with _$LoginResponseDtoUseCase {
  factory LoginResponseDtoUseCase({
    String? UserID,
    String? Username,
    String? FirstName,
    String? LastName,
    String? AccessToken,
    String? RefreshToken,
    String? TokenType,
    int? ExpiresIn,
  }) = _LoginResponseDtoUseCase;

  factory LoginResponseDtoUseCase.fromJson(Map<String, dynamic> json) => _$LoginResponseDtoUseCaseFromJson(json);
}
