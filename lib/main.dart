import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/injection_container.dart';

import 'generated/locales.g.dart';
import 'infrastructure/navigation/navigation.dart';
import 'infrastructure/navigation/routes.dart';

void main() async {
  await init();
  var initialRoute = await Routes.initialRoute;
  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  Main(this.initialRoute);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'app_name'.tr,
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
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Vazir Reg",
      ),
      defaultTransition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
