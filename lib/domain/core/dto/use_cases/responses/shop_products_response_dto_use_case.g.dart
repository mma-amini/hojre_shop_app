// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shop_products_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ShopProductsResponseDtoUseCase _$$_ShopProductsResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_ShopProductsResponseDtoUseCase(
      Brand: json['Brand'] == null
          ? null
          : BrandOfShopProductsResponseDtoUseCase.fromJson(
              json['Brand'] as Map<String, dynamic>),
      Description: json['Description'] as String?,
      IsOriginal: json['IsOriginal'] as bool?,
      PackingDimensions: json['PackingDimensions'] as String?,
      PackingWeight: (json['PackingWeight'] as num?)?.toDouble(),
      Pictures: (json['Pictures'] as List<dynamic>?)
          ?.map((e) => PictureOfShopProductsResponseDtoUseCase.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      Picture: json['Picture'] as String?,
      ProductDimensions: json['ProductDimensions'] as String?,
      ProductId: json['ProductId'] as String?,
      ProductName: json['ProductName'] as String?,
      ProductWeight: (json['ProductWeight'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$_ShopProductsResponseDtoUseCaseToJson(
        _$_ShopProductsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'Brand': instance.Brand,
      'Description': instance.Description,
      'IsOriginal': instance.IsOriginal,
      'PackingDimensions': instance.PackingDimensions,
      'PackingWeight': instance.PackingWeight,
      'Pictures': instance.Pictures,
      'Picture': instance.Picture,
      'ProductDimensions': instance.ProductDimensions,
      'ProductId': instance.ProductId,
      'ProductName': instance.ProductName,
      'ProductWeight': instance.ProductWeight,
    };

_$_BrandOfShopProductsResponseDtoUseCase
    _$$_BrandOfShopProductsResponseDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        _$_BrandOfShopProductsResponseDtoUseCase(
          Id: json['Id'] as String?,
          Name: json['Name'] as String?,
          Picture: json['Picture'] as String?,
        );

Map<String, dynamic> _$$_BrandOfShopProductsResponseDtoUseCaseToJson(
        _$_BrandOfShopProductsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'Name': instance.Name,
      'Picture': instance.Picture,
    };

_$_PictureOfShopProductsResponseDtoUseCase
    _$$_PictureOfShopProductsResponseDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        _$_PictureOfShopProductsResponseDtoUseCase(
          IsMain: json['IsMain'] as bool?,
          Picture: json['Picture'] as String?,
        );

Map<String, dynamic> _$$_PictureOfShopProductsResponseDtoUseCaseToJson(
        _$_PictureOfShopProductsResponseDtoUseCase instance) =>
    <String, dynamic>{
      'IsMain': instance.IsMain,
      'Picture': instance.Picture,
    };
