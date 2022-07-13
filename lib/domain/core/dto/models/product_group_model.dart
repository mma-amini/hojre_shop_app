import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_group_model.g.dart';

@JsonSerializable()
class VMProductGroup extends Equatable {
  String? categoryId;
  String? parentId;
  String? categoryName;
  String? picture;

  VMProductGroup({this.categoryId, this.parentId, this.categoryName, this.picture});

  factory VMProductGroup.fromJson(Map<String, dynamic> json) => _$VMProductGroupFromJson(json);

  Map<String, dynamic> toJson() => _$VMProductGroupToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        categoryId,
        parentId,
        categoryName,
        picture,
      ];
}
