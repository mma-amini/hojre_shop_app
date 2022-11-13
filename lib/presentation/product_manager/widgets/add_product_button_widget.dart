import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../controllers/product_manager.controller.dart';

class AddProductButtonWidget extends StatelessWidget {
  AddProductButtonWidget({Key? key}) : super(key: key);

  final controller = Get.find<ProductManagerController>();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed(Routes.ADD_PRODUCT);
      },
      tooltip: LocaleKeys.screen_product_manager_add_product_button_tooltip.tr,
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
