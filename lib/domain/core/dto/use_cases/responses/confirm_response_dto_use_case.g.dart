// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmResponseDtoUseCase _$ConfirmResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    ConfirmResponseDtoUseCase(
      Token: json['Token'] == null
          ? null
          : TokenOfConfirmResponseDtoUseCase.fromJson(
              json['Token'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfirmResponseDtoUseCaseToJson(
        ConfirmResponseDtoUseCase instance) =>
    <String, dynamic>{
      'Token': instance.Token,
    };

TokenOfConfirmResponseDtoUseCase _$TokenOfConfirmResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    TokenOfConfirmResponseDtoUseCase(
      AccessToken: json['AccessToken'] as String?,
      RefreshToken: json['RefreshToken'] as String?,
      TokenType: json['TokenType'] as String?,
      ExpiresIn: json['ExpiresIn'] as int?,
      ExpiresOn: json['ExpiresOn'] as int?,
    );

Map<String, dynamic> _$TokenOfConfirmResponseDtoUseCaseToJson(
        TokenOfConfirmResponseDtoUseCase instance) =>
    <String, dynamic>{
      'AccessToken': instance.AccessToken,
      'RefreshToken': instance.RefreshToken,
      'TokenType': instance.TokenType,
      'ExpiresIn': instance.ExpiresIn,
      'ExpiresOn': instance.ExpiresOn,
    };
