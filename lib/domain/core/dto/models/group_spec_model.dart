import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_spec_model.g.dart';

@JsonSerializable()
class VMGroupSpec extends Equatable {
  List<VMSpecItem>? Items;
  String? Name;
  String? SpecId;

  VMGroupSpec({this.Items, this.Name, this.SpecId});

  factory VMGroupSpec.fromJson(Map<String, dynamic> json) => _$VMGroupSpecFromJson(json);

  Map<String, dynamic> toJson() => _$VMGroupSpecToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        Items,
        Name,
        SpecId,
      ];
}

@JsonSerializable()
class VMSpecItem extends Equatable {
  String? InputName;
  String? InputTitle;
  String? Name;
  String? SpecItemId;
  List<VMSpecValue>? Values;

  VMSpecItem({this.InputName, this.InputTitle, this.Name, this.SpecItemId, this.Values});

  factory VMSpecItem.fromJson(Map<String, dynamic> json) => _$VMSpecItemFromJson(json);

  Map<String, dynamic> toJson() => _$VMSpecItemToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        InputName,
        InputTitle,
        Name,
        SpecItemId,
        Values,
      ];
}

@JsonSerializable()
class VMSpecValue extends Equatable {
  String? SpecValueId;
  String? Title;

  VMSpecValue({this.SpecValueId, this.Title});

  factory VMSpecValue.fromJson(Map<String, dynamic> json) => _$VMSpecValueFromJson(json);

  Map<String, dynamic> toJson() => _$VMSpecValueToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        SpecValueId,
        Title,
      ];
}
