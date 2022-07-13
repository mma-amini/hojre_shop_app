import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/helpers/brain.dart';
import 'package:hojre_shop_app/domain/core/helpers/log_helper.dart';
import 'package:hojre_shop_app/infrastructure/navigation/routes.dart';
import 'package:hojre_shop_app/presentation/widgets/expandable.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;

  ExpandableController expandableController = ExpandableController();

  @override
  void onInit() {
    super.onInit();
    initPlatformState();
  }

  @override
  void onClose() {}

  Future<void> initPlatformState() async {
    try {
      DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
      if (kIsWeb) {
        Brain.deviceData = Brain.readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
      } else {
        if (GetPlatform.isAndroid) {
          Brain.deviceData = Brain.readAndroidBuildData(await deviceInfoPlugin.androidInfo);
          Brain.deviceId = Brain.deviceData["androidId"];
        } else if (GetPlatform.isIOS) {
          Brain.deviceData = Brain.readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
          Brain.deviceId = Brain.deviceData["identifierForVendor"];
        } else if (GetPlatform.isWindows) {
          Brain.deviceData = Brain.readWindowsDeviceInfo(await deviceInfoPlugin.windowsInfo);
          Brain.deviceId = Brain.deviceData["computerName"];
        } else if (GetPlatform.isMacOS) {
          Brain.deviceData = Brain.readMacOsDeviceInfo(await deviceInfoPlugin.macOsInfo);
          Brain.deviceId = Brain.deviceData["systemGUID"];
        }
      }
      LogHelper.printLog(data: "Device information: ${jsonEncode(Brain.deviceData)}");
    } on PlatformException {
      Brain.deviceData = <String, dynamic>{'Error:': 'Failed to get platform version.'};
    }

    LogHelper.printLog(data: "Device ID: ${Brain.deviceId}");
    update();
  }

  updateLoading({required bool isLoading}) {
    this.isLoading.update((val) {
      this.isLoading.value = isLoading;
    });
  }

  updateLocale() {
    var locale = Get.locale;

    if (locale.toString() == "fa_IR") {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('fa', 'IR'));
    }

    update();
  }

  setUserAvatarWidget() {
    // Conditions
    var checkUser = Brain.checkUser();

    if (checkUser) {
      return FadeInImage(
        placeholder: const AssetImage("assets/media/images/profile_icon.png"),
        image: NetworkImage("${Brain.baseDomain}/profile/${Brain.account.userId}.jpg"),
        height: 60,
        width: 60,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        "assets/media/images/profile_icon.png",
        height: 60,
        width: 60,
        fit: BoxFit.cover,
      );
    }
  }

  setUserFullName() {
    if ((Brain.account.userId ?? "").isNotEmpty) {
      return "${Brain.account.firstName!} ${Brain.account.lastName!}";
    } else {
      return "یار";
    }
  }

  setUserShopName() {
    // Conditions
    var checkSection = (Brain.account.shopName ?? "").isNotEmpty;

    if (checkSection) {
      return Brain.account.shopName;
    } else {
      return "فروشگاه حجره";
    }
  }

  String setCurrentDate() {
    String currentDate = DateTime.now().toPersianDateStr(strMonth: true);
    return currentDate;
  }

  justUpdate() {
    update();
  }

  /****************************************/
  /**************** Routes ****************/
  /// **************************************/

  goToProductManagerPage() {
    Get.toNamed(Routes.PRODUCT_MANAGER);
  }
}
