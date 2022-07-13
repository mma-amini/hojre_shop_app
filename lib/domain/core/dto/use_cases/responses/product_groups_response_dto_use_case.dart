import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_groups_response_dto_use_case.freezed.dart';
part 'product_groups_response_dto_use_case.g.dart';

@freezed
class ProductGroupsResponseDtoUseCase with _$ProductGroupsResponseDtoUseCase {
  factory ProductGroupsResponseDtoUseCase({
    String? categoryId,
    String? parentId,
    String? categoryName,
    String? picture,
  }) = _ProductGroupsResponseDtoUseCase;

  factory ProductGroupsResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$ProductGroupsResponseDtoUseCaseFromJson(json);
}
