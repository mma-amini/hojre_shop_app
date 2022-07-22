import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/option_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group_option_model.g.dart';

@JsonSerializable()
class VMGroupOption extends Equatable {
  List<VMOptionItem>? items;
  String? name;
  String? id;

  @JsonKey(ignore: true)
  TextEditingController? searchTextController = TextEditingController();

  @JsonKey(ignore: true)
  List<VMOptionItem>? searchResult = List<VMOptionItem>.empty(growable: true);

  VMGroupOption({
    this.items,
    this.name,
    this.id,
    this.searchResult,
    this.searchTextController,
  }) {
    searchTextController = TextEditingController();
    searchResult = List<VMOptionItem>.empty(growable: true);
  }

  factory VMGroupOption.fromJson(Map<String, dynamic> json) => _$VMGroupOptionFromJson(json);

  Map<String, dynamic> toJson() => _$VMGroupOptionToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        items,
        name,
        id,
      ];
}

@JsonSerializable()
class VMOptionItem extends Equatable {
  String? inputName;
  String? inputTitle;
  String? name;
  String? id;
  List<VMOptionValue>? values;
  VMOptionValue? selectedItem;
  List<VMOptionValue>? selectedItems;
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
        return OptionType.COLOR;
      case "SELECTABLE":
        return OptionType.SELECTABLE;
      case "TEXT_INPUT_SINGLE":
        return OptionType.TEXT_INPUT_SINGLE;
      case "TEXT_INPUT_MULTI":
        return OptionType.TEXT_INPUT_MULTI;
      case "NUMBER_INPUT":
        return OptionType.NUMBER_INPUT;
      case "BOOL":
        return OptionType.BOOL;
      case "MULTI_SELECT":
        return OptionType.MULTI_SELECT;
      case "WEIGHT":
        return OptionType.WEIGHT;
      case "DIMENSION":
        return OptionType.DIMENSION;
      case "FILE_DOC":
        return OptionType.FILE_DOC;
      case "FILE_PIC":
        return OptionType.FILE_PIC;
    }
  }

  VMOptionItem({
    this.inputName,
    this.inputTitle,
    this.name,
    this.id,
    this.values,
    this.selectedItem,
    this.selectedItems,
    this.typedText,
    this.booleanValue,
    this.isRequired,
  });

  factory VMOptionItem.fromJson(Map<String, dynamic> json) => _$VMOptionItemFromJson(json);

  Map<String, dynamic> toJson() => _$VMOptionItemToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        inputName,
        inputTitle,
        name,
        id,
        values,
      ];
}

@JsonSerializable()
class VMOptionValue extends Equatable {
  String? id;
  String? title;
  String? value;

  @JsonKey(ignore: true)
  bool isNew;

  VMOptionValue({this.id, this.title, this.value, this.isNew = false});

  factory VMOptionValue.fromJson(Map<String, dynamic> json) => _$VMOptionValueFromJson(json);

  Map<String, dynamic> toJson() => _$VMOptionValueToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        title,
        value,
        isNew,
      ];
}
