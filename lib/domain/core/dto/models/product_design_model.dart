import 'package:equatable/equatable.dart';
import 'package:hojre_shop_app/domain/core/dto/models/warranty_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_design_model.g.dart';

@JsonSerializable()
class VMProductDesign extends Equatable {
  String? id;
  String? shopId;
  String? productId;
  VMWarranty? warranty;
  String? designName;
  String? barcode;
  num? price;
  num? offPrice;
  bool? isReady;
  int? readyDay;
  int? readyHour;

  VMProductDesign({
    this.id,
    this.shopId,
    this.productId,
    this.warranty,
    this.designName,
    this.barcode,
    this.price,
    this.offPrice,
    this.isReady,
    this.readyDay,
    this.readyHour,
  });

  factory VMProductDesign.fromJson(Map<String, dynamic> json) => _$VMProductDesignFromJson(json);

  Map<String, dynamic> toJson() => _$VMProductDesignToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        shopId,
        productId,
        warranty,
        designName,
        barcode,
        price,
        offPrice,
        isReady,
        readyDay,
        readyHour,
      ];
}
