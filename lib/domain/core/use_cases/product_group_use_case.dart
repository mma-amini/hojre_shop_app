import 'package:dartz/dartz.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/product_groups_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/product_groups_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_product_groups_use_case.dart';

import '../helpers/failure.dart';
import '../interfaces/repositories/repositories.dart';

class ProductGroupsUseCase implements IProductGroupsUseCase {
  final Repository repository;

  ProductGroupsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ProductGroupsResponseDtoUseCase>>> Handler(
      {ProductGroupsRequestDtoUseCase? params}) async {
    return await repository.productCategories(productGroupsRequestDtoUseCase: params!)!;
  }
}
