import 'package:dartz/dartz.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/insert_product_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/insert_product_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_insert_product_use_case.dart';

import '../helpers/failure.dart';
import '../interfaces/repositories/repositories.dart';

class InsertProductUseCase implements IInsertProductUseCase {
  final Repository repository;

  InsertProductUseCase({required this.repository});

  @override
  Future<Either<Failure, InsertProductResponseDtoUseCase>> handler({InsertProductRequestDtoUseCase? params}) async {
    return await repository.insertProduct(insertProductRequestDtoUseCase: params!)!;
  }
}
