// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_product_request_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertProductRequestDtoUseCase _$InsertProductRequestDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    InsertProductRequestDtoUseCase(
      productName: json['productName'] as String?,
      productId: json['productId'] as String?,
      productGroupId: json['productGroupId'] as String?,
      brandId: json['brandId'] as String?,
      brandName: json['brandName'] as String?,
      productPackWeight: json['productPackWeight'] as int?,
      productPackLength: json['productPackLength'] as int?,
      productPackWidth: json['productPackWidth'] as int?,
      productPackHeight: json['productPackHeight'] as int?,
      productPackWeightType: json['productPackWeightType'] as int?,
      description: json['description'] as String?,
      original: json['original'] as bool? ?? false,
      sections: (json['sections'] as List<dynamic>?)
          ?.map((e) => SectionOfInsertProductRequestDtoUseCase.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InsertProductRequestDtoUseCaseToJson(
        InsertProductRequestDtoUseCase instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'productId': instance.productId,
      'productGroupId': instance.productGroupId,
      'brandId': instance.brandId,
      'brandName': instance.brandName,
      'productPackWeight': instance.productPackWeight,
      'productPackLength': instance.productPackLength,
      'productPackWidth': instance.productPackWidth,
      'productPackHeight': instance.productPackHeight,
      'productPackWeightType': instance.productPackWeightType,
      'description': instance.description,
      'original': instance.original,
      'sections': instance.sections,
    };

SectionOfInsertProductRequestDtoUseCase
    _$SectionOfInsertProductRequestDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        SectionOfInsertProductRequestDtoUseCase(
          specId: json['specId'] as String?,
          specs: (json['specs'] as List<dynamic>?)
              ?.map((e) =>
                  DataOfSectionOfInsertProductRequestDtoUseCase.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$SectionOfInsertProductRequestDtoUseCaseToJson(
        SectionOfInsertProductRequestDtoUseCase instance) =>
    <String, dynamic>{
      'specId': instance.specId,
      'specs': instance.specs,
    };

DataOfSectionOfInsertProductRequestDtoUseCase
    _$DataOfSectionOfInsertProductRequestDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        DataOfSectionOfInsertProductRequestDtoUseCase(
          inputType: json['inputType'] as String?,
          specItemId: json['specItemId'] as String?,
          value: json['value'],
        );

Map<String, dynamic> _$DataOfSectionOfInsertProductRequestDtoUseCaseToJson(
        DataOfSectionOfInsertProductRequestDtoUseCase instance) =>
    <String, dynamic>{
      'inputType': instance.inputType,
      'specItemId': instance.specItemId,
      'value': instance.value,
    };
