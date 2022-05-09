// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMProduct _$VMProductFromJson(Map<String, dynamic> json) => VMProduct(
      Brand: json['Brand'] == null
          ? null
          : VMBrand.fromJson(json['Brand'] as Map<String, dynamic>),
      Description: json['Description'] as String?,
      IsOriginal: json['IsOriginal'] as bool?,
      PackingDimensions: json['PackingDimensions'] as String?,
      PackingWeight: (json['PackingWeight'] as num?)?.toDouble(),
      Pictures: (json['Pictures'] as List<dynamic>?)
          ?.map((e) => VMProductPicture.fromJson(e as Map<String, dynamic>))
          .toList(),
      Picture: json['Picture'] as String?,
      ProductDimensions: json['ProductDimensions'] as String?,
      ProductId: json['ProductId'] as String?,
      ProductName: json['ProductName'] as String?,
      ProductWeight: (json['ProductWeight'] as num?)?.toDouble(),
    )
      ..ApprovedProductDesignsCount =
          json['ApprovedProductDesignsCount'] as int?
      ..NotApprovedProductDesignsCount =
          json['NotApprovedProductDesignsCount'] as int?;

Map<String, dynamic> _$VMProductToJson(VMProduct instance) => <String, dynamic>{
      'ApprovedProductDesignsCount': instance.ApprovedProductDesignsCount,
      'Brand': instance.Brand,
      'Description': instance.Description,
      'IsOriginal': instance.IsOriginal,
      'NotApprovedProductDesignsCount': instance.NotApprovedProductDesignsCount,
      'PackingDimensions': instance.PackingDimensions,
      'PackingWeight': instance.PackingWeight,
      'Pictures': instance.Pictures,
      'Picture': instance.Picture,
      'ProductDimensions': instance.ProductDimensions,
      'ProductId': instance.ProductId,
      'ProductName': instance.ProductName,
      'ProductWeight': instance.ProductWeight,
    };

VMProductPicture _$VMProductPictureFromJson(Map<String, dynamic> json) =>
    VMProductPicture(
      IsMain: json['IsMain'] as bool?,
      Picture: json['Picture'] as String?,
    );

Map<String, dynamic> _$VMProductPictureToJson(VMProductPicture instance) =>
    <String, dynamic>{
      'IsMain': instance.IsMain,
      'Picture': instance.Picture,
    };
