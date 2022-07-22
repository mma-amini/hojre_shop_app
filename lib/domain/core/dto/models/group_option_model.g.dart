// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMGroupOption _$VMGroupOptionFromJson(Map<String, dynamic> json) =>
    VMGroupOption(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => VMOptionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$VMGroupOptionToJson(VMGroupOption instance) =>
    <String, dynamic>{
      'items': instance.items,
      'name': instance.name,
      'id': instance.id,
    };

VMOptionItem _$VMOptionItemFromJson(Map<String, dynamic> json) => VMOptionItem(
      inputName: json['inputName'] as String?,
      inputTitle: json['inputTitle'] as String?,
      name: json['name'] as String?,
      id: json['id'] as String?,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => VMOptionValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      selectedItem: json['selectedItem'] == null
          ? null
          : VMOptionValue.fromJson(
              json['selectedItem'] as Map<String, dynamic>),
      selectedItems: (json['selectedItems'] as List<dynamic>?)
          ?.map((e) => VMOptionValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      typedText: json['typedText'] as String?,
      booleanValue: json['booleanValue'] as bool?,
      isRequired: json['isRequired'] as bool?,
    );

Map<String, dynamic> _$VMOptionItemToJson(VMOptionItem instance) =>
    <String, dynamic>{
      'inputName': instance.inputName,
      'inputTitle': instance.inputTitle,
      'name': instance.name,
      'id': instance.id,
      'values': instance.values,
      'selectedItem': instance.selectedItem,
      'selectedItems': instance.selectedItems,
      'typedText': instance.typedText,
      'booleanValue': instance.booleanValue,
      'isRequired': instance.isRequired,
    };

VMOptionValue _$VMOptionValueFromJson(Map<String, dynamic> json) =>
    VMOptionValue(
      id: json['id'] as String?,
      title: json['title'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$VMOptionValueToJson(VMOptionValue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'value': instance.value,
    };
