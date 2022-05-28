import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/request_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/response_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/helpers/failure.dart';

abstract class Repository {
  Future<Either<Failure, CheckUserResponseDtoUseCase>>? checkUser(
      {required CheckUserRequestDtoUseCase checkUserRequestDtoUseCase});

  Future<Either<Failure, LoginResponseDtoUseCase>>? login({required LoginRequestDtoUseCase loginRequestDtoUseCase});

  Future<Either<Failure, LoginResponseDtoUseCase>>? refreshToken({required Dio dio});

  Future<Either<Failure, List<ProductGroupsResponseDtoUseCase>>>? productCategories();

  Future<Either<Failure, List<ShopProductsResponseDtoUseCase>>>? shopProducts(
      {required ShopProductsRequestDtoUseCase shopProductsRequestDtoUseCase});

  Future<Either<Failure, List<GroupSpecsResponseDtoUseCase>>>? groupSpecs(
      {required GroupSpecsRequestDtoUseCase groupSpecsRequestDtoUseCase});

  Future<Either<Failure, List<ProductDesignResponseDtoUseCase>>>? productDesigns(
      {required ProductDesignRequestDtoUseCase productDesignRequestDtoUseCase});
}
