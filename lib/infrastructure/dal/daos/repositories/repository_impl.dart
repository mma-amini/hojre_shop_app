import 'package:dartz/dartz.dart';
import 'package:dio/src/dio.dart';
import 'package:hojre_shop_app/domain/core/helpers/exceptions.dart';
import 'package:hojre_shop_app/domain/core/helpers/failure.dart';
import 'package:hojre_shop_app/domain/core/interfaces/repositories/remote_data_source.dart';
import 'package:hojre_shop_app/domain/core/interfaces/repositories/repositories.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_use_case.dart';

import '../../../../domain/core/dto/use_cases/requests/request_dto_use_case_exports.dart';
import '../../../../domain/core/dto/use_cases/responses/response_dto_use_case_exports.dart';

class RepositoryImpl implements Repository {
  final RemoteDataSource baseRemoteDataSource;

  RepositoryImpl({required this.baseRemoteDataSource});

  @override
  Future<Either<Failure, LoginResponseDtoUseCase>>? refreshToken({required Dio dio}) async {
    try {
      var result = await baseRemoteDataSource.refreshToken(dio: dio);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CheckUserResponseDtoUseCase>>? checkUser(
      {required CheckUserRequestDtoUseCase checkUserRequestDtoUseCase}) async {
    try {
      var result = await baseRemoteDataSource.checkUser(checkUserRequestDtoUseCase: checkUserRequestDtoUseCase);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, LoginResponseDtoUseCase>>? login(
      {required LoginRequestDtoUseCase loginRequestDtoUseCase}) async {
    try {
      var result = await baseRemoteDataSource.login(loginRequestDtoUseCase: loginRequestDtoUseCase);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductGroupsResponseDtoUseCase>>>? productCategories() async {
    try {
      var result = await baseRemoteDataSource.productCategories();

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ShopProductsResponseDtoUseCase>>>? shopProducts(
      {required ShopProductsRequestDtoUseCase shopProductsRequestDtoUseCase}) async {
    try {
      var result =
          await baseRemoteDataSource.shopProducts(shopProductsRequestDtoUseCase: shopProductsRequestDtoUseCase);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<GroupSpecsResponseDtoUseCase>>>? groupSpecs(
      {required GroupSpecsRequestDtoUseCase groupSpecsRequestDtoUseCase}) async {
    try {
      var result = await baseRemoteDataSource.groupSpecs(groupSpecsRequestDtoUseCase: groupSpecsRequestDtoUseCase);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductDesignResponseDtoUseCase>>>? productDesigns(
      {required ProductDesignRequestDtoUseCase productDesignRequestDtoUseCase}) async {
    try {
      var result =
          await baseRemoteDataSource.productDesigns(productDesignRequestDtoUseCase: productDesignRequestDtoUseCase);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<BrandResponseDtoUseCase>>>? brands(
      {required BrandsRequestDtoUseCase brandsRequestDtoUseCase}) async {
    try {
      var result = await baseRemoteDataSource.brands(brandsRequestDtoUseCase: brandsRequestDtoUseCase);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, InsertProductResponseDtoUseCase>>? insertProduct(
      {required InsertProductRequestDtoUseCase insertProductRequestDtoUseCase}) async {
    try {
      var result =
          await baseRemoteDataSource.insertProduct(insertProductRequestDtoUseCase: insertProductRequestDtoUseCase);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, NoParams>>? insertProductImage(
      {required InsertProductPictureRequestDtoUseCase insertProductPictureRequestDtoUseCase}) async {
    try {
      var result = await baseRemoteDataSource.insertProductImages(
          insertProductPictureRequestDtoUseCase: insertProductPictureRequestDtoUseCase);

      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
