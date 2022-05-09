import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';

import 'controllers/add_product.controller.dart';

class AddProductScreen extends GetView<AddProductController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.screen_add_product_page_title.tr),
          ),
          body: Obx(() {
            return Visibility(
              visible: (controller.category.value.CategoryId ?? "").isNotEmpty,
              child: Container(
                child: Text("asdas"),
              ),
            );
          }),
        );
      },
    );
  }
}
