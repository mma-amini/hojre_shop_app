// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponseDtoUseCase _$$_ResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_ResponseDtoUseCase(
      StatusCode: json['StatusCode'] as int?,
      Message: json['Message'] == null
          ? null
          : MessageDtoUseCase.fromJson(json['Message'] as Map<String, dynamic>),
      Content: json['Content'],
    );

Map<String, dynamic> _$$_ResponseDtoUseCaseToJson(
        _$_ResponseDtoUseCase instance) =>
    <String, dynamic>{
      'StatusCode': instance.StatusCode,
      'Message': instance.Message,
      'Content': instance.Content,
    };
