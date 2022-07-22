import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_group_model.g.dart';

@JsonSerializable()
class VMProductGroup extends Equatable {
  String? id;
  String? parentId;
  String? categoryName;
  String? picture;

  VMProductGroup({this.id, this.parentId, this.categoryName, this.picture});

  factory VMProductGroup.fromJson(Map<String, dynamic> json) => _$VMProductGroupFromJson(json);

  Map<String, dynamic> toJson() => _$VMProductGroupToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        parentId,
        categoryName,
        picture,
      ];
}
