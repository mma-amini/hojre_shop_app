// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMProductGroup _$VMProductGroupFromJson(Map<String, dynamic> json) =>
    VMProductGroup(
      categoryId: json['categoryId'] as String?,
      parentId: json['parentId'] as String?,
      categoryName: json['categoryName'] as String?,
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$VMProductGroupToJson(VMProductGroup instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'parentId': instance.parentId,
      'categoryName': instance.categoryName,
      'picture': instance.picture,
    };
