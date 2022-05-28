import 'package:equatable/equatable.dart';
import 'package:hojre_shop_app/domain/core/dto/models/brand_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/warranty_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_design_model.g.dart';

@JsonSerializable()
class VMProductDesign extends Equatable {
  String? Id;
  String? ShopId;
  String? ProductId;
  VMWarranty? Warranty;
  String? DesignName;
  String? Barcode;
  num? Price;
  num? OffPrice;
  bool? IsReady;
  int? ReadyDay;
  int? ReadyHour;

  VMProductDesign({
    this.Id,
    this.ShopId,
    this.ProductId,
    this.Warranty,
    this.DesignName,
    this.Barcode,
    this.Price,
    this.OffPrice,
    this.IsReady,
    this.ReadyDay,
    this.ReadyHour,
  });

  factory VMProductDesign.fromJson(Map<String, dynamic> json) => _$VMProductDesignFromJson(json);

  Map<String, dynamic> toJson() => _$VMProductDesignToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        Id,
        ShopId,
        ProductId,
        Warranty,
        DesignName,
        Barcode,
        Price,
        OffPrice,
        IsReady,
        ReadyDay,
        ReadyHour,
      ];
}
