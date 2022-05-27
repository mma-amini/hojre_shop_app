// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMAccount _$VMAccountFromJson(Map<String, dynamic> json) => VMAccount(
      UserId: json['UserId'] as String?,
      Username: json['Username'] as String?,
      FirstName: json['FirstName'] as String?,
      LastName: json['LastName'] as String?,
      ShopId: json['ShopId'] as String?,
      ShopName: json['ShopName'] as String?,
      ClientSecret: json['ClientSecret'] as String?,
    );

Map<String, dynamic> _$VMAccountToJson(VMAccount instance) => <String, dynamic>{
      'UserId': instance.UserId,
      'Username': instance.Username,
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
      'ShopId': instance.ShopId,
      'ShopName': instance.ShopName,
      'ClientSecret': instance.ClientSecret,
    };
