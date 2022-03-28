import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_dto_use_case.g.dart';

@JsonSerializable()
class MessageDtoUseCase extends Equatable {
  final String? Text;
  final String? ShowType;

  MessageDtoUseCase({this.Text, this.ShowType});

  factory MessageDtoUseCase.fromJson(Map<String, dynamic> json) => _$MessageDtoUseCaseFromJson(json);

  Map<String, dynamic> toJson() => _$MessageDtoUseCaseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
