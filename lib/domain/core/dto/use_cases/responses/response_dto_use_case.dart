import 'package:freezed_annotation/freezed_annotation.dart';

import 'message_dto_use_case.dart';

part 'response_dto_use_case.freezed.dart';
part 'response_dto_use_case.g.dart';

@freezed
class ResponseDtoUseCase with _$ResponseDtoUseCase {
  factory ResponseDtoUseCase({
    int? StatusCode,
    MessageDtoUseCase? Message,
    dynamic? Content,
  }) = _ResponseDtoUseCase;

  factory ResponseDtoUseCase.fromJson(Map<String, dynamic> json) => _$ResponseDtoUseCaseFromJson(json);
}
