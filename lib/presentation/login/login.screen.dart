import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'controllers/login.controller.dart';
import 'widgets/build_desktop_view.dart';
import 'widgets/build_mobile_view.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveWrapper.of(context).isLargerThan(MOBILE) ? BuildMobileView() : BuildDesktopView(),
    );
  }
}
