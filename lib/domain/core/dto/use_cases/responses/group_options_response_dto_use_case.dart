import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_options_response_dto_use_case.freezed.dart';
part 'group_options_response_dto_use_case.g.dart';

@freezed
class GroupOptionsResponseDtoUseCase with _$GroupOptionsResponseDtoUseCase {
  factory GroupOptionsResponseDtoUseCase({
    List<ItemOfGroupOptionsResponseDtoUseCase>? items,
    String? name,
    String? id,
  }) = _GroupOptionsResponseDtoUseCase;

  factory GroupOptionsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$GroupOptionsResponseDtoUseCaseFromJson(json);
}

@freezed
class ItemOfGroupOptionsResponseDtoUseCase with _$ItemOfGroupOptionsResponseDtoUseCase {
  factory ItemOfGroupOptionsResponseDtoUseCase({
    String? inputName,
    String? inputTitle,
    String? name,
    String? id,
    List<ValueOfItemOfGroupOptionsResponseDtoUseCase>? values,
  }) = _ItemOfGroupOptionsResponseDtoUseCase;

  factory ItemOfGroupOptionsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$ItemOfGroupOptionsResponseDtoUseCaseFromJson(json);
}

@freezed
class ValueOfItemOfGroupOptionsResponseDtoUseCase with _$ValueOfItemOfGroupOptionsResponseDtoUseCase {
  factory ValueOfItemOfGroupOptionsResponseDtoUseCase({
    String? id,
    String? title,
    String? value,
  }) = _ValueOfItemOfGroupOptionsResponseDtoUseCase;

  factory ValueOfItemOfGroupOptionsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$ValueOfItemOfGroupOptionsResponseDtoUseCaseFromJson(json);
}
