import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insert_product_picture_request_dto_use_case.g.dart';

@JsonSerializable()
class InsertProductPictureRequestDtoUseCase extends Equatable {
  String? id;
  String? productId;

  @JsonKey(ignore: true)
  Uint8List? pickedFile;

  bool? isMain = false;
  bool? isUploaded = false;
  int? sort = 0;

  InsertProductPictureRequestDtoUseCase(
      {this.id, this.productId, this.pickedFile, this.isMain, this.isUploaded, this.sort});

  factory InsertProductPictureRequestDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$InsertProductPictureRequestDtoUseCaseFromJson(json);

  Map<String, dynamic> toJson() => _$InsertProductPictureRequestDtoUseCaseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        productId,
        isMain,
        isUploaded,
        sort,
      ];
}
