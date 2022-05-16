import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_specs_response_dto_use_case.freezed.dart';
part 'group_specs_response_dto_use_case.g.dart';

@freezed
class GroupSpecsResponseDtoUseCase with _$GroupSpecsResponseDtoUseCase {
  factory GroupSpecsResponseDtoUseCase({
    List<ItemOfGroupSpecsResponseDtoUseCase>? Items,
    String? Name,
    String? SpecId,
  }) = _GroupSpecsResponseDtoUseCase;

  factory GroupSpecsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$GroupSpecsResponseDtoUseCaseFromJson(json);
}

@freezed
class ItemOfGroupSpecsResponseDtoUseCase with _$ItemOfGroupSpecsResponseDtoUseCase {
  factory ItemOfGroupSpecsResponseDtoUseCase({
    String? InputName,
    String? InputTitle,
    String? Name,
    String? SpecItemId,
    List<ValueOfItemOfGroupSpecsResponseDtoUseCase>? Values,
  }) = _ItemOfGroupSpecsResponseDtoUseCase;

  factory ItemOfGroupSpecsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$ItemOfGroupSpecsResponseDtoUseCaseFromJson(json);
}

@freezed
class ValueOfItemOfGroupSpecsResponseDtoUseCase with _$ValueOfItemOfGroupSpecsResponseDtoUseCase {
  factory ValueOfItemOfGroupSpecsResponseDtoUseCase({
    String? SpecValueId,
    String? Title,
  }) = _ValueOfItemOfGroupSpecsResponseDtoUseCase;

  factory ValueOfItemOfGroupSpecsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$ValueOfItemOfGroupSpecsResponseDtoUseCaseFromJson(json);
}
