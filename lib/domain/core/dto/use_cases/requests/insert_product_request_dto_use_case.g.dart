// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_product_request_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertProductRequestDtoUseCase _$InsertProductRequestDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    InsertProductRequestDtoUseCase(
      ProductName: json['ProductName'] as String?,
      ProductId: json['ProductId'] as String?,
      ProductGroupId: json['ProductGroupId'] as String?,
      BrandId: json['BrandId'] as String?,
      BrandName: json['BrandName'] as String?,
      ProductPackWeight: json['ProductPackWeight'] as int?,
      ProductPackLength: json['ProductPackLength'] as int?,
      ProductPackWidth: json['ProductPackWidth'] as int?,
      ProductPackHeight: json['ProductPackHeight'] as int?,
      ProductPackWeightType: json['ProductPackWeightType'] as int?,
      Description: json['Description'] as String?,
      Original: json['Original'] as bool? ?? false,
      Sections: (json['Sections'] as List<dynamic>?)
          ?.map((e) => SectionOfInsertProductRequestDtoUseCase.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InsertProductRequestDtoUseCaseToJson(
        InsertProductRequestDtoUseCase instance) =>
    <String, dynamic>{
      'ProductName': instance.ProductName,
      'ProductId': instance.ProductId,
      'ProductGroupId': instance.ProductGroupId,
      'BrandId': instance.BrandId,
      'BrandName': instance.BrandName,
      'ProductPackWeight': instance.ProductPackWeight,
      'ProductPackLength': instance.ProductPackLength,
      'ProductPackWidth': instance.ProductPackWidth,
      'ProductPackHeight': instance.ProductPackHeight,
      'ProductPackWeightType': instance.ProductPackWeightType,
      'Description': instance.Description,
      'Original': instance.Original,
      'Sections': instance.Sections,
    };

SectionOfInsertProductRequestDtoUseCase
    _$SectionOfInsertProductRequestDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        SectionOfInsertProductRequestDtoUseCase(
          SpecId: json['SpecId'] as String?,
          Specs: (json['Specs'] as List<dynamic>?)
              ?.map((e) =>
                  DataOfSectionOfInsertProductRequestDtoUseCase.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$SectionOfInsertProductRequestDtoUseCaseToJson(
        SectionOfInsertProductRequestDtoUseCase instance) =>
    <String, dynamic>{
      'SpecId': instance.SpecId,
      'Specs': instance.Specs,
    };

DataOfSectionOfInsertProductRequestDtoUseCase
    _$DataOfSectionOfInsertProductRequestDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        DataOfSectionOfInsertProductRequestDtoUseCase(
          InputType: json['InputType'] as String?,
          SpecItemId: json['SpecItemId'] as String?,
          Value: json['Value'],
        );

Map<String, dynamic> _$DataOfSectionOfInsertProductRequestDtoUseCaseToJson(
        DataOfSectionOfInsertProductRequestDtoUseCase instance) =>
    <String, dynamic>{
      'InputType': instance.InputType,
      'SpecItemId': instance.SpecItemId,
      'Value': instance.Value,
    };
