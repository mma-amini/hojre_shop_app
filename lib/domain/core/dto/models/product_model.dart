import 'package:equatable/equatable.dart';
import 'package:hojre_shop_app/domain/core/dto/models/brand_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class VMProduct extends Equatable {
  int? ApprovedProductDesignsCount;
  VMBrand? Brand;
  String? Description;
  bool? IsActive;
  bool? IsOriginal;
  int? NotApprovedProductDesignsCount;
  String? PackingDimensions;
  double? PackingWeight;
  List<VMProductPicture>? Pictures;
  String? Picture;
  String? ProductDimensions;
  String? ProductId;
  String? ProductName;
  double? ProductWeight;

  VMProduct(
      {this.Brand,
      this.Description,
      this.IsActive,
      this.IsOriginal,
      this.PackingDimensions,
      this.PackingWeight,
      this.Pictures,
      this.Picture,
      this.ProductDimensions,
      this.ProductId,
      this.ProductName,
      this.ProductWeight});

  factory VMProduct.fromJson(Map<String, dynamic> json) => _$VMProductFromJson(json);

  Map<String, dynamic> toJson() => _$VMProductToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        Brand,
        Description,
        IsActive,
        IsOriginal,
        PackingDimensions,
        PackingWeight,
        Pictures,
        Picture,
        ProductDimensions,
        ProductId,
        ProductName,
        ProductWeight,
      ];
}

@JsonSerializable()
class VMProductPicture extends Equatable {
  bool? IsMain;
  String? Picture;

  VMProductPicture({this.IsMain, this.Picture});

  factory VMProductPicture.fromJson(Map<String, dynamic> json) => _$VMProductPictureFromJson(json);

  Map<String, dynamic> toJson() => _$VMProductPictureToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        IsMain,
        Picture,
      ];
}
