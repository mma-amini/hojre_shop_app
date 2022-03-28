import 'storage_service.dart';

class InitDatabase {
  static StorageService? _storageService;

  static StorageService get storageService => _storageService!;

  static set storageService(StorageService value) {
    _storageService = value;
  }
}
