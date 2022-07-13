import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_desing_response_dto_use_case.freezed.dart';
part 'product_desing_response_dto_use_case.g.dart';

@freezed
class ProductDesignResponseDtoUseCase with _$ProductDesignResponseDtoUseCase {
  factory ProductDesignResponseDtoUseCase({
    String? id,
    String? shopId,
    String? productId,
    WarrantyOfProductDesignResponseDtoUseCase? warranty,
    String? designName,
    String? barcode,
    num? price,
    num? offPrice,
    bool? isReady,
    int? readyDay,
    int? readyHour,
  }) = _ProductDesignResponseDtoUseCase;

  factory ProductDesignResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$ProductDesignResponseDtoUseCaseFromJson(json);
}

@freezed
class WarrantyOfProductDesignResponseDtoUseCase with _$WarrantyOfProductDesignResponseDtoUseCase {
  factory WarrantyOfProductDesignResponseDtoUseCase({
    String? id,
    String? warrantName,
    String? warrantDescription,
  }) = _WarrantyOfProductDesignResponseDtoUseCase;

  factory WarrantyOfProductDesignResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$WarrantyOfProductDesignResponseDtoUseCaseFromJson(json);
}
