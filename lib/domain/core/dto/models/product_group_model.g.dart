// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMProductGroup _$VMProductGroupFromJson(Map<String, dynamic> json) =>
    VMProductGroup(
      CategoryId: json['CategoryId'] as String?,
      ParentId: json['ParentId'] as String?,
      CategoryName: json['CategoryName'] as String?,
      Picture: json['Picture'] as String?,
    );

Map<String, dynamic> _$VMProductGroupToJson(VMProductGroup instance) =>
    <String, dynamic>{
      'CategoryId': instance.CategoryId,
      'ParentId': instance.ParentId,
      'CategoryName': instance.CategoryName,
      'Picture': instance.Picture,
    };
