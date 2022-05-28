import 'package:dartz/dartz.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/product_design_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/product_desing_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_use_case_exports.dart';

import '../helpers/failure.dart';
import '../interfaces/repositories/repositories.dart';

class ProductDesignsUseCase implements IProductDesignsUseCase {
  final Repository repository;

  ProductDesignsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductDesignResponseDtoUseCase>>> Handler(
      {ProductDesignRequestDtoUseCase? params}) async {
    return await repository.productDesigns(productDesignRequestDtoUseCase: params!)!;
  }
}
