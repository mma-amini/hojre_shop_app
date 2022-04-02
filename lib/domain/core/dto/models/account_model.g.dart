// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMAccount _$VMAccountFromJson(Map<String, dynamic> json) => VMAccount(
      UserID: json['UserID'] as String?,
      Username: json['Username'] as String?,
      FirstName: json['FirstName'] as String?,
      LastName: json['LastName'] as String?,
    );

Map<String, dynamic> _$VMAccountToJson(VMAccount instance) => <String, dynamic>{
      'UserID': instance.UserID,
      'Username': instance.Username,
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
    };
