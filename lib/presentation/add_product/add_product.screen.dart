import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/message_type.dart';
import 'package:hojre_shop_app/domain/core/helpers/show_message.dart';
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
                padding: EdgeInsets.all(8.0),
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    children: [
                      Text(
                        "${LocaleKeys.screen_add_product_product_group.tr}: ${controller.category.value.CategoryName ?? ""}",
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
                                  message: "تمام اطلاعات مورد نظر را وارد نمائید.",
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
                                        "ثبت کالا",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    )
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
