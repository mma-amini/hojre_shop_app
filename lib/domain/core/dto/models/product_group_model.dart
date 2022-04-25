import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_group_model.g.dart';

@JsonSerializable()
class VMProductGroup extends Equatable {
  String? CategoryId;
  String? ParentId;
  String? CategoryName;
  String? Picture;

  VMProductGroup({this.CategoryId, this.ParentId, this.CategoryName, this.Picture});

  factory VMProductGroup.fromJson(Map<String, dynamic> json) => _$VMProductGroupFromJson(json);

  Map<String, dynamic> toJson() => _$VMProductGroupToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
