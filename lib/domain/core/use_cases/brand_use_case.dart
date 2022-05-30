import 'package:dartz/dartz.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/brands_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/response_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_brands_use_case.dart';

import '../helpers/failure.dart';
import '../interfaces/repositories/repositories.dart';

class BrandsUseCase implements IBrandsUseCase {
  final Repository repository;

  BrandsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<BrandResponseDtoUseCase>>> Handler({BrandsRequestDtoUseCase? params}) async {
    return await repository.brands(brandsRequestDtoUseCase: params!)!;
  }
}
