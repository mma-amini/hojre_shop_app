// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_spec_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMGroupSpec _$VMGroupSpecFromJson(Map<String, dynamic> json) => VMGroupSpec(
      Items: (json['Items'] as List<dynamic>?)
          ?.map((e) => VMSpecItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      Name: json['Name'] as String?,
      SpecId: json['SpecId'] as String?,
    );

Map<String, dynamic> _$VMGroupSpecToJson(VMGroupSpec instance) =>
    <String, dynamic>{
      'Items': instance.Items,
      'Name': instance.Name,
      'SpecId': instance.SpecId,
    };

VMSpecItem _$VMSpecItemFromJson(Map<String, dynamic> json) => VMSpecItem(
      InputName: json['InputName'] as String?,
      InputTitle: json['InputTitle'] as String?,
      Name: json['Name'] as String?,
      SpecItemId: json['SpecItemId'] as String?,
      Values: (json['Values'] as List<dynamic>?)
          ?.map((e) => VMSpecValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      SelectedItem: json['SelectedItem'] == null
          ? null
          : VMSpecValue.fromJson(json['SelectedItem'] as Map<String, dynamic>),
      SelectedItems: (json['SelectedItems'] as List<dynamic>?)
          ?.map((e) => VMSpecValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      TypedText: json['TypedText'] as String?,
      BooleanValue: json['BooleanValue'] as bool?,
    );

Map<String, dynamic> _$VMSpecItemToJson(VMSpecItem instance) =>
    <String, dynamic>{
      'InputName': instance.InputName,
      'InputTitle': instance.InputTitle,
      'Name': instance.Name,
      'SpecItemId': instance.SpecItemId,
      'Values': instance.Values,
      'SelectedItem': instance.SelectedItem,
      'SelectedItems': instance.SelectedItems,
      'TypedText': instance.TypedText,
      'BooleanValue': instance.BooleanValue,
    };

VMSpecValue _$VMSpecValueFromJson(Map<String, dynamic> json) => VMSpecValue(
      SpecValueId: json['SpecValueId'] as String?,
      Title: json['Title'] as String?,
    );

Map<String, dynamic> _$VMSpecValueToJson(VMSpecValue instance) =>
    <String, dynamic>{
      'SpecValueId': instance.SpecValueId,
      'Title': instance.Title,
    };
