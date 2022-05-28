import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_desing_response_dto_use_case.freezed.dart';
part 'product_desing_response_dto_use_case.g.dart';

@freezed
class ProductDesignResponseDtoUseCase with _$ProductDesignResponseDtoUseCase {
  factory ProductDesignResponseDtoUseCase({
    String? Id,
    String? ShopId,
    String? ProductId,
    WarrantyOfProductDesignResponseDtoUseCase? Warranty,
    String? DesignName,
    String? Barcode,
    num? Price,
    num? OffPrice,
    bool? IsReady,
    int? ReadyDay,
    int? ReadyHour,
  }) = _ProductDesignResponseDtoUseCase;

  factory ProductDesignResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$ProductDesignResponseDtoUseCaseFromJson(json);
}

@freezed
class WarrantyOfProductDesignResponseDtoUseCase with _$WarrantyOfProductDesignResponseDtoUseCase {
  factory WarrantyOfProductDesignResponseDtoUseCase({
    String? Id,
    String? WarrantName,
    String? WarrantDescription,
  }) = _WarrantyOfProductDesignResponseDtoUseCase;

  factory WarrantyOfProductDesignResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$WarrantyOfProductDesignResponseDtoUseCaseFromJson(json);
}
