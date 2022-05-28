import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warranty_model.g.dart';

@JsonSerializable()
class VMWarranty extends Equatable {
  String? Id;
  String? WarrantName;
  String? WarrantDescription;

  VMWarranty({
    this.Id,
    this.WarrantName,
    this.WarrantDescription,
  });

  factory VMWarranty.fromJson(Map<String, dynamic> json) => _$VMWarrantyFromJson(json);

  Map<String, dynamic> toJson() => _$VMWarrantyToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        Id,
        WarrantName,
        WarrantDescription,
      ];
}
