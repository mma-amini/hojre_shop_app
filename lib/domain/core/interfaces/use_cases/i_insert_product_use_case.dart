import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/insert_product_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/insert_product_response_dto_use_case.dart';

import 'i_use_case.dart';

abstract class IInsertProductUseCase
    implements IUseCase<InsertProductResponseDtoUseCase, InsertProductRequestDtoUseCase> {}
