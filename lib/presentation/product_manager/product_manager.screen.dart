import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'controllers/product_manager.controller.dart';
import 'widgets/build_desktop_view.dart';
import 'widgets/build_mobile_view.dart';

class ProductManagerScreen extends GetView<ProductManagerController> {
  const ProductManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWrapper.of(context).isLargerThan(MOBILE)
        ? BuildDesktopView(key: Key("ProductManagerScreen BuildDesktopView"))
        : BuildMobileView(key: Key("ProductManagerScreen BuildMobileView"));
  }
}
