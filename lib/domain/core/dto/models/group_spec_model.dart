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
  });

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

  get type {
    switch (InputName) {
      case "1":
        return SpecificationType.COLOR;
      case "2":
        return SpecificationType.SELECTABLE;
      case "3":
        return SpecificationType.INPUT;
      case "4":
        return SpecificationType.INPUT_NUMBER;
      case "5":
        return SpecificationType.HAS_OR_NOT;
      case "6":
        return SpecificationType.MULTI_SELECT;
      case "7":
        return SpecificationType.WEIGHT;
      case "8":
        return SpecificationType.DIMENSION;
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

  @JsonKey(ignore: true)
  bool isNew = false;

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
