import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/models/account_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/token_model.dart';
import 'package:hojre_shop_app/domain/core/helpers/show_message.dart';
import 'package:hojre_shop_app/infrastructure/dal/daos/data_sources/local_data_source_impl.dart';
import 'package:hojre_shop_app/infrastructure/dal/services/database/storage_service.dart';
import 'package:hojre_shop_app/infrastructure/navigation/routes.dart';

class Brain {
  static String _baseDomain = "";
  static VMToken _token = const VMToken();
  static VMAccount _account = VMAccount();
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
  static String _appTheme = "LIGHT";
  static String _appName = "";
  static String _packageName = "";
  static String _application = "tech.hadish.shop";
  static Map<String, dynamic> _deviceData = {};
  static String _deviceId = "";

  static checkUser() {
    if ((Brain.account.UserId ?? "").isNotEmpty && (Brain.token.AccessToken ?? "").isNotEmpty) {
      return true;
    }
    return false;
  }

  static logout() async {
    await LocalDataSourceImpl.deleteAccount();
    await LocalDataSourceImpl.deleteToken();
    ShowMessage.getSnackBar(message: "از حساب کاربری خارج شدید");
    Get.offAllNamed(Routes.LOGIN);
  }

  static Map<String, dynamic> readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
      'systemFeatures': build.systemFeatures,
    };
  }

  static Map<String, dynamic> readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  static Map<String, dynamic> readLinuxDeviceInfo(LinuxDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'version': data.version,
      'id': data.id,
      'idLike': data.idLike,
      'versionCodename': data.versionCodename,
      'versionId': data.versionId,
      'prettyName': data.prettyName,
      'buildId': data.buildId,
      'variant': data.variant,
      'variantId': data.variantId,
      'machineId': data.machineId,
    };
  }

  static Map<String, dynamic> readWebBrowserInfo(WebBrowserInfo data) {
    return <String, dynamic>{
      'browserName': describeEnum(data.browserName),
      'appCodeName': data.appCodeName,
      'appName': data.appName,
      'appVersion': data.appVersion,
      'deviceMemory': data.deviceMemory,
      'language': data.language,
      'languages': data.languages,
      'platform': data.platform,
      'product': data.product,
      'productSub': data.productSub,
      'userAgent': data.userAgent,
      'vendor': data.vendor,
      'vendorSub': data.vendorSub,
      'hardwareConcurrency': data.hardwareConcurrency,
      'maxTouchPoints': data.maxTouchPoints,
    };
  }

  static Map<String, dynamic> readMacOsDeviceInfo(MacOsDeviceInfo data) {
    return <String, dynamic>{
      'computerName': data.computerName,
      'hostName': data.hostName,
      'arch': data.arch,
      'model': data.model,
      'kernelVersion': data.kernelVersion,
      'osRelease': data.osRelease,
      'activeCPUs': data.activeCPUs,
      'memorySize': data.memorySize,
      'cpuFrequency': data.cpuFrequency,
      'systemGUID': data.systemGUID,
    };
  }

  static Map<String, dynamic> readWindowsDeviceInfo(WindowsDeviceInfo data) {
    return <String, dynamic>{
      'numberOfCores': data.numberOfCores,
      'computerName': data.computerName,
      'systemMemoryInMegabytes': data.systemMemoryInMegabytes,
    };
  }

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

  static VMAccount get account => _account;

  static set account(VMAccount value) {
    _account = value;
  }

  static String get appTheme => _appTheme;

  static set appTheme(String value) {
    _appTheme = value;
  }

  static String get appName => _appName;

  static set appName(String value) {
    _appName = value;
  }

  static String get application => _application;

  static set application(String value) {
    _application = value;
  }

  static String get packageName => _packageName;

  static set packageName(String value) {
    _packageName = value;
  }

  static Map<String, dynamic> get deviceData => _deviceData;

  static set deviceData(Map<String, dynamic> value) {
    _deviceData = value;
  }

  static String get deviceId => _deviceId;

  static set deviceId(String value) {
    _deviceId = value;
  }
}
