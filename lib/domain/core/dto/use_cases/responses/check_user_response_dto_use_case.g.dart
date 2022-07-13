// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_user_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckUserResponseDtoUseCase _$$_CheckUserResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_CheckUserResponseDtoUseCase(
      clientSecret: json['clientSecret'] as String?,
      code: json['code'] as String?,
      minutes: json['minutes'] as int?,
    );

Map<String, dynamic> _$$_CheckUserResponseDtoUseCaseToJson(
        _$_CheckUserResponseDtoUseCase instance) =>
    <String, dynamic>{
      'clientSecret': instance.clientSecret,
      'code': instance.code,
      'minutes': instance.minutes,
    };
