import 'package:flutter/foundation.dart';

class LogHelper {
  static printLog(
      {required dynamic data, LogHelperType logHelperType = LogHelperType.INFO, bool showInRelease = false}) {
    if (kDebugMode || showInRelease) {
      print("*****************| ${logHelperType.name}: $data |*****************");
    }
  }
}

enum LogHelperType {
  INFO,
  ERROR,
}
