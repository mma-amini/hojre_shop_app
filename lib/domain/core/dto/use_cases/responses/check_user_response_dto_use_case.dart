import 'package:freezed_annotation/freezed_annotation.dart';

part 'check_user_response_dto_use_case.freezed.dart';
part 'check_user_response_dto_use_case.g.dart';

@freezed
class CheckUserResponseDtoUseCase with _$CheckUserResponseDtoUseCase {
  factory CheckUserResponseDtoUseCase({
    String? Code,
    int? Minutes,
  }) = _CheckUserResponseDtoUseCase;

  factory CheckUserResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$CheckUserResponseDtoUseCaseFromJson(json);
}
