// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_groups_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductGroupsResponseDtoUseCase _$$_ProductGroupsResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_ProductGroupsResponseDtoUseCase(
      CategoryID: json['CategoryID'] as String?,
      ParentID: json['ParentID'] as String?,
      CategoryName: json['CategoryName'] as String?,
      Picture: json['Picture'] as String?,
    );

Map<String, dynamic> _$$_ProductGroupsResponseDtoUseCaseToJson(
        _$_ProductGroupsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'CategoryID': instance.CategoryID,
      'ParentID': instance.ParentID,
      'CategoryName': instance.CategoryName,
      'Picture': instance.Picture,
    };
