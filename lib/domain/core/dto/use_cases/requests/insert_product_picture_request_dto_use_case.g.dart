// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_product_picture_request_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertProductPictureRequestDtoUseCase
    _$InsertProductPictureRequestDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        InsertProductPictureRequestDtoUseCase(
          Id: json['Id'] as String?,
          ProductId: json['ProductId'] as String?,
          IsMain: json['IsMain'] as bool?,
          IsUploaded: json['IsUploaded'] as bool?,
          Sort: json['Sort'] as int?,
        );

Map<String, dynamic> _$InsertProductPictureRequestDtoUseCaseToJson(
        InsertProductPictureRequestDtoUseCase instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'ProductId': instance.ProductId,
      'IsMain': instance.IsMain,
      'IsUploaded': instance.IsUploaded,
      'Sort': instance.Sort,
    };
