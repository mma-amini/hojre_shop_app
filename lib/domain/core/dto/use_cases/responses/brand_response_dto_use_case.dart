import 'package:freezed_annotation/freezed_annotation.dart';

part 'brand_response_dto_use_case.freezed.dart';
part 'brand_response_dto_use_case.g.dart';

@freezed
class BrandResponseDtoUseCase with _$BrandResponseDtoUseCase {
  factory BrandResponseDtoUseCase({
    String? id,
    String? name,
    String? picture,
  }) = _BrandResponseDtoUseCase;

  factory BrandResponseDtoUseCase.fromJson(Map<String, dynamic> json) => _$BrandResponseDtoUseCaseFromJson(json);
}
