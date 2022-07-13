import 'package:dartz/dartz.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/shop_products_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/shop_products_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_shop_products_use_case.dart';

import '../helpers/failure.dart';
import '../interfaces/repositories/repositories.dart';

class ShopProductsUseCase implements IShopProductsUseCase {
  final Repository repository;

  ShopProductsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ShopProductsResponseDtoUseCase>>> handler({ShopProductsRequestDtoUseCase? params}) async {
    return await repository.shopProducts(shopProductsRequestDtoUseCase: params!)!;
  }
}
