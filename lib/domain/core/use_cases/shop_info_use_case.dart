import 'package:dartz/dartz.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/response_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_use_case_exports.dart';

import '../helpers/failure.dart';
import '../interfaces/repositories/repositories.dart';

class ShopInfoUseCase implements IShopInfoUseCase {
  final Repository repository;

  ShopInfoUseCase({required this.repository});

  @override
  Future<Either<Failure, ResponseDtoUseCase>> handler({NoParams? params}) async {
    return await repository.shopInfo()!;
  }
}
