import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'warranty_model.g.dart';

@JsonSerializable()
class VMWarranty extends Equatable {
  String? id;
  String? warrantName;
  String? warrantDescription;

  VMWarranty({
    this.id,
    this.warrantName,
    this.warrantDescription,
  });

  factory VMWarranty.fromJson(Map<String, dynamic> json) => _$VMWarrantyFromJson(json);

  Map<String, dynamic> toJson() => _$VMWarrantyToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        warrantName,
        warrantDescription,
      ];
}
