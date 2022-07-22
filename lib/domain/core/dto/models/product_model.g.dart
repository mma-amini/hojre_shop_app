// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMProduct _$VMProductFromJson(Map<String, dynamic> json) => VMProduct(
      brand: json['brand'] == null
          ? null
          : VMBrand.fromJson(json['brand'] as Map<String, dynamic>),
      description: json['description'] as String?,
      isActive: json['isActive'] as bool?,
      isOriginal: json['isOriginal'] as bool?,
      packingDimensions: json['packingDimensions'] as String?,
      packingWeight: (json['packingWeight'] as num?)?.toDouble(),
      pictures: (json['pictures'] as List<dynamic>?)
          ?.map((e) => VMProductPicture.fromJson(e as Map<String, dynamic>))
          .toList(),
      picture: json['picture'] as String?,
      productDimensions: json['productDimensions'] as String?,
      id: json['id'] as String?,
      productName: json['productName'] as String?,
      productWeight: (json['productWeight'] as num?)?.toDouble(),
    )
      ..approvedProductDesignsCount =
          json['approvedProductDesignsCount'] as int?
      ..notApprovedProductDesignsCount =
          json['notApprovedProductDesignsCount'] as int?;

Map<String, dynamic> _$VMProductToJson(VMProduct instance) => <String, dynamic>{
      'approvedProductDesignsCount': instance.approvedProductDesignsCount,
      'brand': instance.brand,
      'description': instance.description,
      'isActive': instance.isActive,
      'isOriginal': instance.isOriginal,
      'notApprovedProductDesignsCount': instance.notApprovedProductDesignsCount,
      'packingDimensions': instance.packingDimensions,
      'packingWeight': instance.packingWeight,
      'pictures': instance.pictures,
      'picture': instance.picture,
      'productDimensions': instance.productDimensions,
      'id': instance.id,
      'productName': instance.productName,
      'productWeight': instance.productWeight,
    };

VMProductPicture _$VMProductPictureFromJson(Map<String, dynamic> json) =>
    VMProductPicture(
      isMain: json['isMain'] as bool?,
      picture: json['picture'] as String?,
    );

Map<String, dynamic> _$VMProductPictureToJson(VMProductPicture instance) =>
    <String, dynamic>{
      'isMain': instance.isMain,
      'picture': instance.picture,
    };

VMSendProductPicture _$VMSendProductPictureFromJson(
        Map<String, dynamic> json) =>
    VMSendProductPicture(
      id: json['id'] as String?,
      isUploaded: json['isUploaded'] as bool?,
      isMain: json['isMain'] as bool?,
    );

Map<String, dynamic> _$VMSendProductPictureToJson(
        VMSendProductPicture instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isUploaded': instance.isUploaded,
      'isMain': instance.isMain,
    };
