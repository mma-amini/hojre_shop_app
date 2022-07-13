// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warranty_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMWarranty _$VMWarrantyFromJson(Map<String, dynamic> json) => VMWarranty(
      id: json['id'] as String?,
      warrantName: json['warrantName'] as String?,
      warrantDescription: json['warrantDescription'] as String?,
    );

Map<String, dynamic> _$VMWarrantyToJson(VMWarranty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'warrantName': instance.warrantName,
      'warrantDescription': instance.warrantDescription,
    };
