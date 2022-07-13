// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginResponseDtoUseCase _$$_LoginResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_LoginResponseDtoUseCase(
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      shopId: json['shopId'] as String?,
      shopName: json['shopName'] as String?,
      accessToken: json['accessToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      tokenType: json['tokenType'] as String?,
      expiresIn: json['expiresIn'] as int?,
    );

Map<String, dynamic> _$$_LoginResponseDtoUseCaseToJson(
        _$_LoginResponseDtoUseCase instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'shopId': instance.shopId,
      'shopName': instance.shopName,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
    };
