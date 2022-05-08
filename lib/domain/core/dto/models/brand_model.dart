import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class VMBrand extends Equatable {
  String? Id;
  String? Name;
  String? Picture;

  VMBrand({this.Id, this.Name, this.Picture});

  factory VMBrand.fromJson(Map<String, dynamic> json) => _$VMBrandFromJson(json);

  Map<String, dynamic> toJson() => _$VMBrandToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
