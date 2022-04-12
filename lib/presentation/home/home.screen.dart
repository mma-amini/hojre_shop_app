import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/helpers/brain.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';
import 'package:hojre_shop_app/presentation/widgets/analog_clock/flutter_analog_clock.dart';
import 'package:hojre_shop_app/presentation/widgets/awesom_dialog/awesome_dialog.dart';
import 'package:hojre_shop_app/presentation/widgets/expandable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: ListView(
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? Colors.indigo : Colors.blue,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ExpandablePanel(
                    controller: controller.expandableController,
                    header: userBarWidget(),
                    expanded: Container(
                      child: Column(
                        children: [
                          Divider(
                            color: Colors.white,
                          ),
                          CheckboxListTile(
                            value: true,
                            onChanged: (value) {
                              // controller.startApiRequestMoneySystem();
                            },
                            title: AutoSizeText(
                              "کیف پول سیستمی فعال باشد؟",
                              maxLines: 1,
                              minFontSize: 8.0,
                              maxFontSize: 14.0,
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: AutoSizeText(
                              true ? "کیف پول سیستمی فعال است" : "کیف پول سیستمی غیرفعال است",
                              style: TextStyle(fontSize: 12.0, color: Colors.white),
                            ),
                          ),
                          Divider(
                            color: Colors.white,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Text(
                                    "حجره فروشگاه دار - نسخه: ${Brain.appVersion}",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: !kIsWeb,
                                child: Row(
                                  children: [
                                    Container(
                                      child: Material(
                                        color: Colors.transparent,
                                        child: InkWell(
                                          onTap: () {
                                            // controller.startApiApplicationUpdate(showLoading: true);
                                          },
                                          child: Icon(
                                            Icons.system_update_alt,
                                            size: 16.0,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 10.0,
                                      child: VerticalDivider(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {
                                      Get.changeTheme(Get.isDarkMode
                                          ? ThemeData(brightness: Brightness.light, fontFamily: "Vazir Reg")
                                          : ThemeData(brightness: Brightness.dark, fontFamily: "Vazir Reg"));
                                      Future.delayed(Duration(milliseconds: 250)).then((value) async {
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
                                    child: Container(
                                      child: Icon(
                                        FontAwesome5.moon,
                                        color: Colors.white,
                                        size: 16.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
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
                                          // Get.toNamed(Routes.DEVELOPER);
                                        },
                                        child: Container(
                                          child: Icon(
                                            Icons.developer_mode,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 10.0,
                                      child: VerticalDivider(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(4.0),
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
                                          "آیا برای خروج از حساب کاربری خود مطمئن هستید؟",
                                          textAlign: TextAlign.center,
                                        ),
                                        btnOkText: "بله",
                                        btnOkOnPress: () {
                                          Brain.logout();
                                        },
                                        btnCancelText: "خیر",
                                        btnCancelOnPress: () {},
                                      )..show();
                                    },
                                    child: Icon(
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
                    ),
                    hasIcon: false,
                  ),
                ),
                SizedBox(
                  height: 8.0,
                ),
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? Color.fromARGB(255, 17, 17, 88) : Colors.grey.withOpacity(0.5),
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
                                Icon(
                                  FontAwesome5.box,
                                  size: 15.0,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  LocaleKeys.screen_home_products_management.tr,
                                  style: TextStyle(
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
                                Icon(
                                  FontAwesome5.shopping_cart,
                                  size: 15.0,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  LocaleKeys.screen_home_orders_management.tr,
                                  style: TextStyle(
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
                                Icon(
                                  FontAwesome5.store,
                                  size: 15.0,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  LocaleKeys.screen_home_shop_management.tr,
                                  style: TextStyle(
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
                                Icon(
                                  FontAwesome5.wallet,
                                  size: 15.0,
                                ),
                                SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  LocaleKeys.screen_home_financial_management.tr,
                                  style: TextStyle(
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
                SizedBox(
                  height: 8.0,
                ),
                Wrap(),
                controller.isLoading.value
                    ? Container(
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
                      )
                    : Container()
              ],
            ),
          ),
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
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(controller.setUserFullName(),
                style: TextStyle(color: Colors.white, fontFamily: "Vazir Med", fontSize: 18.0)),
            Text(
              controller.setUserShopName(),
              style: TextStyle(color: Colors.white, fontFamily: "Vazir Med", fontSize: 12.0),
            ),
          ],
        ),
        Spacer(),
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
              hourNumbers: ['I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X', 'XI', 'XII'],
              isLive: true,
              width: 50.0,
              height: 50.0,
              decoration: const BoxDecoration(),
            ),
            Text(
              controller.setCurrentDate(),
              style: TextStyle(
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
