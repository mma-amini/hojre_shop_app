// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_design_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VMProductDesign _$VMProductDesignFromJson(Map<String, dynamic> json) =>
    VMProductDesign(
      id: json['id'] as String?,
      shopId: json['shopId'] as String?,
      productId: json['productId'] as String?,
      warranty: json['warranty'] == null
          ? null
          : VMWarranty.fromJson(json['warranty'] as Map<String, dynamic>),
      designName: json['designName'] as String?,
      barcode: json['barcode'] as String?,
      price: json['price'] as num?,
      offPrice: json['offPrice'] as num?,
      isReady: json['isReady'] as bool?,
      readyDay: json['readyDay'] as int?,
      readyHour: json['readyHour'] as int?,
    );

Map<String, dynamic> _$VMProductDesignToJson(VMProductDesign instance) =>
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
