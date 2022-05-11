import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/message_type.dart';
import 'package:hojre_shop_app/domain/core/helpers/show_message.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';
import 'package:hojre_shop_app/presentation/widgets/awesom_dialog/awesome_dialog.dart';

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
                padding: EdgeInsets.all(8.0),
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "${LocaleKeys.screen_add_product_product_group.tr}: ${controller.category.value.CategoryName ?? ""}",
                            ),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          IconButton(
                            onPressed: () {
                              AwesomeDialog(
                                  context: Get.context!,
                                  body: Container(
                                    child: Text(
                                      LocaleKeys
                                          .screen_add_product_if_the_product_group_is_changed_the_entered_properties_will_be_lost
                                          .tr,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  dismissOnTouchOutside: false,
                                  btnOkText: LocaleKeys.buttons_confirm.tr,
                                  btnOkOnPress: () {
                                    controller.openProductGroupsDialog();
                                  },
                                  btnCancelText: LocaleKeys.buttons_cancel.tr,
                                  btnCancelOnPress: () {})
                                ..show();
                            },
                            icon: Icon(
                              FontAwesome.edit,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          // Conditions
                          var checkValue = value == null || value.isEmpty;

                          if (checkValue) {
                            return LocaleKeys.screen_add_product_fields_error_general_error.trParams(
                              {
                                "field": "${LocaleKeys.screen_add_product_fields_name_product_name.tr}",
                              },
                            );
                          }
                          return null;
                        },
                        controller: controller.productNameController,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.screen_add_product_fields_name_product_name.tr,
                          alignLabelWithHint: true,
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      Container(
                        child: Material(
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
                                  message:
                                      LocaleKeys.screen_add_product_fields_error_enter_all_the_required_information.tr,
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
                              padding: EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Container(
                                      child: Text(
                                        LocaleKeys.screen_add_product_buttons_register_product.tr,
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
