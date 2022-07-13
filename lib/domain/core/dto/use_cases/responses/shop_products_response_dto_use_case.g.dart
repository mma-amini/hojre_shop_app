// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_products_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopProductsResponseDtoUseCase _$$_ShopProductsResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_ShopProductsResponseDtoUseCase(
      approvedProductDesignsCount: json['approvedProductDesignsCount'] as int?,
      brand: json['brand'] == null
          ? null
          : BrandOfShopProductsResponseDtoUseCase.fromJson(
              json['brand'] as Map<String, dynamic>),
      description: json['description'] as String?,
      isActive: json['isActive'] as bool?,
      isOriginal: json['isOriginal'] as bool?,
      notApprovedProductDesignsCount:
          json['notApprovedProductDesignsCount'] as int?,
      packingDimensions: json['packingDimensions'] as String?,
      packingWeight: (json['packingWeight'] as num?)?.toDouble(),
      pictures: (json['pictures'] as List<dynamic>?)
          ?.map((e) => PictureOfShopProductsResponseDtoUseCase.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      picture: json['picture'] as String?,
      productDimensions: json['productDimensions'] as String?,
      productId: json['productId'] as String?,
      productName: json['productName'] as String?,
      productWeight: (json['productWeight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ShopProductsResponseDtoUseCaseToJson(
        _$_ShopProductsResponseDtoUseCase instance) =>
    <String, dynamic>{
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
      'productId': instance.productId,
      'productName': instance.productName,
      'productWeight': instance.productWeight,
    };

_$_BrandOfShopProductsResponseDtoUseCase
    _$$_BrandOfShopProductsResponseDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        _$_BrandOfShopProductsResponseDtoUseCase(
          id: json['id'] as String?,
          name: json['name'] as String?,
          picture: json['picture'] as String?,
        );

Map<String, dynamic> _$$_BrandOfShopProductsResponseDtoUseCaseToJson(
        _$_BrandOfShopProductsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'picture': instance.picture,
    };

_$_PictureOfShopProductsResponseDtoUseCase
    _$$_PictureOfShopProductsResponseDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        _$_PictureOfShopProductsResponseDtoUseCase(
          isMain: json['isMain'] as bool?,
          picture: json['picture'] as String?,
        );

Map<String, dynamic> _$$_PictureOfShopProductsResponseDtoUseCaseToJson(
        _$_PictureOfShopProductsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'isMain': instance.isMain,
      'picture': instance.picture,
    };
