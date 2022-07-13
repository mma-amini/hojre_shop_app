// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_specs_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupSpecsResponseDtoUseCase _$$_GroupSpecsResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_GroupSpecsResponseDtoUseCase(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemOfGroupSpecsResponseDtoUseCase.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      specId: json['specId'] as String?,
    );

Map<String, dynamic> _$$_GroupSpecsResponseDtoUseCaseToJson(
        _$_GroupSpecsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'items': instance.items,
      'name': instance.name,
      'specId': instance.specId,
    };

_$_ItemOfGroupSpecsResponseDtoUseCase
    _$$_ItemOfGroupSpecsResponseDtoUseCaseFromJson(Map<String, dynamic> json) =>
        _$_ItemOfGroupSpecsResponseDtoUseCase(
          inputName: json['inputName'] as String?,
          inputTitle: json['inputTitle'] as String?,
          name: json['name'] as String?,
          specItemId: json['specItemId'] as String?,
          values: (json['values'] as List<dynamic>?)
              ?.map((e) => ValueOfItemOfGroupSpecsResponseDtoUseCase.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_ItemOfGroupSpecsResponseDtoUseCaseToJson(
        _$_ItemOfGroupSpecsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'inputName': instance.inputName,
      'inputTitle': instance.inputTitle,
      'name': instance.name,
      'specItemId': instance.specItemId,
      'values': instance.values,
    };

_$_ValueOfItemOfGroupSpecsResponseDtoUseCase
    _$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        _$_ValueOfItemOfGroupSpecsResponseDtoUseCase(
          specValueId: json['specValueId'] as String?,
          title: json['title'] as String?,
        );

Map<String, dynamic> _$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseToJson(
        _$_ValueOfItemOfGroupSpecsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'specValueId': instance.specValueId,
      'title': instance.title,
    };
