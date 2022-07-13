import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_dto_use_case.freezed.dart';
part 'message_dto_use_case.g.dart';

@freezed
class MessageDtoUseCase with _$MessageDtoUseCase {
  factory MessageDtoUseCase({
    String? text,
    String? showType,
  }) = _MessageDtoUseCase;

  factory MessageDtoUseCase.fromJson(Map<String, dynamic> json) => _$MessageDtoUseCaseFromJson(json);
}
