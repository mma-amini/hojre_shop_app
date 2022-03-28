import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'message_dto_use_case.dart';

part 'response_dto_use_case.g.dart';

@JsonSerializable()
class ResponseDtoUseCase extends Equatable {
  final int? StatusCode;
  final MessageDtoUseCase? Message;
  final dynamic Content;

  ResponseDtoUseCase({required this.StatusCode, required this.Message, required this.Content});

  factory ResponseDtoUseCase.fromJson(Map<String, dynamic> json) => _$ResponseDtoUseCaseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseDtoUseCaseToJson(this);

  @override
  List<Object?> get props => [];
}
