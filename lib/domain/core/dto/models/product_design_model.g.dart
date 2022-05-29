// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_design_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMProductDesign _$VMProductDesignFromJson(Map<String, dynamic> json) =>
    VMProductDesign(
      Id: json['Id'] as String?,
      ShopId: json['ShopId'] as String?,
      ProductId: json['ProductId'] as String?,
      Warranty: json['Warranty'] == null
          ? null
          : VMWarranty.fromJson(json['Warranty'] as Map<String, dynamic>),
      DesignName: json['DesignName'] as String?,
      Barcode: json['Barcode'] as String?,
      Price: json['Price'] as num?,
      OffPrice: json['OffPrice'] as num?,
      IsReady: json['IsReady'] as bool?,
      ReadyDay: json['ReadyDay'] as int?,
      ReadyHour: json['ReadyHour'] as int?,
    );

Map<String, dynamic> _$VMProductDesignToJson(VMProductDesign instance) =>
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
