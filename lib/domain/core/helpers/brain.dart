import 'package:dio/dio.dart';
import 'package:hojre_shop_app/domain/core/dto/models/token_model.dart';
import 'package:hojre_shop_app/infrastructure/dal/services/database/storage_service.dart';

class Brain {
  static String _baseDomain = "";
  static VMToken _token = VMToken();
  static String _cityID = "";
  static String _addressID = "";
  static String _appVersion = "";
  static String _appBuildNumber = "";
  static String _deviceID = "";
  static String _playerID = "";
  static String _platform = "";
  static String _os = "";
  static late StorageService _storageService;
  static late Dio _dio;
  static bool _showBottomPanel = false;

  static bool get showBottomPanel => _showBottomPanel;

  static set showBottomPanel(bool value) {
    _showBottomPanel = value;
  }

  static String get baseDomain => _baseDomain;

  static set baseDomain(String value) {
    _baseDomain = value;
  }

  static VMToken get token => _token;

  static set token(VMToken value) {
    _token = value;
  }

  static String get cityID => _cityID;

  static set cityID(String value) {
    _cityID = value;
  }

  static String get addressID => _addressID;

  static set addressID(String value) {
    _addressID = value;
  }

  static String get appVersion => _appVersion;

  static set appVersion(String value) {
    _appVersion = value;
  }

  static String get playerID => _playerID;

  static set playerID(String value) {
    _playerID = value;
  }

  static String get deviceID => _deviceID;

  static set deviceID(String value) {
    _deviceID = value;
  }

  static String get appBuildNumber => _appBuildNumber;

  static set appBuildNumber(String value) {
    _appBuildNumber = value;
  }

  static String get platform => _platform;

  static set platform(String value) {
    _platform = value;
  }

  static String get os => _os;

  static set os(String value) {
    _os = value;
  }

  static StorageService get storageService => _storageService;

  static set storageService(StorageService value) {
    _storageService = value;
  }

  static Dio get dio => _dio;

  static set dio(Dio value) {
    _dio = value;
  }
}
