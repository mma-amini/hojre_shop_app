import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insert_product_request_dto_use_case.g.dart';

@JsonSerializable()
class InsertProductRequestDtoUseCase extends Equatable {
  String? productName;
  String? productId;
  String? productGroupId;
  String? brandId;
  String? brandName;
  int? productPackWeight;
  int? productPackLength;
  int? productPackWidth;
  int? productPackHeight;
  int? productPackWeightType;
  String? description;
  bool? original;
  List<SectionOfInsertProductRequestDtoUseCase>? sections;

  InsertProductRequestDtoUseCase(
      {this.productName,
      this.productId,
      this.productGroupId,
      this.brandId,
      this.brandName,
      this.productPackWeight,
      this.productPackLength,
      this.productPackWidth,
      this.productPackHeight,
      this.productPackWeightType,
      this.description,
      this.original = false,
      this.sections});

  factory InsertProductRequestDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$InsertProductRequestDtoUseCaseFromJson(json);

  Map<String, dynamic> toJson() => _$InsertProductRequestDtoUseCaseToJson(this);

  @override
  List<Object?> get props => [
        productName,
        productId,
        productGroupId,
        brandId,
        brandName,
        productPackWeight,
        productPackLength,
        productPackWidth,
        productPackHeight,
        productPackWeightType,
        description,
        original,
        sections,
      ];
}

@JsonSerializable()
class SectionOfInsertProductRequestDtoUseCase extends Equatable {
  String? specId;
  List<DataOfSectionOfInsertProductRequestDtoUseCase>? specs;

  SectionOfInsertProductRequestDtoUseCase({this.specId, this.specs});

  factory SectionOfInsertProductRequestDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$SectionOfInsertProductRequestDtoUseCaseFromJson(json);

  Map<String, dynamic> toJson() => _$SectionOfInsertProductRequestDtoUseCaseToJson(this);

  @override
  List<Object?> get props => [
        specId,
        specs,
      ];
}

@JsonSerializable()
class DataOfSectionOfInsertProductRequestDtoUseCase extends Equatable {
  String? inputType;
  String? specItemId;
  dynamic value;

  DataOfSectionOfInsertProductRequestDtoUseCase({this.inputType, this.specItemId, this.value});

  factory DataOfSectionOfInsertProductRequestDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$DataOfSectionOfInsertProductRequestDtoUseCaseFromJson(json);

  Map<String, dynamic> toJson() => _$DataOfSectionOfInsertProductRequestDtoUseCaseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        inputType,
        specItemId,
        value,
      ];
}
