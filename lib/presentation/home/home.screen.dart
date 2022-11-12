import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_wrapper.dart';

import 'controllers/home.controller.dart';
import 'widgets/build_desktop_view.dart';
import 'widgets/build_mobile_view.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isLargerThan(MOBILE)
        ? BuildMobileView(key: Key("HomeScreen BuildMobileView"))
        : BuildDesktopView(key: Key("HomeScreen BuildDesktopView"));
  }
}
