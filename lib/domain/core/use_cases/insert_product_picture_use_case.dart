import 'package:dartz/dartz.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/request_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_use_case.dart';

import '../helpers/failure.dart';
import '../interfaces/repositories/repositories.dart';
import '../interfaces/use_cases/i_insert_product_picture_use_case.dart';

class InsertProductPictureUseCase implements IInsertProductPictureUseCase {
  final Repository repository;

  InsertProductPictureUseCase({required this.repository});

  @override
  Future<Either<Failure, NoParams>> handler({InsertProductPictureRequestDtoUseCase? params}) async {
    return await repository.insertProductImage(insertProductPictureRequestDtoUseCase: params!)!;
  }
}
