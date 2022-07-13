// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_desing_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDesignResponseDtoUseCase _$$_ProductDesignResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_ProductDesignResponseDtoUseCase(
      id: json['id'] as String?,
      shopId: json['shopId'] as String?,
      productId: json['productId'] as String?,
      warranty: json['warranty'] == null
          ? null
          : WarrantyOfProductDesignResponseDtoUseCase.fromJson(
              json['warranty'] as Map<String, dynamic>),
      designName: json['designName'] as String?,
      barcode: json['barcode'] as String?,
      price: json['price'] as num?,
      offPrice: json['offPrice'] as num?,
      isReady: json['isReady'] as bool?,
      readyDay: json['readyDay'] as int?,
      readyHour: json['readyHour'] as int?,
    );

Map<String, dynamic> _$$_ProductDesignResponseDtoUseCaseToJson(
        _$_ProductDesignResponseDtoUseCase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'shopId': instance.shopId,
      'productId': instance.productId,
      'warranty': instance.warranty,
      'designName': instance.designName,
      'barcode': instance.barcode,
      'price': instance.price,
      'offPrice': instance.offPrice,
      'isReady': instance.isReady,
      'readyDay': instance.readyDay,
      'readyHour': instance.readyHour,
    };

_$_WarrantyOfProductDesignResponseDtoUseCase
    _$$_WarrantyOfProductDesignResponseDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        _$_WarrantyOfProductDesignResponseDtoUseCase(
          id: json['id'] as String?,
          warrantName: json['warrantName'] as String?,
          warrantDescription: json['warrantDescription'] as String?,
        );

Map<String, dynamic> _$$_WarrantyOfProductDesignResponseDtoUseCaseToJson(
        _$_WarrantyOfProductDesignResponseDtoUseCase instance) =>
    <String, dynamic>{
      'id': instance.id,
      'warrantName': instance.warrantName,
      'warrantDescription': instance.warrantDescription,
    };
