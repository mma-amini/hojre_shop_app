// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMToken _$VMTokenFromJson(Map<String, dynamic> json) => VMToken(
      AccessToken: json['AccessToken'] as String?,
      RefreshToken: json['RefreshToken'] as String?,
      TokenType: json['TokenType'] as String?,
      ExpiresIn: json['ExpiresIn'] as int?,
      ExpiresOn: json['ExpiresOn'] as int?,
    );

Map<String, dynamic> _$VMTokenToJson(VMToken instance) => <String, dynamic>{
      'AccessToken': instance.AccessToken,
      'RefreshToken': instance.RefreshToken,
      'TokenType': instance.TokenType,
      'ExpiresIn': instance.ExpiresIn,
      'ExpiresOn': instance.ExpiresOn,
    };
