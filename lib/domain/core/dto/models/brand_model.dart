import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class VMBrand extends Equatable {
  String? id;
  String? name;
  String? picture;

  VMBrand({this.id, this.name, this.picture});

  factory VMBrand.fromJson(Map<String, dynamic> json) => _$VMBrandFromJson(json);

  Map<String, dynamic> toJson() => _$VMBrandToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        picture,
      ];
}
