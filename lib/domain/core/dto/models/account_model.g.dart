// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMAccount _$VMAccountFromJson(Map<String, dynamic> json) => VMAccount(
      userId: json['userId'] as String?,
      username: json['username'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      shopId: json['shopId'] as String?,
      shopName: json['shopName'] as String?,
      clientSecret: json['clientSecret'] as String?,
    );

Map<String, dynamic> _$VMAccountToJson(VMAccount instance) => <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'shopId': instance.shopId,
      'shopName': instance.shopName,
      'clientSecret': instance.clientSecret,
    };
