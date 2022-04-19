import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/product_groups_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/product_groups_response_dto_use_case.dart';

import 'i_use_case.dart';

abstract class IProductGroupsUseCase
    implements IUseCase<List<ProductGroupsResponseDtoUseCase>, ProductGroupsRequestDtoUseCase> {}