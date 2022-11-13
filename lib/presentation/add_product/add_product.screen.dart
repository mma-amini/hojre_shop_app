import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'controllers/add_product.controller.dart';
import 'widgets/build_desktop_view.dart';
import 'widgets/build_mobile_view.dart';

class AddProductScreen extends GetView<AddProductController> {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isLargerThan(MOBILE)
        ? BuildDesktopView(key: Key("AddProductScreen BuildDesktopView"))
        : BuildMobileView(key: Key("AddProductScreen BuildMobileView"));
  }
}
