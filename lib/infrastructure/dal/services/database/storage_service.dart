import 'storage_service_tables.dart';

abstract class StorageService {
  Future insert({required Map data, required StorageServiceTables storageServiceTables});

  Future deleteByProperty(StorageServiceTables storageServiceTables);

  Future<Map?> getByProperty(StorageServiceTables storageServiceTables);

  Future<Map?> futureGetData({required StorageServiceTables storageServiceTables});
}
