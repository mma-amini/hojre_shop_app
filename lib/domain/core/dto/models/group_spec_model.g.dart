// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_spec_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMGroupSpec _$VMGroupSpecFromJson(Map<String, dynamic> json) => VMGroupSpec(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => VMSpecItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      specId: json['specId'] as String?,
    );

Map<String, dynamic> _$VMGroupSpecToJson(VMGroupSpec instance) =>
    <String, dynamic>{
      'items': instance.items,
      'name': instance.name,
      'specId': instance.specId,
    };

VMSpecItem _$VMSpecItemFromJson(Map<String, dynamic> json) => VMSpecItem(
      inputName: json['inputName'] as String?,
      inputTitle: json['inputTitle'] as String?,
      name: json['name'] as String?,
      specItemId: json['specItemId'] as String?,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => VMSpecValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedItem: json['selectedItem'] == null
          ? null
          : VMSpecValue.fromJson(json['selectedItem'] as Map<String, dynamic>),
      selectedItems: (json['selectedItems'] as List<dynamic>?)
          ?.map((e) => VMSpecValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      typedText: json['typedText'] as String?,
      booleanValue: json['booleanValue'] as bool?,
      isRequired: json['isRequired'] as bool?,
    );

Map<String, dynamic> _$VMSpecItemToJson(VMSpecItem instance) =>
    <String, dynamic>{
      'inputName': instance.inputName,
      'inputTitle': instance.inputTitle,
      'name': instance.name,
      'specItemId': instance.specItemId,
      'values': instance.values,
      'selectedItem': instance.selectedItem,
      'selectedItems': instance.selectedItems,
      'typedText': instance.typedText,
      'booleanValue': instance.booleanValue,
      'isRequired': instance.isRequired,
    };

VMSpecValue _$VMSpecValueFromJson(Map<String, dynamic> json) => VMSpecValue(
      specValueId: json['specValueId'] as String?,
      title: json['title'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$VMSpecValueToJson(VMSpecValue instance) =>
    <String, dynamic>{
      'specValueId': instance.specValueId,
      'title': instance.title,
      'value': instance.value,
    };
