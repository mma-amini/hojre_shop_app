import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/spec_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_spec_model.g.dart';

@JsonSerializable()
class VMGroupSpec extends Equatable {
  List<VMSpecItem>? items;
  String? name;
  String? specId;

  @JsonKey(ignore: true)
  TextEditingController? searchTextController = TextEditingController();

  @JsonKey(ignore: true)
  List<VMSpecItem>? searchResult = List<VMSpecItem>.empty(growable: true);

  VMGroupSpec({
    this.items,
    this.name,
    this.specId,
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
        items,
        name,
        specId,
      ];
}

@JsonSerializable()
class VMSpecItem extends Equatable {
  String? inputName;
  String? inputTitle;
  String? name;
  String? specItemId;
  List<VMSpecValue>? values;
  VMSpecValue? selectedItem;
  List<VMSpecValue>? selectedItems;
  String? typedText;
  bool? booleanValue;
  bool? isRequired = false;

  @JsonKey(ignore: true)
  FocusNode textNode = FocusNode();
  @JsonKey(ignore: true)
  FocusNode searchTextNode = FocusNode();
  @JsonKey(ignore: true)
  TextEditingController textController = TextEditingController();
  @JsonKey(ignore: true)
  TextEditingController searchTextController = TextEditingController();

  get type {
    switch (inputName) {
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
    this.inputName,
    this.inputTitle,
    this.name,
    this.specItemId,
    this.values,
    this.selectedItem,
    this.selectedItems,
    this.typedText,
    this.booleanValue,
    this.isRequired,
  });

  factory VMSpecItem.fromJson(Map<String, dynamic> json) => _$VMSpecItemFromJson(json);

  Map<String, dynamic> toJson() => _$VMSpecItemToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        inputName,
        inputTitle,
        name,
        specItemId,
        values,
      ];
}

@JsonSerializable()
class VMSpecValue extends Equatable {
  String? specValueId;
  String? title;
  String? value;

  @JsonKey(ignore: true)
  bool isNew;

  VMSpecValue({this.specValueId, this.title, this.value, this.isNew = false});

  factory VMSpecValue.fromJson(Map<String, dynamic> json) => _$VMSpecValueFromJson(json);

  Map<String, dynamic> toJson() => _$VMSpecValueToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        specValueId,
        title,
        value,
        isNew,
      ];
}
