import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
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
        var checkImage = controller.image != null;
        var checkImageList = controller.imagesList.isEmpty;

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
                      Container(
                        child: Stepper(
                          type: StepperType.vertical,
                          physics: ScrollPhysics(),
                          currentStep: controller.currentStpe.value,
                          onStepTapped: (step) {
                            controller.updateCurrentStep(step: step);
                          },
                          onStepCancel: () {
                            Get.back();
                          },
                          onStepContinue: () {
                            if (controller.currentStpe.value < 2) {
                              controller.currentStpe.value++;
                            }
                          },
                          // controlsBuilder: (context, controlDetail) {
                          //   return Column(
                          //     children: [
                          //       SizedBox(
                          //         height: 16.0,
                          //       ),
                          //       Row(
                          //         children: [
                          //           InkWell(
                          //             borderRadius: BorderRadius.circular(8.0),
                          //             onTap: () {},
                          //             child: Container(
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.circular(8.0),
                          //                 color: Colors.green,
                          //               ),
                          //               width: 75.0,
                          //               padding: EdgeInsets.all(8.0),
                          //               child: Center(child: Text("ادامه")),
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             width: 24.0,
                          //           ),
                          //           InkWell(
                          //             borderRadius: BorderRadius.circular(8.0),
                          //             onTap: () {},
                          //             child: Container(
                          //               decoration: BoxDecoration(
                          //                 borderRadius: BorderRadius.circular(8.0),
                          //                 color: Colors.red,
                          //               ),
                          //               width: 75.0,
                          //               padding: EdgeInsets.all(8.0),
                          //               child: Center(child: Text("لغو")),
                          //             ),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   );
                          // },
                          steps: [
                            Step(
                              title: Text(
                                "انتخاب تصاویر کالا",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              content: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        setTitleWidget(title: "تصاویر"),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        Container(
                                          child: InkWell(
                                            borderRadius: BorderRadius.circular(50.0),
                                            child: Icon(
                                              Icons.info_outline_rounded,
                                              color: Colors.blue,
                                              size: 25.0,
                                            ),
                                            onTap: () {
                                              controller.launchCameraHelpURL();
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 170,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          InkWell(
                                            borderRadius: BorderRadius.circular(8.0),
                                            onTap: () {
                                              if (checkImage) {
                                                // controller.goToPhotoPreview(isMainImage: true);
                                              } else {
                                                // controller.openCameraDialog(mainImage: true);
                                              }
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(8.0),
                                              child: Container(
                                                height: 170,
                                                width: 170,
                                                decoration: BoxDecoration(
                                                  border: Border.all(color: Colors.grey, width: 1.0),
                                                  borderRadius: BorderRadius.circular(8.0),
                                                ),
                                                child: checkImage
                                                    ? Stack(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius: BorderRadius.circular(8.0),
                                                            child: kIsWeb
                                                                ? Image.network(controller.image!.file!.path)
                                                                : Image.file(controller.image!.file!),
                                                          ),
                                                          Positioned(
                                                            bottom: 5.0,
                                                            left: 5.0,
                                                            child: InkWell(
                                                              onTap: () {
                                                                AwesomeDialog(
                                                                    context: Get.context!,
                                                                    animType: AnimType.SCALE,
                                                                    dialogType: DialogType.WARNING,
                                                                    body: Padding(
                                                                      padding: const EdgeInsets.all(3.0),
                                                                      child: Center(
                                                                          child: Text(
                                                                        "از حذف این تصویر مطمئن هستید؟",
                                                                        style: TextStyle(fontSize: 14.0),
                                                                        textAlign: TextAlign.center,
                                                                      )),
                                                                    ),
                                                                    btnOkText: "بلی",
                                                                    btnOkOnPress: () {
                                                                      // controller.removeMainImage();
                                                                    },
                                                                    btnCancelText: "خیر",
                                                                    btnCancelOnPress: () {})
                                                                  ..show();
                                                              },
                                                              child: Icon(
                                                                Icons.remove_circle,
                                                                color: Colors.red,
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                    : Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                            child: Icon(
                                                              Icons.image,
                                                              size: 50.0,
                                                              color: Colors.grey,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 8.0,
                                                          ),
                                                          Container(
                                                            child: Text(
                                                              "انتخاب تصویر اصلی",
                                                              style: TextStyle(fontSize: 12.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Container(
                                            child: Wrap(
                                              crossAxisAlignment: WrapCrossAlignment.start,
                                              alignment: WrapAlignment.start,
                                              direction: Axis.vertical,
                                              runSpacing: 4.0,
                                              spacing: 4.0,
                                              children: [
                                                for (var image in controller.imagesList)
                                                  InkWell(
                                                    onTap: () {
                                                      // controller.goToPhotoPreview(
                                                      //     isMainImage: false, file: image.file);
                                                    },
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(8.0),
                                                      child: Container(
                                                        height: 83,
                                                        width: 83,
                                                        child: Stack(
                                                          children: [
                                                            kIsWeb
                                                                ? Image.network(image.file!.path)
                                                                : Image.file(image.file!),
                                                            Positioned(
                                                              bottom: 2.0,
                                                              left: 2.0,
                                                              child: InkWell(
                                                                onTap: () {
                                                                  AwesomeDialog(
                                                                      context: Get.context!,
                                                                      animType: AnimType.SCALE,
                                                                      dialogType: DialogType.WARNING,
                                                                      body: Padding(
                                                                        padding: const EdgeInsets.all(3.0),
                                                                        child: Center(
                                                                            child: Text(
                                                                          "از حذف این تصویر مطمئن هستید؟",
                                                                          style: TextStyle(fontSize: 14.0),
                                                                          textAlign: TextAlign.center,
                                                                        )),
                                                                      ),
                                                                      btnOkText: "بلی",
                                                                      btnOkOnPress: () {
                                                                        // controller.removeImageFromImagesList(
                                                                        //     image: image);
                                                                      },
                                                                      btnCancelText: "خیر",
                                                                      btnCancelOnPress: () {})
                                                                    ..show();
                                                                },
                                                                child: Icon(
                                                                  Icons.remove_circle,
                                                                  color: Colors.red,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                InkWell(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  onTap: () {
                                                    // controller.openCameraDialog(mainImage: false);
                                                  },
                                                  child: DottedBorder(
                                                    color: Colors.grey,
                                                    strokeWidth: 1,
                                                    dashPattern: [5, 2],
                                                    radius: Radius.circular(8.0),
                                                    padding: EdgeInsets.all(0.0),
                                                    borderType: BorderType.RRect,
                                                    child: Container(
                                                      width: 83,
                                                      height: 83,
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.add,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                checkImageList
                                                    ? Container(
                                                        width: 83,
                                                        height: 83,
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Step(
                              title: Text(
                                "ثبت مشخصات پایه",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              content: Column(
                                children: [
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
                                                return LocaleKeys.screen_add_product_fields_error_general_error
                                                    .trParams(
                                                  {
                                                    "field": LocaleKeys.screen_add_product_fields_name_length.tr,
                                                  },
                                                );
                                              } else if (checkWeight) {
                                                return LocaleKeys
                                                    .screen_add_product_fields_error_numerical_between_x_and_x
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
                                                return LocaleKeys.screen_add_product_fields_error_general_error
                                                    .trParams(
                                                  {
                                                    "field": LocaleKeys.screen_add_product_fields_name_width.tr,
                                                  },
                                                );
                                              } else if (checkWeight) {
                                                return LocaleKeys
                                                    .screen_add_product_fields_error_numerical_between_x_and_x
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
                                              labelText: LocaleKeys.screen_add_product_fields_name_width_cm.tr,
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
                                                return LocaleKeys.screen_add_product_fields_error_general_error
                                                    .trParams(
                                                  {
                                                    "field": LocaleKeys.screen_add_product_fields_name_height.tr,
                                                  },
                                                );
                                              } else if (checkWeight) {
                                                return LocaleKeys
                                                    .screen_add_product_fields_error_numerical_between_x_and_x
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
                                      )} ${LocaleKeys.screen_add_product_also_select_the_type_of_weight.tr}",
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
                                                return LocaleKeys.screen_add_product_fields_error_general_error
                                                    .trParams(
                                                  {
                                                    "field": LocaleKeys.screen_add_product_package_weight.tr,
                                                  },
                                                );
                                              } else if (checkWeight) {
                                                return LocaleKeys
                                                    .screen_add_product_fields_error_numerical_between_x_and_x
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
                                ],
                              ),
                            ),
                            Step(
                              title: Text(
                                "ثبت سایر مشخصات",
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              content: Container(
                                height: 30,
                                width: 30,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(8.0),
                        onTap: () {
                          controller.goToAddProductSpecificationsPage();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.blueAccent, width: 2.0),
                          ),
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              LocaleKeys.screen_add_product_buttons_add_product_specification.tr,
                            ),
                          ),
                        ),
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
