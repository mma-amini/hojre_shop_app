import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/helpers/brain.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';
import 'package:hojre_shop_app/infrastructure/navigation/routes.dart';
import 'package:hojre_shop_app/presentation/widgets/analog_clock/flutter_analog_clock.dart';
import 'package:hojre_shop_app/presentation/widgets/awesom_dialog/awesome_dialog.dart';
import 'package:hojre_shop_app/presentation/widgets/expandable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? Colors.indigo : Colors.blue,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ExpandablePanel(
                    controller: controller.expandableController,
                    header: userBarWidget(),
                    expanded: Column(
                      children: [
                        const Divider(
                          color: Colors.white,
                        ),
                        CheckboxListTile(
                          value: true,
                          onChanged: (value) {
                            // controller.startApiRequestMoneySystem();
                          },
                          title: const AutoSizeText(
                            "کیف پول سیستمی فعال باشد؟",
                            maxLines: 1,
                            minFontSize: 8.0,
                            maxFontSize: 14.0,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: const AutoSizeText(
                            "کیف پول سیستمی فعال است",
                            style: TextStyle(fontSize: 12.0, color: Colors.white),
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "حجره فروشگاه دار - نسخه: ${Brain.appVersion}",
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Visibility(
                              visible: !kIsWeb,
                              child: Row(
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        // controller.startApiApplicationUpdate(showLoading: true);
                                        controller.updateLocale();
                                      },
                                      child: const Icon(
                                        Icons.system_update_alt,
                                        size: 16.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                    child: VerticalDivider(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Material(
                              color: Colors.transparent,
                              child: InkWell(
                                onTap: () {
                                  Get.changeTheme(
                                    Get.isDarkMode
                                        ? ThemeData(
                                            brightness: Brightness.light,
                                            fontFamily: "Vazir Reg",
                                          )
                                        : ThemeData(
                                            brightness: Brightness.dark,
                                            fontFamily: "Vazir Reg",
                                          ),
                                  );
                                  Future.delayed(const Duration(milliseconds: 250)).then((value) async {
                                    var appTheme = "";
                                    if (Get.isDarkMode) {
                                      appTheme = "DARK";
                                    } else {
                                      appTheme = "LIGHT";
                                    }
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    prefs.setString("APP_THEME", appTheme);
                                    Brain.appTheme = appTheme;
                                  });

                                  controller.justUpdate();
                                },
                                child: const Icon(
                                  FontAwesome5.moon,
                                  color: Colors.white,
                                  size: 16.0,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                              child: VerticalDivider(
                                color: Colors.white,
                              ),
                            ),
                            Visibility(
                              visible: kDebugMode,
                              child: Row(
                                children: [
                                  Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(Routes.DEVELOPER);
                                      },
                                      child: const Icon(
                                        Icons.developer_mode,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10.0,
                                    child: VerticalDivider(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(8.0),
                                  onTap: () {
                                    AwesomeDialog(
                                      context: Get.context!,
                                      animType: AnimType.SCALE,
                                      dialogType: DialogType.WARNING,
                                      body: Text(
                                        LocaleKeys.screen_home_are_you_sure_you_want_to_sign_out.tr,
                                        textAlign: TextAlign.center,
                                      ),
                                      btnOkText: LocaleKeys.buttons_yes.tr,
                                      btnOkOnPress: () {
                                        Brain.logout();
                                      },
                                      btnCancelText: LocaleKeys.buttons_no.tr,
                                      btnCancelOnPress: () {},
                                    ).show();
                                  },
                                  child: const Icon(
                                    FontAwesome.logout,
                                    color: Colors.white,
                                    size: 16.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    hasIcon: false,
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? const Color.fromARGB(255, 17, 17, 88) : Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: Wrap(
                      runSpacing: 16,
                      spacing: 16,
                      children: [
                        InkWell(
                          borderRadius: BorderRadius.circular(12.0),
                          onTap: () {
                            controller.goToProductManagerPage();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Icon(
                                  FontAwesome5.box,
                                  size: 15.0,
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  LocaleKeys.screen_home_products_management.tr,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(12.0),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Icon(
                                  FontAwesome5.shopping_cart,
                                  size: 15.0,
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  LocaleKeys.screen_home_orders_management.tr,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(12.0),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Icon(
                                  FontAwesome5.store,
                                  size: 15.0,
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  LocaleKeys.screen_home_shop_management.tr,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          borderRadius: BorderRadius.circular(12.0),
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Icon(
                                  FontAwesome5.wallet,
                                  size: 15.0,
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  LocaleKeys.screen_home_financial_management.tr,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                Wrap(),
              ],
            ),
          ),
          Obx(() {
            return Visibility(
              visible: controller.isLoading.value,
              child: Container(
                color: const Color.fromARGB(50, 255, 255, 255),
                child: SpinKitCircle(
                  itemBuilder: (BuildContext context, int index) {
                    return DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: index.isEven ? Colors.lightBlueAccent : Colors.yellow,
                      ),
                    );
                  },
                ),
              ),
            );
          })
        ],
      ),
    );
  }

  userBarWidget() {
    return Row(
      children: <Widget>[
        Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(38),
            border: Border.all(color: Colors.white, width: 3),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35.0),
            child: controller.setUserAvatarWidget(),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              controller.setUserFullName(),
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Vazir Med",
                fontSize: 18.0,
              ),
            ),
            Text(
              controller.setUserShopName(),
              style: const TextStyle(
                color: Colors.white,
                fontFamily: "Vazir Med",
                fontSize: 12.0,
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            FlutterAnalogClock(
              dateTime: DateTime.now(),
              dialPlateColor: Colors.transparent,
              hourHandColor: Colors.white,
              minuteHandColor: Colors.white,
              secondHandColor: Colors.white,
              numberColor: Colors.white,
              borderColor: Colors.white,
              tickColor: Colors.white,
              centerPointColor: Colors.white,
              showBorder: false,
              showTicks: true,
              showMinuteHand: true,
              showSecondHand: true,
              showNumber: false,
              borderWidth: 1.0,
              hourNumberScale: 1.0,
              hourNumbers: const ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII'],
              isLive: true,
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(),
            ),
            Text(
              controller.setCurrentDate(),
              style: const TextStyle(
                fontSize: 10.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        )
      ],
    );
  }
}
