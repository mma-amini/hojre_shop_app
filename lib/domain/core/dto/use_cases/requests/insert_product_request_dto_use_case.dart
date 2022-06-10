import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'insert_product_request_dto_use_case.g.dart';

@JsonSerializable()
class InsertProductRequestDtoUseCase extends Equatable {
  String? ProductName;
  String? ProductId;
  String? ProductGroupId;
  String? BrandId;
  String? BrandName;
  int? ProductPackWeight;
  int? ProductPackLength;
  int? ProductPackWidth;
  int? ProductPackHeight;
  int? ProductPackWeightType;
  String? Description;
  bool? Original;
  List<SectionOfInsertProductRequestDtoUseCase>? Sections;

  InsertProductRequestDtoUseCase(
      {this.ProductName,
      this.ProductId,
      this.ProductGroupId,
      this.BrandId,
      this.BrandName,
      this.ProductPackWeight,
      this.ProductPackLength,
      this.ProductPackWidth,
      this.ProductPackHeight,
      this.ProductPackWeightType,
      this.Description,
      this.Original = false,
      this.Sections});

  factory InsertProductRequestDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$InsertProductRequestDtoUseCaseFromJson(json);

  Map<String, dynamic> toJson() => _$InsertProductRequestDtoUseCaseToJson(this);

  @override
  List<Object?> get props => [
        ProductName,
        ProductId,
        ProductGroupId,
        BrandId,
        BrandName,
        ProductPackWeight,
        ProductPackLength,
        ProductPackWidth,
        ProductPackHeight,
        ProductPackWeightType,
        Description,
        Original,
        Sections,
      ];
}

@JsonSerializable()
class SectionOfInsertProductRequestDtoUseCase extends Equatable {
  String? SpecId;
  List<DataOfSectionOfInsertProductRequestDtoUseCase>? Specs;

  SectionOfInsertProductRequestDtoUseCase({this.SpecId, this.Specs});

  factory SectionOfInsertProductRequestDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$SectionOfInsertProductRequestDtoUseCaseFromJson(json);

  Map<String, dynamic> toJson() => _$SectionOfInsertProductRequestDtoUseCaseToJson(this);

  @override
  List<Object?> get props => [
        SpecId,
        Specs,
      ];
}

@JsonSerializable()
class DataOfSectionOfInsertProductRequestDtoUseCase extends Equatable {
  String? InputType;
  String? SpecItemId;
  dynamic Value;

  DataOfSectionOfInsertProductRequestDtoUseCase({this.InputType, this.SpecItemId, this.Value});

  factory DataOfSectionOfInsertProductRequestDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$DataOfSectionOfInsertProductRequestDtoUseCaseFromJson(json);

  Map<String, dynamic> toJson() => _$DataOfSectionOfInsertProductRequestDtoUseCaseToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        InputType,
        SpecItemId,
        Value,
      ];
}
