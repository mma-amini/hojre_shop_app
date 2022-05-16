import 'package:dartz/dartz.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/group_specs_request_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/group_specs_response_dto_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_group_specs_use_case.dart';

import '../helpers/failure.dart';
import '../interfaces/repositories/repositories.dart';

class GroupSpecsUseCase implements IGroupSpecsUseCase {
  final Repository repository;

  GroupSpecsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<GroupSpecsResponseDtoUseCase>>> Handler({GroupSpecsRequestDtoUseCase? params}) async {
    return await repository.groupSpecs(groupSpecsRequestDtoUseCase: params!)!;
  }
}
