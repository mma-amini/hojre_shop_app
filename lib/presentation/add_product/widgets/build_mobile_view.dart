import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../../widgets/main_app_bar/main_app_bar.dart';
import '../controllers/add_product.controller.dart';
import 'widgets_export.dart';

class BuildMobileView extends StatelessWidget {
  BuildMobileView({Key? key}) : super(key: key);

  final controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar().init(
        title: Text(LocaleKeys.screen_add_product_page_title.tr),
        centerTitle: true,
        onBack: () {
          Get.back();
        },
      ),
      body: Obx(() {
        return Visibility(
          visible: (controller.category.value.id ?? "").isNotEmpty,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  CategoryNameWidget(key: Key("CategoryNameWidget mobile")),
                  const SizedBox(
                    height: 16.0,
                  ),
                  AddProductStepper(key: Key("AddProductStepper mobile")),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SubmitButton(key: Key("SubmitButton mobile")),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
