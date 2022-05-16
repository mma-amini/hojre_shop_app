import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'domain/core/dto/enums/database_type.dart';
import 'domain/core/helpers/base_dio.dart';
import 'domain/core/helpers/brain.dart';
import 'domain/core/interfaces/repositories/remote_data_source.dart';
import 'domain/core/interfaces/repositories/repositories.dart';
import 'domain/core/interfaces/use_cases/i_use_case_exports.dart';
import 'domain/core/use_cases/use_case_exports.dart';
import 'infrastructure/dal/daos/data_sources/remote_data_source_impl.dart';
import 'infrastructure/dal/daos/repositories/repository_impl.dart';
import 'infrastructure/dal/services/database/init_database.dart';
import 'infrastructure/dal/services/database/storage_service.dart';
import 'infrastructure/dal/services/database/storage_service_hive.dart';
import 'infrastructure/dal/services/database/storage_service_sqflite.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Storage
  await initDatabase(dataBaseType: DataBaseType.HIVE);
  Brain.storageService = InitDatabase.storageService;

  // Base Dio
  Brain.dio = BaseDio().dio;

  // Use cases
  sl.registerLazySingleton(() => CheckUserUseCase(repository: sl()));
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));
  sl.registerLazySingleton(() => RefreshTokenUseCase(repository: sl()));
  sl.registerLazySingleton(() => ProductGroupsUseCase(repository: sl()));
  sl.registerLazySingleton(() => ShopProductsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GroupSpecsUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      baseRemoteDataSource: sl(),
    ),
  );

  sl.registerLazySingleton<ICheckUserUseCase>(
    () => CheckUserUseCase(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton<ILoginUseCase>(
    () => LoginUseCase(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton<IRefreshTokenUseCase>(
    () => RefreshTokenUseCase(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton<IProductGroupsUseCase>(
    () => ProductGroupsUseCase(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton<IShopProductsUseCase>(
    () => ShopProductsUseCase(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton<IGroupSpecsUseCase>(
    () => GroupSpecsUseCase(
      repository: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImpl(),
  );
}

initDatabase({required DataBaseType dataBaseType}) async {
  switch (dataBaseType) {
    case DataBaseType.HIVE:
      sl.registerLazySingleton<StorageService>(() => StorageServiceHive());
      await Hive.initFlutter();
      Hive.registerAdapter(VMDatabaseAdapter());
      await Hive.openBox<VMDatabase>(StorageServiceHive.dbBoxName);

      InitDatabase.storageService = sl<StorageService>();
      break;
    case DataBaseType.SQLITE:
      sl.registerLazySingleton<StorageService>(() => StorageServiceSqflite());
      break;
  }
}
