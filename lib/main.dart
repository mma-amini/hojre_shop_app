import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/models/account_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/token_model.dart';
import 'package:hojre_shop_app/domain/core/helpers/brain.dart';
import 'package:hojre_shop_app/domain/core/helpers/custom_scroll_behavior.dart';
import 'package:hojre_shop_app/injection_container.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'generated/locales.g.dart';
import 'infrastructure/dal/daos/data_sources/local_data_source_impl.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  if (!kIsWeb && kDebugMode) {
    HttpClient.enableTimelineLogging = true;
  }

  await init();
  await LocalDataSourceImpl.getAccount().then((value) {
    Brain.account = value ?? VMAccount();
  });
  await LocalDataSourceImpl.getToken().then((value) {
    Brain.token = value ?? const VMToken();
  });

  appInfo();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  if (prefs.containsKey("APP_THEME")) {
    String? appTheme = prefs.getString("APP_THEME");
    Brain.appTheme = appTheme!;
  } else {
    await prefs.setString("APP_THEME", "LIGHT").then((value) {
      String? appTheme = prefs.getString("APP_THEME");
      Brain.appTheme = appTheme!;
    });
  }

  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

Future<void> appInfo() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      Brain.appName = packageInfo.appName;
      Brain.packageName = packageInfo.packageName;
      Brain.appVersion = packageInfo.version;
      Brain.appBuildNumber = packageInfo.buildNumber;
    });

    if (kIsWeb) {
      Brain.platform = "Web";
    } else {
      if (Platform.isAndroid) {
        Brain.platform = "Android";
      } else if (Platform.isIOS) {
        Brain.platform = "iOS";
      } else if (Platform.isWindows) {
        Brain.platform = "Windows";
      } else if (Platform.isLinux) {
        Brain.platform = "Linux";
      } else if (Platform.isMacOS) {
        Brain.platform = "MacOS";
      } else if (Platform.isFuchsia) {
        Brain.platform = "Fuchsia";
      }
    }
  } catch (e) {
    print(e);
  }
}

class Main extends StatelessWidget {
  final String initialRoute;

  const Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scrollBehavior: CustomScrollBehavior(),
      title: LocaleKeys.app_name.tr,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      translationsKeys: AppTranslation.translations,
      supportedLocales: const [
        Locale("fa", "IR"),
        Locale("en", "US"),
      ],
      locale: const Locale("fa", "IR"),
      darkTheme: ThemeData(
        brightness: Brightness.light,
        fontFamily: "Vazir Reg",
      ),
      theme: Brain.appTheme == "LIGHT"
          ? ThemeData(
              brightness: Brightness.light,
              fontFamily: "Vazir Reg",
              appBarTheme: const AppBarTheme(
                color: Colors.blue,
              ),
            )
          : ThemeData(
              brightness: Brightness.dark,
              fontFamily: "Vazir Reg",
            ),
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
