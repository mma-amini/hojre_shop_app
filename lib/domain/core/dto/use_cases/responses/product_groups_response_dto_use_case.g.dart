// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_groups_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductGroupsResponseDtoUseCase _$$_ProductGroupsResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_ProductGroupsResponseDtoUseCase(
      id: json['id'] as String?,
      parentId: json['parentId'] as String?,
      categoryName: json['categoryName'] as String?,
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$$_ProductGroupsResponseDtoUseCaseToJson(
        _$_ProductGroupsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentId': instance.parentId,
      'categoryName': instance.categoryName,
      'picture': instance.picture,
    };
