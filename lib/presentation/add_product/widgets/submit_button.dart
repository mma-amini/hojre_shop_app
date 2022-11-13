import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/dto/enums/message_type.dart';
import '../../../domain/core/helpers/show_message.dart';
import '../../../generated/locales.g.dart';
import '../controllers/add_product.controller.dart';

class SubmitButton extends StatelessWidget {
  SubmitButton({Key? key}) : super(key: key);

  final controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8.0),
      elevation: 3.0,
      color: Colors.blueAccent,
      child: InkWell(
        onTap: () {
          // Conditions
          var checkFormValidate = controller.formKey.currentState!.validate();

          if (checkFormValidate) {
            controller.onFormSaved(isMain: true);
          } else {
            ShowMessage.snackBar(
              message: LocaleKeys.screen_add_product_fields_error_enter_all_the_required_information.tr,
              type: MessageType.ERROR,
              context: context,
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.blueAccent, width: 2.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Text(
                  LocaleKeys.screen_add_product_buttons_register_product.tr,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
