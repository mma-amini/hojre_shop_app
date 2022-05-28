import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/spec_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_spec_model.g.dart';

@JsonSerializable()
class VMGroupSpec extends Equatable {
  List<VMSpecItem>? Items;
  String? Name;
  String? SpecId;

  @JsonKey(ignore: true)
  TextEditingController? searchTextController = TextEditingController();

  @JsonKey(ignore: true)
  List<VMSpecItem>? searchResult = List<VMSpecItem>.empty(growable: true);

  VMGroupSpec({
    this.Items,
    this.Name,
    this.SpecId,
    this.searchResult,
    this.searchTextController,
  }) {
    searchTextController = TextEditingController();
    searchResult = List<VMSpecItem>.empty(growable: true);
  }

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

  VMSpecValue? SelectedItem;
  List<VMSpecValue>? SelectedItems;
  String? TypedText;
  bool? BooleanValue;

  @JsonKey(ignore: true)
  FocusNode textNode = FocusNode();
  @JsonKey(ignore: true)
  FocusNode searchTextNode = FocusNode();
  @JsonKey(ignore: true)
  TextEditingController textController = TextEditingController();
  @JsonKey(ignore: true)
  TextEditingController searchTextController = TextEditingController();

  get type {
    switch (InputName) {
      case "COLOR":
        return SpecificationType.COLOR;
      case "SELECTABLE":
        return SpecificationType.SELECTABLE;
      case "TEXT_INPUT":
        return SpecificationType.TEXT_INPUT;
      case "NUMBER_INPUT":
        return SpecificationType.NUMBER_INPUT;
      case "BOOL":
        return SpecificationType.BOOL;
      case "MULTI_SELECT":
        return SpecificationType.MULTI_SELECT;
      case "WEIGHT":
        return SpecificationType.WEIGHT;
      case "DIMENSION":
        return SpecificationType.DIMENSION;
      case "FILE_DOC":
        return SpecificationType.FILE_DOC;
      case "FILE_PIC":
        return SpecificationType.FILE_PIC;
    }
  }

  VMSpecItem({
    this.InputName,
    this.InputTitle,
    this.Name,
    this.SpecItemId,
    this.Values,
    this.SelectedItem,
    this.SelectedItems,
    this.TypedText,
    this.BooleanValue,
  });

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
  String? Value;

  @JsonKey(ignore: true)
  bool isNew;

  VMSpecValue({this.SpecValueId, this.Title, this.Value, this.isNew = false});

  factory VMSpecValue.fromJson(Map<String, dynamic> json) => _$VMSpecValueFromJson(json);

  Map<String, dynamic> toJson() => _$VMSpecValueToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        SpecValueId,
        Title,
      ];
}
