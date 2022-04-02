// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginResponseDtoUseCase _$$_LoginResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_LoginResponseDtoUseCase(
      UserID: json['UserID'] as String?,
      Username: json['Username'] as String?,
      FirstName: json['FirstName'] as String?,
      LastName: json['LastName'] as String?,
      AccessToken: json['AccessToken'] as String?,
      RefreshToken: json['RefreshToken'] as String?,
      TokenType: json['TokenType'] as String?,
      ExpiresIn: json['ExpiresIn'] as int?,
    );

Map<String, dynamic> _$$_LoginResponseDtoUseCaseToJson(
        _$_LoginResponseDtoUseCase instance) =>
    <String, dynamic>{
      'UserID': instance.UserID,
      'Username': instance.Username,
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
      'AccessToken': instance.AccessToken,
      'RefreshToken': instance.RefreshToken,
      'TokenType': instance.TokenType,
      'ExpiresIn': instance.ExpiresIn,
    };
