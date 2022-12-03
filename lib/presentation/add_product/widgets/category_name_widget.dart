import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';

import '../../../domain/core/dto/enums/message_type.dart';
import '../../../generated/locales.g.dart';
import '../../widgets/base_dialog.dart';
import '../controllers/add_product.controller.dart';
import 'set_title_widget.dart';

class CategoryNameWidget extends StatelessWidget {
  CategoryNameWidget({Key? key}) : super(key: key);

  final controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SetTitleWidget(title: "${LocaleKeys.screen_add_product_product_group.tr}:"),
        Expanded(
          child: Obx(() {
            return Text(
              controller.category.value.categoryName ?? "",
            );
          }),
        ),
        const SizedBox(
          width: 8.0,
        ),
        IconButton(
          onPressed: () {
            BaseDialog(
              messageType: MessageType.WARNING,
              btnOkText: LocaleKeys.buttons_confirm.tr,
              btnOkOnTap: () {
                controller.openProductGroupsDialog();
              },
              btnCancelText: LocaleKeys.buttons_no.tr,
              btnCancelOnTap: () {
                Get.back();
              },
              massage: LocaleKeys.screen_add_product_if_the_product_group_is_changed_the_entered_properties_will_be_lost.tr,
            ).showBaseDialog();
          },
          icon: const Icon(
            FontAwesome.edit,
          ),
        ),
      ],
    );
  }
}
