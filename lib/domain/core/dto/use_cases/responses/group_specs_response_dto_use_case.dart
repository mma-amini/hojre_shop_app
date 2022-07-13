import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_specs_response_dto_use_case.freezed.dart';
part 'group_specs_response_dto_use_case.g.dart';

@freezed
class GroupSpecsResponseDtoUseCase with _$GroupSpecsResponseDtoUseCase {
  factory GroupSpecsResponseDtoUseCase({
    List<ItemOfGroupSpecsResponseDtoUseCase>? items,
    String? name,
    String? specId,
  }) = _GroupSpecsResponseDtoUseCase;

  factory GroupSpecsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$GroupSpecsResponseDtoUseCaseFromJson(json);
}

@freezed
class ItemOfGroupSpecsResponseDtoUseCase with _$ItemOfGroupSpecsResponseDtoUseCase {
  factory ItemOfGroupSpecsResponseDtoUseCase({
    String? inputName,
    String? inputTitle,
    String? name,
    String? specItemId,
    List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? values,
  }) = _ItemOfGroupSpecsResponseDtoUseCase;

  factory ItemOfGroupSpecsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$ItemOfGroupSpecsResponseDtoUseCaseFromJson(json);
}

@freezed
class ValueOfItemOfGroupSpecsResponseDtoUseCase with _$ValueOfItemOfGroupSpecsResponseDtoUseCase {
  factory ValueOfItemOfGroupSpecsResponseDtoUseCase({
    String? specValueId,
    String? title,
  }) = _ValueOfItemOfGroupSpecsResponseDtoUseCase;

  factory ValueOfItemOfGroupSpecsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$ValueOfItemOfGroupSpecsResponseDtoUseCaseFromJson(json);
}
