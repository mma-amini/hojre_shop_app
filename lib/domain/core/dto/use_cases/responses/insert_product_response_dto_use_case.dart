import 'package:freezed_annotation/freezed_annotation.dart';

part 'insert_product_response_dto_use_case.freezed.dart';
part 'insert_product_response_dto_use_case.g.dart';

@freezed
class InsertProductResponseDtoUseCase with _$InsertProductResponseDtoUseCase {
  factory InsertProductResponseDtoUseCase({
    String? ProductId,
  }) = _InsertProductResponseDtoUseCase;

  factory InsertProductResponseDtoUseCase.fromJson(Map<String, dynamic> json) =>
      _$InsertProductResponseDtoUseCaseFromJson(json);
}
