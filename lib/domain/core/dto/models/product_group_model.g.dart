// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMProductGroup _$VMProductGroupFromJson(Map<String, dynamic> json) =>
    VMProductGroup(
      CategoryID: json['CategoryID'] as String?,
      ParentID: json['ParentID'] as String?,
      CategoryName: json['CategoryName'] as String?,
      Picture: json['Picture'] as String?,
    );

Map<String, dynamic> _$VMProductGroupToJson(VMProductGroup instance) =>
    <String, dynamic>{
      'CategoryID': instance.CategoryID,
      'ParentID': instance.ParentID,
      'CategoryName': instance.CategoryName,
      'Picture': instance.Picture,
    };