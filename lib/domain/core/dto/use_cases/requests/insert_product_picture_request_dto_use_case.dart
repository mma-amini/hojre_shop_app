import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insert_product_picture_request_dto_use_case.g.dart';

@JsonSerializable()
class InsertProductPictureRequestDtoUseCase extends Equatable {
  String? Id;
  String? ProductId;

  @JsonKey(ignore: true)
  Uint8List? PickedFile;

  bool? IsMain = false;
  bool? IsUploaded = false;
  int? Sort = 0;

  InsertProductPictureRequestDtoUseCase(
      {this.Id, this.ProductId, this.PickedFile, this.IsMain, this.IsUploaded, this.Sort});

  factory InsertProductPictureRequestDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$InsertProductPictureRequestDtoUseCaseFromJson(json);

  Map<String, dynamic> toJson() => _$InsertProductPictureRequestDtoUseCaseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        Id,
        ProductId,
        IsMain,
        IsUploaded,
        Sort,
      ];
}
