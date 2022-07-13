// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_product_picture_request_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertProductPictureRequestDtoUseCase
    _$InsertProductPictureRequestDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        InsertProductPictureRequestDtoUseCase(
          id: json['id'] as String?,
          productId: json['productId'] as String?,
          isMain: json['isMain'] as bool?,
          isUploaded: json['isUploaded'] as bool?,
          sort: json['sort'] as int?,
        );

Map<String, dynamic> _$InsertProductPictureRequestDtoUseCaseToJson(
        InsertProductPictureRequestDtoUseCase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productId': instance.productId,
      'isMain': instance.isMain,
      'isUploaded': instance.isUploaded,
      'sort': instance.sort,
    };
