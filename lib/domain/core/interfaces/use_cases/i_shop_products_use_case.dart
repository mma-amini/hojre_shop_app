import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/shop_products_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/shop_products_response_dto_use_case.dart';

import 'i_use_case.dart';

abstract class IShopProductsUseCase
    implements IUseCase<List<ShopProductsResponseDtoUseCase>, ShopProductsRequestDtoUseCase> {}
