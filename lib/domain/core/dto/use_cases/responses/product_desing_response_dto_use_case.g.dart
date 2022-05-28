// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_desing_response_dto_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProductDesignResponseDtoUseCase _$$_ProductDesignResponseDtoUseCaseFromJson(
        Map<String, dynamic> json) =>
    _$_ProductDesignResponseDtoUseCase(
      Id: json['Id'] as String?,
      ShopId: json['ShopId'] as String?,
      ProductId: json['ProductId'] as String?,
      Warranty: json['Warranty'] == null
          ? null
          : WarrantyOfProductDesignResponseDtoUseCase.fromJson(
              json['Warranty'] as Map<String, dynamic>),
      DesignName: json['DesignName'] as String?,
      Barcode: json['Barcode'] as String?,
      Price: json['Price'] as num?,
      OffPrice: json['OffPrice'] as num?,
      IsReady: json['IsReady'] as bool?,
      ReadyDay: json['ReadyDay'] as int?,
      ReadyHour: json['ReadyHour'] as int?,
    );

Map<String, dynamic> _$$_ProductDesignResponseDtoUseCaseToJson(
        _$_ProductDesignResponseDtoUseCase instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'ShopId': instance.ShopId,
      'ProductId': instance.ProductId,
      'Warranty': instance.Warranty,
      'DesignName': instance.DesignName,
      'Barcode': instance.Barcode,
      'Price': instance.Price,
      'OffPrice': instance.OffPrice,
      'IsReady': instance.IsReady,
      'ReadyDay': instance.ReadyDay,
      'ReadyHour': instance.ReadyHour,
    };

_$_WarrantyOfProductDesignResponseDtoUseCase
    _$$_WarrantyOfProductDesignResponseDtoUseCaseFromJson(
            Map<String, dynamic> json) =>
        _$_WarrantyOfProductDesignResponseDtoUseCase(
          Id: json['Id'] as String?,
          WarrantName: json['WarrantName'] as String?,
          WarrantDescription: json['WarrantDescription'] as String?,
        );

Map<String, dynamic> _$$_WarrantyOfProductDesignResponseDtoUseCaseToJson(
        _$_WarrantyOfProductDesignResponseDtoUseCase instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'WarrantName': instance.WarrantName,
      'WarrantDescription': instance.WarrantDescription,
    };
