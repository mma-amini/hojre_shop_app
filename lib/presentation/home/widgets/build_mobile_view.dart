import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../../widgets/loading_view/loading_view.widget.dart';
import '../controllers/home.controller.dart';
import 'widgets_export.dart';

class BuildMobileView extends StatelessWidget {
  BuildMobileView({Key? key}) : super(key: key);

  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                HomeAppBarWidget(key: const Key("HomeAppBarWidget")),
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
                        DashboardMainButtonWidget(
                          iconData: FontAwesome5.box,
                          label: LocaleKeys.screen_home_products_management.tr,
                          onTap: () {
                            controller.goToProductManagerPage();
                          },
                        ),
                        DashboardMainButtonWidget(
                          iconData: FontAwesome5.shopping_cart,
                          label: LocaleKeys.screen_home_orders_management.tr,
                          onTap: () {},
                        ),
                        DashboardMainButtonWidget(
                          iconData: FontAwesome5.store,
                          label: LocaleKeys.screen_home_shop_management.tr,
                          onTap: () {},
                        ),
                        DashboardMainButtonWidget(
                          iconData: FontAwesome5.wallet,
                          label: LocaleKeys.screen_home_financial_management.tr,
                          onTap: () {},
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
          LoadingViewWidget(key: const Key("HomeScreen LoadingViewWidget")),
        ],
      ),
    );
  }
}
