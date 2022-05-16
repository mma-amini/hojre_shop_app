// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_specs_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupSpecsResponseDtoUseCase _$$_GroupSpecsResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_GroupSpecsResponseDtoUseCase(
      Items: (json['Items'] as List<dynamic>?)
          ?.map((e) => ItemOfGroupSpecsResponseDtoUseCase.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      Name: json['Name'] as String?,
      SpecId: json['SpecId'] as String?,
    );

Map<String, dynamic> _$$_GroupSpecsResponseDtoUseCaseToJson(
        _$_GroupSpecsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'Items': instance.Items,
      'Name': instance.Name,
      'SpecId': instance.SpecId,
    };

_$_ItemOfGroupSpecsResponseDtoUseCase
    _$$_ItemOfGroupSpecsResponseDtoUseCaseFromJson(Map<String, dynamic> json) =>
        _$_ItemOfGroupSpecsResponseDtoUseCase(
          InputName: json['InputName'] as String?,
          InputTitle: json['InputTitle'] as String?,
          Name: json['Name'] as String?,
          SpecItemId: json['SpecItemId'] as String?,
          Values: (json['Values'] as List<dynamic>?)
              ?.map((e) => ValueOfItemOfGroupSpecsResponseDtoUseCase.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$_ItemOfGroupSpecsResponseDtoUseCaseToJson(
        _$_ItemOfGroupSpecsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'InputName': instance.InputName,
      'InputTitle': instance.InputTitle,
      'Name': instance.Name,
      'SpecItemId': instance.SpecItemId,
      'Values': instance.Values,
    };

_$_ValueOfItemOfGroupSpecsResponseDtoUseCase
    _$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        _$_ValueOfItemOfGroupSpecsResponseDtoUseCase(
          SpecValueId: json['SpecValueId'] as String?,
          Title: json['Title'] as String?,
        );

Map<String, dynamic> _$$_ValueOfItemOfGroupSpecsResponseDtoUseCaseToJson(
        _$_ValueOfItemOfGroupSpecsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'SpecValueId': instance.SpecValueId,
      'Title': instance.Title,
    };
