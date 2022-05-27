// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_user_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CheckUserResponseDtoUseCase _$$_CheckUserResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_CheckUserResponseDtoUseCase(
      ClientSecret: json['ClientSecret'] as String?,
      Code: json['Code'] as String?,
      Minutes: json['Minutes'] as int?,
    );

Map<String, dynamic> _$$_CheckUserResponseDtoUseCaseToJson(
        _$_CheckUserResponseDtoUseCase instance) =>
    <String, dynamic>{
      'ClientSecret': instance.ClientSecret,
      'Code': instance.Code,
      'Minutes': instance.Minutes,
    };
