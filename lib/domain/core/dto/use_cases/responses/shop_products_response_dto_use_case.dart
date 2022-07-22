import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_products_response_dto_use_case.freezed.dart';
part 'shop_products_response_dto_use_case.g.dart';

@freezed
class ShopProductsResponseDtoUseCase with _$ShopProductsResponseDtoUseCase {
  factory ShopProductsResponseDtoUseCase({
    int? approvedProductDesignsCount,
    BrandOfShopProductsResponseDtoUseCase? brand,
    String? description,
    bool? isActive,
    bool? isOriginal,
    int? notApprovedProductDesignsCount,
    String? packingDimensions,
    double? packingWeight,
    List<PictureOfShopProductsResponseDtoUseCase>? pictures,
    String? picture,
    String? productDimensions,
    String? id,
    String? productName,
    double? productWeight,
  }) = _ShopProductsResponseDtoUseCase;

  factory ShopProductsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$ShopProductsResponseDtoUseCaseFromJson(json);
}

@freezed
class BrandOfShopProductsResponseDtoUseCase with _$BrandOfShopProductsResponseDtoUseCase {
  factory BrandOfShopProductsResponseDtoUseCase({
    String? id,
    String? name,
    String? picture,
  }) = _BrandOfShopProductsResponseDtoUseCase;

  factory BrandOfShopProductsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$BrandOfShopProductsResponseDtoUseCaseFromJson(json);
}

@freezed
class PictureOfShopProductsResponseDtoUseCase with _$PictureOfShopProductsResponseDtoUseCase {
  factory PictureOfShopProductsResponseDtoUseCase({
    bool? isMain,
    String? picture,
  }) = _PictureOfShopProductsResponseDtoUseCase;

  factory PictureOfShopProductsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$PictureOfShopProductsResponseDtoUseCaseFromJson(json);
}
