// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseDtoUseCase _$ResponseDtoUseCaseFromJson(Map<String, dynamic> json) =>
    ResponseDtoUseCase(
      StatusCode: json['StatusCode'] as int?,
      Message: json['Message'] == null
          ? null
          : MessageDtoUseCase.fromJson(json['Message'] as Map<String, dynamic>),
      Content: json['Content'],
    );

Map<String, dynamic> _$ResponseDtoUseCaseToJson(ResponseDtoUseCase instance) =>
    <String, dynamic>{
      'StatusCode': instance.StatusCode,
      'Message': instance.Message,
      'Content': instance.Content,
    };
