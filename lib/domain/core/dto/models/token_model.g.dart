// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMToken _$VMTokenFromJson(Map<String, dynamic> json) => VMToken(
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      tokenType: json['tokenType'] as String?,
      expiresIn: json['expiresIn'] as int?,
      expiresOn: json['expiresOn'] as int?,
    );

Map<String, dynamic> _$VMTokenToJson(VMToken instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
      'expiresOn': instance.expiresOn,
    };
