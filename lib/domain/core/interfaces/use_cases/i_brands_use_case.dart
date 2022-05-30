import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/brands_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/brand_response_dto_use_case.dart';

import 'i_use_case.dart';

abstract class IBrandsUseCase implements IUseCase<List<BrandResponseDtoUseCase>, BrandsRequestDtoUseCase> {}
