// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warranty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMWarranty _$VMWarrantyFromJson(Map<String, dynamic> json) => VMWarranty(
      Id: json['Id'] as String?,
      WarrantName: json['WarrantName'] as String?,
      WarrantDescription: json['WarrantDescription'] as String?,
    );

Map<String, dynamic> _$VMWarrantyToJson(VMWarranty instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'WarrantName': instance.WarrantName,
      'WarrantDescription': instance.WarrantDescription,
    };
