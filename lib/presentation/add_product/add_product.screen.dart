import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/message_type.dart';
import 'package:hojre_shop_app/domain/core/helpers/show_message.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';
import 'package:hojre_shop_app/presentation/widgets/awesom_dialog/awesome_dialog.dart';
import 'package:hojre_shop_app/presentation/widgets/custom_input_format.dart';

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
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: controller.formKey,
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          setTitleWidget(title: "${LocaleKeys.screen_add_product_product_group.tr}:"),
                          Expanded(
                            child: Text(
                              "${controller.category.value.CategoryName ?? ""}",
                            ),
                          ),
                          const SizedBox(
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
                                btnCancelOnPress: () {},
                              ).show();
                            },
                            icon: const Icon(
                              FontAwesome.edit,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      setTitleWidget(title: LocaleKeys.screen_add_product_basic_specifications.tr),
                      const SizedBox(
                        height: 16.0,
                      ),
                      TextFormField(
                        validator: (value) {
                          // Conditions
                          var checkValue = value == null || value.isEmpty;

                          if (checkValue) {
                            return LocaleKeys.screen_add_product_fields_error_general_error.trParams(
                              {
                                "field": LocaleKeys.screen_add_product_fields_name_product_name.tr,
                              },
                            );
                          }
                          return null;
                        },
                        controller: controller.productNameController,
                        decoration: InputDecoration(
                          labelText: LocaleKeys.screen_add_product_fields_name_product_name.tr,
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      setTitleWidget(title: LocaleKeys.screen_add_product_packaging_dimensions.tr),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          LocaleKeys.screen_add_product_enter_number_between_x_and_x_cm.trParams(
                            {
                              "min": "1",
                              "max": "1000",
                            },
                          ),
                          style: TextStyle(fontSize: 12.0, color: Colors.blue),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (value) {
                                  // Conditions
                                  var checkValue = value == null || value.isEmpty;
                                  var checkWeight = !checkValue &&
                                      (int.parse(controller.productPackLengthController.text) < 1 ||
                                          int.parse(controller.productPackLengthController.text) > 1000);

                                  if (checkValue) {
                                    return LocaleKeys.screen_add_product_fields_error_general_error.trParams(
                                      {
                                        "field": LocaleKeys.screen_add_product_fields_name_length.tr,
                                      },
                                    );
                                  } else if (checkWeight) {
                                    return LocaleKeys.screen_add_product_fields_error_numerical_between_x_and_x
                                        .trParams(
                                      {
                                        "min": "1",
                                        "max": "1000",
                                      },
                                    );
                                  }
                                  return null;
                                },
                                controller: controller.productPackLengthController,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LimitNumberInputFormatter(minNumber: 1, maxNumber: 1000)
                                ],
                                decoration: InputDecoration(
                                  labelText: LocaleKeys.screen_add_product_fields_name_length_cm.tr,
                                  hintText: "0",
                                  alignLabelWithHint: true,
                                  border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (value) {
                                  // Conditions
                                  var checkValue = value == null || value.isEmpty;
                                  var checkWeight = !checkValue &&
                                      (int.parse(controller.productPackWidthController.text) < 1 ||
                                          int.parse(controller.productPackWidthController.text) > 1000);

                                  if (checkValue) {
                                    return LocaleKeys.screen_add_product_fields_error_general_error.trParams(
                                      {
                                        "field": LocaleKeys.screen_add_product_fields_name_width.tr,
                                      },
                                    );
                                  } else if (checkWeight) {
                                    return LocaleKeys.screen_add_product_fields_error_numerical_between_x_and_x
                                        .trParams(
                                      {
                                        "min": "1",
                                        "max": "1000",
                                      },
                                    );
                                  }
                                  return null;
                                },
                                controller: controller.productPackWidthController,
                                focusNode: GetPlatform.isMobile ? controller.productPackWidthNode : null,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LimitNumberInputFormatter(minNumber: 1, maxNumber: 1000)
                                ],
                                decoration: InputDecoration(
                                  labelText: 'عرض (cm)',
                                  hintText: "0",
                                  alignLabelWithHint: true,
                                  border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: TextFormField(
                                validator: (value) {
                                  // Conditions
                                  var checkValue = value == null || value.isEmpty;
                                  var checkWeight = !checkValue &&
                                      (int.parse(controller.productPackHeightController.text) < 1 ||
                                          int.parse(controller.productPackHeightController.text) > 1000);

                                  if (checkValue) {
                                    return LocaleKeys.screen_add_product_fields_error_general_error.trParams(
                                      {
                                        "field": LocaleKeys.screen_add_product_fields_name_height.tr,
                                      },
                                    );
                                  } else if (checkWeight) {
                                    return LocaleKeys.screen_add_product_fields_error_numerical_between_x_and_x
                                        .trParams(
                                      {
                                        "min": "1",
                                        "max": "1000",
                                      },
                                    );
                                  }
                                  return null;
                                },
                                controller: controller.productPackHeightController,
                                focusNode: GetPlatform.isMobile ? controller.productPackHeightNode : null,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LimitNumberInputFormatter(minNumber: 1, maxNumber: 1000)
                                ],
                                decoration: InputDecoration(
                                  labelText: LocaleKeys.screen_add_product_fields_name_height_cm.tr,
                                  hintText: "0",
                                  alignLabelWithHint: true,
                                  border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      setTitleWidget(title: LocaleKeys.screen_add_product_package_weight.tr),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "${LocaleKeys.screen_add_product_enter_number_between_x_and_x.trParams(
                            {
                              "min": "1",
                              "max": "1000",
                            },
                          )}. ${LocaleKeys.screen_add_product_also_select_the_type_of_weight.tr}",
                          style: TextStyle(fontSize: 12.0, color: Colors.blue),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                validator: (value) {
                                  // Conditions
                                  var checkValue = value == null || value.isEmpty;
                                  var checkWeight = !checkValue &&
                                      (int.parse(controller.productWeightController.text) < 1 ||
                                          int.parse(controller.productWeightController.text) > 1000);

                                  if (checkValue) {
                                    return LocaleKeys.screen_add_product_fields_error_general_error.trParams(
                                      {
                                        "field": LocaleKeys.screen_add_product_package_weight.tr,
                                      },
                                    );
                                  } else if (checkWeight) {
                                    return LocaleKeys.screen_add_product_fields_error_numerical_between_x_and_x
                                        .trParams(
                                      {
                                        "min": "1",
                                        "max": "1000",
                                      },
                                    );
                                  }
                                  return null;
                                },
                                controller: controller.productWeightController,
                                focusNode: GetPlatform.isMobile ? controller.productWeightNode : null,
                                textAlignVertical: TextAlignVertical.center,
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  LimitNumberInputFormatter(minNumber: 1, maxNumber: 1000)
                                ],
                                decoration: InputDecoration(
                                  labelText: LocaleKeys.screen_add_product_package_weight.tr,
                                  hintText: "0",
                                  alignLabelWithHint: true,
                                  border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                onChanged: (value) {
                                  controller.justUpdate();
                                },
                              ),
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.fromLTRB(16.0, 0.0, 15.0, 0.0),
                                height: 52.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<int>(
                                    items: [
                                      DropdownMenuItem<int>(
                                        value: 0,
                                        child: Text(
                                          "گرم",
                                        ),
                                      ),
                                      DropdownMenuItem<int>(
                                        value: 1,
                                        child: Text(
                                          "کیلوگرم",
                                        ),
                                      ),
                                    ],
                                    onChanged: (int? value) {
                                      controller.updateWeightType(weightType: value!);
                                    },
                                    hint: Text(
                                      LocaleKeys.screen_add_product_fields_name_type_of_weight.tr,
                                    ),
                                    value: controller.weightType.value,
                                    onTap: () {
                                      controller.unFocus();
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      const SizedBox(
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
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      child: const Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 8.0,
                                    ),
                                    Container(
                                      child: Text(
                                        LocaleKeys.screen_add_product_buttons_register_product.tr,
                                        style: const TextStyle(color: Colors.white),
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

  Widget setTitleWidget({required String title}) {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.blueAccent,
            ),
            width: 20.0,
            height: 20.0,
          ),
          SizedBox(
            width: 8.0,
          ),
          Container(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
