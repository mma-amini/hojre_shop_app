// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseDtoUseCase _$$_ResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_ResponseDtoUseCase(
      statusCode: json['statusCode'] as int?,
      message: json['message'] == null
          ? null
          : MessageDtoUseCase.fromJson(json['message'] as Map<String, dynamic>),
      content: json['content'],
    );

Map<String, dynamic> _$$_ResponseDtoUseCaseToJson(
        _$_ResponseDtoUseCase instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'content': instance.content,
    };
