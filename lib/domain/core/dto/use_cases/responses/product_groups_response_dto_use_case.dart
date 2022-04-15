import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_groups_response_dto_use_case.freezed.dart';
part 'product_groups_response_dto_use_case.g.dart';

@freezed
class ProductGroupsResponseDtoUseCase with _$ProductGroupsResponseDtoUseCase {
  factory ProductGroupsResponseDtoUseCase({
    String? CategoryID,
    String? ParentID,
    String? CategoryName,
    String? Picture,
  }) = _ProductGroupsResponseDtoUseCase;

  factory ProductGroupsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$ProductGroupsResponseDtoUseCaseFromJson(json);
}
