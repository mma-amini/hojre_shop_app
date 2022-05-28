import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/message_type.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/spec_type.dart';
import 'package:hojre_shop_app/domain/core/dto/models/group_spec_model.dart';
import 'package:hojre_shop_app/domain/core/helpers/show_message.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';
import 'package:hojre_shop_app/presentation/widgets/awesom_dialog/awesome_dialog.dart';
import 'package:hojre_shop_app/presentation/widgets/custom_input_format.dart';
import 'package:hojre_shop_app/presentation/widgets/expandable.dart';

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
                          currentStep: controller.currentStep.value,
                          onStepTapped: (step) {
                            controller.updateCurrentStep(step: step);
                          },
                          onStepCancel: () {
                            Get.back();
                          },
                          onStepContinue: () {
                            if (controller.currentStep.value < 2) {
                              controller.currentStep.value++;
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
                                LocaleKeys.screen_add_product_choose_product_pictures.tr,
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        setTitleWidget(title: LocaleKeys.screen_add_product_pics.tr),
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
                                  SizedBox(
                                    height: 16.0,
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
                                                                        LocaleKeys
                                                                            .screen_add_product_are_you_sure_you_want_to_delete_this_image
                                                                            .tr,
                                                                        style: TextStyle(fontSize: 14.0),
                                                                        textAlign: TextAlign.center,
                                                                      )),
                                                                    ),
                                                                    btnOkText: LocaleKeys.buttons_yes.tr,
                                                                    btnOkOnPress: () {
                                                                      // controller.removeMainImage();
                                                                    },
                                                                    btnCancelText: LocaleKeys.buttons_no.tr,
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
                                                              LocaleKeys.screen_add_product_choose_main_picture.tr,
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
                                                                          LocaleKeys
                                                                              .screen_add_product_are_you_sure_you_want_to_delete_this_image
                                                                              .tr,
                                                                          style: TextStyle(fontSize: 14.0),
                                                                          textAlign: TextAlign.center,
                                                                        )),
                                                                      ),
                                                                      btnOkText: LocaleKeys.buttons_yes.tr,
                                                                      btnOkOnPress: () {
                                                                        // controller.removeImageFromImagesList(
                                                                        //     image: image);
                                                                      },
                                                                      btnCancelText: LocaleKeys.buttons_no.tr,
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
                                LocaleKeys.screen_add_product_registration_basic_specifications.tr,
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              content: Column(
                                children: [
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
                                  Container(
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
                                  Container(
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
                                  Container(
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
                                    padding: EdgeInsets.fromLTRB(16.0, 0.0, 15.0, 0.0),
                                    width: Get.width,
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
                                          controller.updatePackWeightType(packWeightType: value!);
                                        },
                                        hint: Text(
                                          LocaleKeys.screen_add_product_fields_name_type_of_weight.tr,
                                        ),
                                        value: controller.packWeightType.value,
                                        onTap: () {
                                          controller.unFocus();
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 16.0,
                                  ),
                                  TextFormField(
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
                                    focusNode: GetPlatform.isMobile ? controller.productPackWeightNode : null,
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
                                ],
                              ),
                            ),
                            Step(
                              title: Text(
                                LocaleKeys.screen_add_product_registration_other_specification.tr,
                                style: TextStyle(
                                  fontSize: 14.0,
                                ),
                              ),
                              content: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: controller.groupSpecsList.length,
                                itemBuilder: (context, index) {
                                  var item = controller.groupSpecsList[index];
                                  return Container(
                                    child: Column(
                                      children: [
                                        ExpandablePanel(
                                          header: Container(
                                            padding: EdgeInsets.only(top: 8.0),
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.center,
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
                                                    item.Name!,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          expanded: Column(
                                            children: [
                                              SizedBox(
                                                height: 8,
                                              ),
                                              TextField(
                                                controller: item.searchTextController,
                                                decoration: InputDecoration(
                                                    labelText: LocaleKeys.general_search.tr,
                                                    alignLabelWithHint: true,
                                                    border: new OutlineInputBorder(
                                                      borderSide: new BorderSide(color: Colors.green),
                                                      borderRadius: BorderRadius.circular(100.0),
                                                    ),
                                                    contentPadding: EdgeInsets.all(8.0),
                                                    prefixIcon: IconButton(
                                                      onPressed: () {
                                                        if (item.searchTextController!.text.isNotEmpty) {
                                                          item.searchResult!.clear();
                                                          for (var spcItem in item.Items!) {
                                                            if (spcItem.Name!
                                                                .contains(item.searchTextController!.text)) {
                                                              item.searchResult!.add(spcItem);
                                                            }
                                                          }
                                                          controller.justUpdate();
                                                        }
                                                      },
                                                      icon: Icon(Icons.search),
                                                    ),
                                                    suffixIcon: item.searchTextController!.text.isNotEmpty
                                                        ? IconButton(
                                                            onPressed: () {
                                                              item.searchTextController!.text = "";
                                                              item.searchResult!.clear();
                                                              controller.justUpdate();
                                                            },
                                                            icon: Icon(Icons.close),
                                                          )
                                                        : null),
                                                onEditingComplete: () {
                                                  item.searchResult!.clear();
                                                  for (var spcItem in item.Items!) {
                                                    if (spcItem.Name!.contains(item.searchTextController!.text)) {
                                                      item.searchResult!.add(spcItem);
                                                    }
                                                  }
                                                  controller.justUpdate();
                                                },
                                                onChanged: (value) {
                                                  if (!kIsWeb) {
                                                    item.searchResult!.clear();
                                                    for (var spcItem in item.Items!) {
                                                      if (spcItem.Name!.contains(item.searchTextController!.text)) {
                                                        item.searchResult!.add(spcItem);
                                                      }
                                                    }
                                                    controller.justUpdate();
                                                  }
                                                },
                                              ),
                                              Divider(),
                                              Container(
                                                padding: EdgeInsets.only(top: 8.0),
                                                child: ListView.builder(
                                                  shrinkWrap: true,
                                                  physics: NeverScrollableScrollPhysics(),
                                                  itemCount: item.searchResult!.isNotEmpty
                                                      ? item.searchResult!.length
                                                      : item.Items!.length,
                                                  itemBuilder: (context, ind) {
                                                    var spcItem = item.searchResult!.isNotEmpty
                                                        ? item.searchResult![ind]
                                                        : item.Items![ind];

                                                    // Conditions
                                                    var checkSpcItemSelectedItem = spcItem.SelectedItem != null &&
                                                        spcItem.SelectedItem!.Value != null;

                                                    switch (spcItem.type) {
                                                      case SpecificationType.COLOR:
                                                        return Container();
                                                      case SpecificationType.SELECTABLE:
                                                        return Container(
                                                          child: Column(
                                                            children: [
                                                              TextField(
                                                                focusNode: spcItem.textNode,
                                                                controller: spcItem.textController,
                                                                readOnly: true,
                                                                decoration: InputDecoration(
                                                                  labelText: spcItem.Name,
                                                                  alignLabelWithHint: true,
                                                                  border: new OutlineInputBorder(
                                                                    borderSide: new BorderSide(color: Colors.grey),
                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                  ),
                                                                ),
                                                                onTap: () {
                                                                  List<VMSpecValue> tempData =
                                                                      List<VMSpecValue>.empty(growable: true);

                                                                  tempData.addAll(spcItem.Values!);

                                                                  Get.defaultDialog(
                                                                      title: spcItem.Name!,
                                                                      content: WillPopScope(
                                                                        onWillPop: () {
                                                                          spcItem.searchTextController.text = "";
                                                                          spcItem.searchTextNode.unfocus();
                                                                          Get.back();
                                                                          return Future.delayed(Duration(seconds: 0))
                                                                              .then((value) {
                                                                            return true;
                                                                          });
                                                                        },
                                                                        child: GetBuilder(
                                                                          init: this.controller,
                                                                          builder: (dynamic _) {
                                                                            return Container(
                                                                              child: Column(
                                                                                children: [
                                                                                  Row(
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          height: 40.0,
                                                                                          child: TextField(
                                                                                            focusNode:
                                                                                                spcItem.searchTextNode,
                                                                                            controller: spcItem
                                                                                                .searchTextController,
                                                                                            decoration: InputDecoration(
                                                                                              labelText: LocaleKeys
                                                                                                  .general_search.tr,
                                                                                              alignLabelWithHint: true,
                                                                                              border:
                                                                                                  new OutlineInputBorder(
                                                                                                borderSide:
                                                                                                    new BorderSide(
                                                                                                        color: Colors
                                                                                                            .grey),
                                                                                                borderRadius:
                                                                                                    BorderRadius
                                                                                                        .circular(8.0),
                                                                                              ),
                                                                                              contentPadding:
                                                                                                  EdgeInsets.all(8.0),
                                                                                            ),
                                                                                            onChanged: (value) {
                                                                                              tempData.clear();
                                                                                              if (value.isNotEmpty) {
                                                                                                spcItem.Values!
                                                                                                    .forEach((element) {
                                                                                                  if (element.Title!
                                                                                                      .contains(
                                                                                                          value)) {
                                                                                                    tempData
                                                                                                        .add(element);
                                                                                                  }
                                                                                                });
                                                                                              } else {
                                                                                                tempData.addAll(
                                                                                                    spcItem.Values!);
                                                                                              }
                                                                                              controller.justUpdate();
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Visibility(
                                                                                        visible: tempData.length == 0,
                                                                                        child: Container(
                                                                                          child: IconButton(
                                                                                            icon: Icon(Icons.add),
                                                                                            onPressed: () {
                                                                                              VMSpecValue spcData = VMSpecValue(
                                                                                                  Title: spcItem
                                                                                                      .searchTextController
                                                                                                      .text,
                                                                                                  SpecValueId: null,
                                                                                                  Value: spcItem
                                                                                                      .searchTextController
                                                                                                      .text);
                                                                                              spcItem
                                                                                                  .searchTextController
                                                                                                  .text = "";
                                                                                              spcItem.searchTextNode
                                                                                                  .unfocus();
                                                                                              spcItem.textController
                                                                                                      .text =
                                                                                                  spcData.Value!;
                                                                                              spcItem.SelectedItem =
                                                                                                  spcData;
                                                                                              Get.back();
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                  Divider(),
                                                                                  Container(
                                                                                    width: Get.width,
                                                                                    height: 200.0,
                                                                                    child: ListView.builder(
                                                                                      itemCount: tempData.length,
                                                                                      itemBuilder: (context, index) {
                                                                                        var item = tempData[index];
                                                                                        return Column(
                                                                                          children: [
                                                                                            InkWell(
                                                                                              borderRadius:
                                                                                                  BorderRadius.circular(
                                                                                                      8.0),
                                                                                              onTap: () {
                                                                                                spcItem
                                                                                                    .searchTextController
                                                                                                    .text = "";
                                                                                                spcItem.searchTextNode
                                                                                                    .unfocus();
                                                                                                spcItem.textController
                                                                                                    .text = item.Value!;
                                                                                                spcItem.SelectedItem =
                                                                                                    item;
                                                                                                Get.back();
                                                                                              },
                                                                                              child: Container(
                                                                                                padding:
                                                                                                    EdgeInsets.all(8.0),
                                                                                                child: Center(
                                                                                                  child:
                                                                                                      Text(item.Title!),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Divider(),
                                                                                          ],
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      actions: [
                                                                        Container(
                                                                          child: InkWell(
                                                                            onTap: () {
                                                                              spcItem.searchTextController.text = "";
                                                                              spcItem.searchTextNode.unfocus();
                                                                              Get.back();
                                                                            },
                                                                            child: Container(
                                                                              padding: EdgeInsets.all(8.0),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  LocaleKeys.buttons_close.tr,
                                                                                  style: TextStyle(fontSize: 13.0),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ]);
                                                                },
                                                              ),
                                                              Divider(),
                                                            ],
                                                          ),
                                                        );
                                                      case SpecificationType.TEXT_INPUT:
                                                        return Container(
                                                          child: Column(
                                                            children: [
                                                              TextField(
                                                                focusNode: spcItem.textNode,
                                                                controller: spcItem.textController,
                                                                decoration: InputDecoration(
                                                                  labelText: spcItem.Name,
                                                                  alignLabelWithHint: true,
                                                                  border: new OutlineInputBorder(
                                                                    borderSide: new BorderSide(color: Colors.grey),
                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                  ),
                                                                ),
                                                                onChanged: (value) {
                                                                  spcItem.TypedText = spcItem.textController.text;
                                                                },
                                                              ),
                                                              Divider(),
                                                            ],
                                                          ),
                                                        );
                                                      case SpecificationType.BOOL:
                                                        return Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text(spcItem.Name!),
                                                            SizedBox(
                                                              height: 8.0,
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(8.0),
                                                                border: Border.all(
                                                                  color: Colors.grey,
                                                                  width: 1.0,
                                                                ),
                                                              ),
                                                              child: DropdownButtonHideUnderline(
                                                                child: DropdownButton<String>(
                                                                  isExpanded: true,
                                                                  items: List.generate(
                                                                    spcItem.Values!.length,
                                                                    (indexItem) => DropdownMenuItem<String>(
                                                                      value: spcItem.Values![indexItem].Value,
                                                                      child: Text(
                                                                        "${spcItem.Values![indexItem].Title}",
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  onChanged: (String? value) async {
                                                                    for (var item in spcItem.Values!) {
                                                                      // Conditions
                                                                      var checkItem = item.Value!.toLowerCase() ==
                                                                          value!.toLowerCase();

                                                                      if (checkItem) {
                                                                        spcItem.SelectedItem = item;
                                                                      }
                                                                    }
                                                                    controller.justUpdate();
                                                                  },
                                                                  hint: Text(
                                                                    LocaleKeys.screen_add_product_specs_select.tr,
                                                                  ),
                                                                  onTap: () {
                                                                    controller.unFocus();
                                                                  },
                                                                  value: checkSpcItemSelectedItem
                                                                      ? spcItem.SelectedItem!.Value
                                                                      : null,
                                                                ),
                                                              ),
                                                            ),
                                                            Divider(),
                                                          ],
                                                        );
                                                      case SpecificationType.NUMBER_INPUT:
                                                        return Container(
                                                          child: Column(
                                                            children: [
                                                              TextField(
                                                                focusNode: spcItem.textNode,
                                                                controller: spcItem.textController,
                                                                textAlign: TextAlign.left,
                                                                keyboardType:
                                                                    TextInputType.numberWithOptions(decimal: true),
                                                                inputFormatters: <TextInputFormatter>[
                                                                  FilteringTextInputFormatter.allow(
                                                                      RegExp(r'^\d+\.?\d{0,1}')),
                                                                ],
                                                                decoration: InputDecoration(
                                                                  labelText: spcItem.Name,
                                                                  hintText: "0",
                                                                  alignLabelWithHint: true,
                                                                  border: new OutlineInputBorder(
                                                                    borderSide: new BorderSide(color: Colors.grey),
                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                  ),
                                                                ),
                                                                onChanged: (value) {
                                                                  spcItem.TypedText = spcItem.textController.text;
                                                                },
                                                              ),
                                                              Divider(),
                                                            ],
                                                          ),
                                                        );
                                                      case SpecificationType.MULTI_SELECT:
                                                        return Container(
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              // Container(
                                                              //   child: MultiSelect(
                                                              //     autovalidate: spcItem.IsRequired!,
                                                              //     addedData: true,
                                                              //     addedDataFunction: (value) {
                                                              //       VMSpecificationData spcData = VMSpecificationData(
                                                              //           SpecificationTypeItemId: value["value"],
                                                              //           Name: value["text"],
                                                              //           Value: value["value"],
                                                              //           isNew: true);
                                                              //       spcItem.Items!.add(spcData);
                                                              //       if (spcItem.SelectedItems == null) {
                                                              //         spcItem.SelectedItems =
                                                              //             List<VMSpecificationData>.empty(
                                                              //                 growable: true);
                                                              //       }
                                                              //
                                                              //       spcItem.SelectedItems!.add(spcData);
                                                              //       controller.justSetState();
                                                              //     },
                                                              //     titleText: spcItem.SpecificationName,
                                                              //     validator: (value) {
                                                              //       if (value == null) {
                                                              //         return 'یک یا چند مورد را انتخاب نمائید.';
                                                              //       }
                                                              //       return null;
                                                              //     },
                                                              //     dataSource: List.generate(
                                                              //         spcItem.Items!.length,
                                                              //         (muIndex) => {
                                                              //               "Name": spcItem.Items![muIndex].Name,
                                                              //               "Value": spcItem.Items![muIndex].Value,
                                                              //               "SpecificationTypeItemId": spcItem
                                                              //                   .Items![muIndex].SpecificationTypeItemId
                                                              //             }).toList(),
                                                              //     textField: "Name",
                                                              //     valueField: "SpecificationTypeItemId",
                                                              //     filterable: true,
                                                              //     required: spcItem.IsRequired,
                                                              //     initialValue: spcItem.SelectedItems != null
                                                              //         ? List.generate(
                                                              //             spcItem.SelectedItems!.length,
                                                              //             (muIndex) => spcItem.SelectedItems![muIndex]
                                                              //                 .SpecificationTypeItemId).toList()
                                                              //         : null,
                                                              //     saveButtonText: "تائید",
                                                              //     cancelButtonText: "لغو",
                                                              //     hintText: "یک یا چند مورد را انتخاب نمائید...",
                                                              //     cancelButtonColor: Colors.red,
                                                              //     onSaved: (value) {},
                                                              //     open: () {
                                                              //       controller.unFocus();
                                                              //     },
                                                              //     change: (value) {
                                                              //       List<String?> tempList =
                                                              //           List<String?>.empty(growable: true);
                                                              //       if (value != null) {
                                                              //         for (var i in value) {
                                                              //           tempList.add(i);
                                                              //         }
                                                              //       }
                                                              //
                                                              //       spcItem.SelectedItems =
                                                              //           List<VMSpecificationData>.empty(growable: true);
                                                              //
                                                              //       for (String? val in tempList) {
                                                              //         for (var item in spcItem.Items!) {
                                                              //           // Conditions
                                                              //           var checkSpecificationTypeItemId = val!
                                                              //                   .toLowerCase() ==
                                                              //               item.SpecificationTypeItemId!.toLowerCase();
                                                              //           if (checkSpecificationTypeItemId) {
                                                              //             spcItem.SelectedItems!.add(item);
                                                              //           }
                                                              //         }
                                                              //       }
                                                              //       controller.justUpdate();
                                                              //     },
                                                              //   ),
                                                              // ),
                                                              Divider(),
                                                            ],
                                                          ),
                                                        );
                                                      case SpecificationType.WEIGHT:
                                                        return Container(
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(LocaleKeys
                                                                  .screen_add_product_specs_product_weight.tr),
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
                                                              Row(
                                                                children: [
                                                                  Expanded(
                                                                    child: Container(
                                                                      padding:
                                                                          EdgeInsets.fromLTRB(16.0, 0.0, 15.0, 0.0),
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
                                                                            controller.updateProductWeightType(
                                                                                productWeightType: value!);
                                                                            var weight = 0;
                                                                            if (spcItem
                                                                                .textController.text.isNotEmpty) {
                                                                              weight = int.parse(
                                                                                  spcItem.textController.text);
                                                                              if (value == 0 && weight > 1000) {
                                                                                weight = (weight / 1000).round();
                                                                              }

                                                                              if (value == 1 && weight < 1000) {
                                                                                weight = (weight * 1000);
                                                                              }

                                                                              spcItem.textController.text =
                                                                                  weight.toString();
                                                                              controller.productWeightText.value =
                                                                                  spcItem.textController.text;
                                                                            }
                                                                          },
                                                                          hint: Text(
                                                                            LocaleKeys
                                                                                .screen_add_product_fields_name_type_of_weight,
                                                                          ),
                                                                          value: controller.productWeightType.value,
                                                                          onTap: () {
                                                                            controller.unFocus();
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 8.0,
                                                                  ),
                                                                  Expanded(
                                                                    child: TextFormField(
                                                                      controller: spcItem.textController,
                                                                      focusNode: GetPlatform.isMobile
                                                                          ? spcItem.textNode
                                                                          : null,
                                                                      textAlignVertical: TextAlignVertical.center,
                                                                      textAlign: TextAlign.left,
                                                                      keyboardType: TextInputType.number,
                                                                      inputFormatters: <TextInputFormatter>[
                                                                        FilteringTextInputFormatter.digitsOnly,
                                                                        LimitNumberInputFormatter(
                                                                            minNumber: 1, maxNumber: 1000)
                                                                      ],
                                                                      readOnly:
                                                                          controller.productWeightType.value == null
                                                                              ? true
                                                                              : false,
                                                                      decoration: InputDecoration(
                                                                        labelText: LocaleKeys
                                                                            .screen_add_product_specs_product_weight.tr,
                                                                        hintText: "0",
                                                                        alignLabelWithHint: true,
                                                                        border: new OutlineInputBorder(
                                                                          borderSide:
                                                                              new BorderSide(color: Colors.grey),
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      onTap: () {
                                                                        if (controller.productWeightType.value ==
                                                                            null) {
                                                                          ShowMessage.getSnackBar(
                                                                            message: LocaleKeys
                                                                                .screen_add_product_fields_error_first_determine_the_type_of_weight
                                                                                .tr,
                                                                            type: MessageType.WARNING,
                                                                          );
                                                                        }
                                                                      },
                                                                      onChanged: (value) {
                                                                        controller.justUpdate();
                                                                        if (spcItem.textController.text.isNotEmpty) {
                                                                          var weight =
                                                                              int.parse(spcItem.textController.text);
                                                                          weight = controller.productWeightType == 0
                                                                              ? weight
                                                                              : weight * 1000;
                                                                          spcItem.TypedText = weight.toString();
                                                                        } else {
                                                                          spcItem.TypedText = "";
                                                                        }

                                                                        controller.productWeightText.value =
                                                                            spcItem.TypedText ?? "";
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(),
                                                            ],
                                                          ),
                                                        );
                                                      case SpecificationType.DIMENSION:
                                                        return Container(
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              Text(LocaleKeys
                                                                  .screen_add_product_specs_product_dimension.tr),
                                                              Container(
                                                                padding: EdgeInsets.all(8.0),
                                                                child: Text(
                                                                  LocaleKeys
                                                                      .screen_add_product_enter_number_between_x_and_x_cm
                                                                      .trParams(
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
                                                                    child: TextField(
                                                                      focusNode: controller.productLengthNode,
                                                                      controller: controller.productLengthController,
                                                                      textAlign: TextAlign.left,
                                                                      keyboardType: TextInputType.number,
                                                                      inputFormatters: <TextInputFormatter>[
                                                                        FilteringTextInputFormatter.digitsOnly,
                                                                        LimitNumberInputFormatter(
                                                                            minNumber: 1, maxNumber: 1000)
                                                                      ],
                                                                      decoration: InputDecoration(
                                                                        labelText: LocaleKeys
                                                                            .screen_add_product_fields_name_length_cm
                                                                            .tr,
                                                                        hintText: "0",
                                                                        alignLabelWithHint: true,
                                                                        border: new OutlineInputBorder(
                                                                          borderSide:
                                                                              new BorderSide(color: Colors.grey),
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      onChanged: (value) {
                                                                        var length = controller
                                                                                .productLengthController.text.isNotEmpty
                                                                            ? controller.productLengthController.text
                                                                            : "";
                                                                        var width = controller
                                                                                .productWidthController.text.isNotEmpty
                                                                            ? controller.productWidthController.text
                                                                            : "";
                                                                        var height = controller
                                                                                .productHeightController.text.isNotEmpty
                                                                            ? controller.productHeightController.text
                                                                            : "";

                                                                        var lengthString =
                                                                            length.isNotEmpty ? length : "";
                                                                        var widthString = width.isNotEmpty
                                                                            ? length.isNotEmpty
                                                                                ? "x$width"
                                                                                : "$width"
                                                                            : "";
                                                                        var heightString = height.isNotEmpty
                                                                            ? length.isNotEmpty || width.isNotEmpty
                                                                                ? "x$height"
                                                                                : "$height"
                                                                            : "";

                                                                        spcItem.TypedText =
                                                                            "$lengthString$widthString$heightString";
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 8.0,
                                                                  ),
                                                                  Expanded(
                                                                    child: TextField(
                                                                      focusNode: controller.productWidthNode,
                                                                      controller: controller.productWidthController,
                                                                      textAlign: TextAlign.left,
                                                                      keyboardType: TextInputType.number,
                                                                      inputFormatters: <TextInputFormatter>[
                                                                        FilteringTextInputFormatter.digitsOnly,
                                                                        LimitNumberInputFormatter(
                                                                            minNumber: 1, maxNumber: 1000)
                                                                      ],
                                                                      decoration: InputDecoration(
                                                                        labelText: LocaleKeys
                                                                            .screen_add_product_fields_name_width_cm.tr,
                                                                        hintText: "0",
                                                                        alignLabelWithHint: true,
                                                                        border: new OutlineInputBorder(
                                                                          borderSide:
                                                                              new BorderSide(color: Colors.grey),
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      onChanged: (value) {
                                                                        var length = controller
                                                                                .productLengthController.text.isNotEmpty
                                                                            ? controller.productLengthController.text
                                                                            : "";
                                                                        var width = controller
                                                                                .productWidthController.text.isNotEmpty
                                                                            ? controller.productWidthController.text
                                                                            : "";
                                                                        var height = controller
                                                                                .productHeightController.text.isNotEmpty
                                                                            ? controller.productHeightController.text
                                                                            : "";

                                                                        var lengthString =
                                                                            length.isNotEmpty ? length : "";
                                                                        var widthString = width.isNotEmpty
                                                                            ? length.isNotEmpty
                                                                                ? "x$width"
                                                                                : "$width"
                                                                            : "";
                                                                        var heightString = height.isNotEmpty
                                                                            ? length.isNotEmpty || width.isNotEmpty
                                                                                ? "x$height"
                                                                                : "$height"
                                                                            : "";

                                                                        spcItem.TypedText =
                                                                            "$lengthString$widthString$heightString";
                                                                      },
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 8.0,
                                                                  ),
                                                                  Expanded(
                                                                    child: TextField(
                                                                      focusNode: controller.productHeightNode,
                                                                      controller: controller.productHeightController,
                                                                      textAlign: TextAlign.left,
                                                                      keyboardType: TextInputType.number,
                                                                      inputFormatters: <TextInputFormatter>[
                                                                        FilteringTextInputFormatter.digitsOnly,
                                                                        LimitNumberInputFormatter(
                                                                            minNumber: 1, maxNumber: 1000)
                                                                      ],
                                                                      decoration: InputDecoration(
                                                                        labelText: LocaleKeys
                                                                            .screen_add_product_fields_name_height_cm
                                                                            .tr,
                                                                        hintText: "0",
                                                                        alignLabelWithHint: true,
                                                                        border: new OutlineInputBorder(
                                                                          borderSide:
                                                                              new BorderSide(color: Colors.grey),
                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                      onChanged: (value) {
                                                                        var length = controller
                                                                                .productLengthController.text.isNotEmpty
                                                                            ? controller.productLengthController.text
                                                                            : "";
                                                                        var width = controller
                                                                                .productWidthController.text.isNotEmpty
                                                                            ? controller.productWidthController.text
                                                                            : "";
                                                                        var height = controller
                                                                                .productHeightController.text.isNotEmpty
                                                                            ? controller.productHeightController.text
                                                                            : "";

                                                                        var lengthString =
                                                                            length.isNotEmpty ? length : "";
                                                                        var widthString = width.isNotEmpty
                                                                            ? length.isNotEmpty
                                                                                ? "x$width"
                                                                                : "$width"
                                                                            : "";
                                                                        var heightString = height.isNotEmpty
                                                                            ? length.isNotEmpty || width.isNotEmpty
                                                                                ? "x$height"
                                                                                : "$height"
                                                                            : "";

                                                                        spcItem.TypedText =
                                                                            "$lengthString$widthString$heightString";
                                                                      },
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Divider(),
                                                            ],
                                                          ),
                                                        );
                                                      case SpecificationType.FILE_DOC:
                                                        return Container();
                                                      case SpecificationType.FILE_PIC:
                                                        return Container();
                                                      default:
                                                        return Container();
                                                    }
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(
                                          color: Colors.blue,
                                          thickness: 2.0,
                                        )
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
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
