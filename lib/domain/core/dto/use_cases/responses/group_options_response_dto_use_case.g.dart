// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_options_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupOptionsResponseDtoUseCase _$$_GroupOptionsResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_GroupOptionsResponseDtoUseCase(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemOfGroupOptionsResponseDtoUseCase.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$$_GroupOptionsResponseDtoUseCaseToJson(
        _$_GroupOptionsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'items': instance.items,
      'name': instance.name,
      'id': instance.id,
    };

_$_ItemOfGroupOptionsResponseDtoUseCase
    _$$_ItemOfGroupOptionsResponseDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        _$_ItemOfGroupOptionsResponseDtoUseCase(
          inputName: json['inputName'] as String?,
          inputTitle: json['inputTitle'] as String?,
          name: json['name'] as String?,
          id: json['id'] as String?,
          values: (json['values'] as List<dynamic>?)
              ?.map((e) => ValueOfItemOfGroupOptionsResponseDtoUseCase.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_ItemOfGroupOptionsResponseDtoUseCaseToJson(
        _$_ItemOfGroupOptionsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'inputName': instance.inputName,
      'inputTitle': instance.inputTitle,
      'name': instance.name,
      'id': instance.id,
      'values': instance.values,
    };

_$_ValueOfItemOfGroupOptionsResponseDtoUseCase
    _$$_ValueOfItemOfGroupOptionsResponseDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        _$_ValueOfItemOfGroupOptionsResponseDtoUseCase(
          id: json['id'] as String?,
          title: json['title'] as String?,
          value: json['value'] as String?,
        );

Map<String, dynamic> _$$_ValueOfItemOfGroupOptionsResponseDtoUseCaseToJson(
        _$_ValueOfItemOfGroupOptionsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'value': instance.value,
    };
