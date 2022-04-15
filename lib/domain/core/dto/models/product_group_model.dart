import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_group_model.g.dart';

@JsonSerializable()
class VMProductGroup extends Equatable {
  String? CategoryID;
  String? ParentID;
  String? CategoryName;
  String? Picture;

  VMProductGroup({this.CategoryID, this.ParentID, this.CategoryName, this.Picture});

  factory VMProductGroup.fromJson(Map<String, dynamic> json) => _$VMProductGroupFromJson(json);

  Map<String, dynamic> toJson() => _$VMProductGroupToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
