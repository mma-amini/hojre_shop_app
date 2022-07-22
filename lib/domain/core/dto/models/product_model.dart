import 'dart:io';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:hojre_shop_app/domain/core/dto/models/brand_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class VMProduct extends Equatable {
  int? approvedProductDesignsCount;
  VMBrand? brand;
  String? description;
  bool? isActive;
  bool? isOriginal;
  int? notApprovedProductDesignsCount;
  String? packingDimensions;
  double? packingWeight;
  List<VMProductPicture>? pictures;
  String? picture;
  String? productDimensions;
  String? id;
  String? productName;
  double? productWeight;

  VMProduct(
      {this.brand,
      this.description,
      this.isActive,
      this.isOriginal,
      this.packingDimensions,
      this.packingWeight,
      this.pictures,
      this.picture,
      this.productDimensions,
      this.id,
      this.productName,
      this.productWeight});

  factory VMProduct.fromJson(Map<String, dynamic> json) => _$VMProductFromJson(json);

  Map<String, dynamic> toJson() => _$VMProductToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        brand,
        description,
        isActive,
        isOriginal,
        packingDimensions,
        packingWeight,
        pictures,
        picture,
        productDimensions,
        id,
        productName,
        productWeight,
      ];
}

@JsonSerializable()
class VMProductPicture extends Equatable {
  bool? isMain;
  String? picture;

  VMProductPicture({this.isMain, this.picture});

  factory VMProductPicture.fromJson(Map<String, dynamic> json) => _$VMProductPictureFromJson(json);

  Map<String, dynamic> toJson() => _$VMProductPictureToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        isMain,
        picture,
      ];
}

@JsonSerializable()
class VMSendProductPicture extends Equatable {
  String? id;

  @JsonKey(ignore: true)
  File? file;

  @JsonKey(ignore: true)
  Uint8List? pickedFile;

  bool? isUploaded;
  bool? isMain;

  VMSendProductPicture({
    this.id,
    this.file,
    this.pickedFile,
    this.isUploaded,
    this.isMain,
  });

  factory VMSendProductPicture.fromJson(Map<String, dynamic> json) => _$VMSendProductPictureFromJson(json);

  Map<String, dynamic> toJson() => _$VMSendProductPictureToJson(this);

  @override
  List<Object?> get props => [
        id,
        file,
        pickedFile,
        isUploaded,
      ];
}
