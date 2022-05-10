import 'package:freezed_annotation/freezed_annotation.dart';

part 'shop_products_response_dto_use_case.freezed.dart';
part 'shop_products_response_dto_use_case.g.dart';

@freezed
class ShopProductsResponseDtoUseCase with _$ShopProductsResponseDtoUseCase {
  factory ShopProductsResponseDtoUseCase({
    int? ApprovedProductDesignsCount,
    BrandOfShopProductsResponseDtoUseCase? Brand,
    String? Description,
    bool? IsActive,
    bool? IsOriginal,
    int? NotApprovedProductDesignsCount,
    String? PackingDimensions,
    double? PackingWeight,
    List<PictureOfShopProductsResponseDtoUseCase>? Pictures,
    String? Picture,
    String? ProductDimensions,
    String? ProductId,
    String? ProductName,
    double? ProductWeight,
  }) = _ShopProductsResponseDtoUseCase;

  factory ShopProductsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$ShopProductsResponseDtoUseCaseFromJson(json);
}

@freezed
class BrandOfShopProductsResponseDtoUseCase with _$BrandOfShopProductsResponseDtoUseCase {
  factory BrandOfShopProductsResponseDtoUseCase({
    String? Id,
    String? Name,
    String? Picture,
  }) = _BrandOfShopProductsResponseDtoUseCase;

  factory BrandOfShopProductsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$BrandOfShopProductsResponseDtoUseCaseFromJson(json);
}

@freezed
class PictureOfShopProductsResponseDtoUseCase with _$PictureOfShopProductsResponseDtoUseCase {
  factory PictureOfShopProductsResponseDtoUseCase({
    bool? IsMain,
    String? Picture,
  }) = _PictureOfShopProductsResponseDtoUseCase;

  factory PictureOfShopProductsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$PictureOfShopProductsResponseDtoUseCaseFromJson(json);
}
