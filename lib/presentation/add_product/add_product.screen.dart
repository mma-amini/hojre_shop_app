import 'package:dotted_border/dotted_border.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/message_type.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/option_type.dart';
import 'package:hojre_shop_app/domain/core/dto/models/brand_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/group_option_model.dart';
import 'package:hojre_shop_app/domain/core/helpers/show_message.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';
import 'package:hojre_shop_app/presentation/widgets/custom_input_format.dart';
import 'package:hojre_shop_app/presentation/widgets/expandable.dart';
import 'package:hojre_shop_app/presentation/widgets/main_app_bar/main_app_bar.dart';
import 'package:hojre_shop_app/presentation/widgets/multi_select_drop_down/flutter_multiselect.dart';

import 'controllers/add_product.controller.dart';

class AddProductScreen extends GetView<AddProductController> {
  const AddProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
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
                      Row(
                        children: [
                          _setTitleWidget(title: "${LocaleKeys.screen_add_product_product_group.tr}:"),
                          Expanded(
                            child: Text(
                              controller.category.value.categoryName ?? "",
                            ),
                          ),
                          const SizedBox(
                            width: 8.0,
                          ),
                          IconButton(
                            onPressed: () {
                              // AwesomeDialog(
                              //   context: Get.context!,
                              //   body: Text(
                              //     LocaleKeys
                              //         .screen_add_product_if_the_product_group_is_changed_the_entered_properties_will_be_lost
                              //         .tr,
                              //     textAlign: TextAlign.center,
                              //   ),
                              //   dismissOnTouchOutside: false,
                              //   btnOkText: LocaleKeys.buttons_confirm.tr,
                              //   btnOkOnPress: () {
                              //     controller.openProductGroupsDialog();
                              //   },
                              //   btnCancelText: LocaleKeys.buttons_cancel.tr,
                              //   btnCancelOnPress: () {},
                              // ).show();
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
                      Stepper(
                        type: StepperType.vertical,
                        physics: const ScrollPhysics(),
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
                          _imageStep(),
                          _basicSpecificationStep(),
                          _otherSpecificationStep(),
                        ],
                      ),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Material(
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

  Widget _setTitleWidget({required String title}) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.blueAccent,
          ),
          width: 20.0,
          height: 20.0,
        ),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Step _imageStep() {
    var checkImage = controller.image.value.pickedFile != null;
    var checkImageList = controller.imagesList.isEmpty;

    return Step(
      title: Text(
        LocaleKeys.screen_add_product_choose_product_pictures.tr,
        style: const TextStyle(
          fontSize: 14.0,
        ),
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _setTitleWidget(title: LocaleKeys.screen_add_product_pics.tr),
              const SizedBox(
                width: 8,
              ),
              InkWell(
                borderRadius: BorderRadius.circular(50.0),
                child: const Icon(
                  Icons.info_outline_rounded,
                  color: Colors.blue,
                  size: 25.0,
                ),
                onTap: () {
                  controller.launchCameraHelpURL();
                },
              )
            ],
          ),
          const SizedBox(
            height: 16.0,
          ),
          SizedBox(
            height: 170,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(
                    width: 8.0,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(8.0),
                    onTap: () {
                      controller.openCameraDialog(isMainImage: true);
                      if (checkImage) {
                        // controller.goToPhotoPreview(isMainImage: true);
                      } else {
                        controller.openCameraDialog(isMainImage: true);
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
                                    child: ExtendedImage.memory(
                                      controller.image.value.pickedFile!,
                                      fit: BoxFit.contain,
                                      enableLoadState: true,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 5.0,
                                    left: 5.0,
                                    child: InkWell(
                                      onTap: () {
                                        // AwesomeDialog(
                                        //         context: Get.context!,
                                        //         animType: AnimType.SCALE,
                                        //         dialogType: DialogType.WARNING,
                                        //         body: Padding(
                                        //           padding: const EdgeInsets.all(3.0),
                                        //           child: Center(
                                        //               child: Text(
                                        //             LocaleKeys
                                        //                 .screen_add_product_are_you_sure_you_want_to_delete_this_image
                                        //                 .tr,
                                        //             style: const TextStyle(fontSize: 14.0),
                                        //             textAlign: TextAlign.center,
                                        //           )),
                                        //         ),
                                        //         btnOkText: LocaleKeys.buttons_yes.tr,
                                        //         btnOkOnPress: () {
                                        //           // controller.removeMainImage();
                                        //         },
                                        //         btnCancelText: LocaleKeys.buttons_no.tr,
                                        //         btnCancelOnPress: () {})
                                        //     .show();
                                      },
                                      child: const Icon(
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
                                  const Icon(
                                    Icons.image,
                                    size: 50.0,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    LocaleKeys.screen_add_product_choose_main_picture.tr,
                                    style: const TextStyle(fontSize: 12.0),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Wrap(
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
                            child: SizedBox(
                              height: 83,
                              width: 83,
                              child: Stack(
                                children: [
                                  ExtendedImage.memory(
                                    image.pickedFile!,
                                    fit: BoxFit.contain,
                                    enableLoadState: true,
                                  ),
                                  Positioned(
                                    bottom: 2.0,
                                    left: 2.0,
                                    child: InkWell(
                                      onTap: () {
                                        // AwesomeDialog(
                                        //         context: Get.context!,
                                        //         animType: AnimType.SCALE,
                                        //         dialogType: DialogType.WARNING,
                                        //         body: Padding(
                                        //           padding: const EdgeInsets.all(3.0),
                                        //           child: Center(
                                        //               child: Text(
                                        //             LocaleKeys
                                        //                 .screen_add_product_are_you_sure_you_want_to_delete_this_image
                                        //                 .tr,
                                        //             style: const TextStyle(fontSize: 14.0),
                                        //             textAlign: TextAlign.center,
                                        //           )),
                                        //         ),
                                        //         btnOkText: LocaleKeys.buttons_yes.tr,
                                        //         btnOkOnPress: () {
                                        //           // controller.removeImageFromImagesList(
                                        //           //     image: image);
                                        //         },
                                        //         btnCancelText: LocaleKeys.buttons_no.tr,
                                        //         btnCancelOnPress: () {})
                                        //     .show();
                                      },
                                      child: const Icon(
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
                          controller.openCameraDialog(isMainImage: false);
                        },
                        child: DottedBorder(
                          color: Colors.grey,
                          strokeWidth: 1,
                          dashPattern: const [5, 2],
                          radius: const Radius.circular(8.0),
                          padding: const EdgeInsets.all(0.0),
                          borderType: BorderType.RRect,
                          child: const SizedBox(
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
                          ? const SizedBox(
                              width: 83,
                              height: 83,
                            )
                          : Container()
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Step _basicSpecificationStep() {
    return Step(
      title: Text(
        LocaleKeys.screen_add_product_registration_basic_specifications.tr,
        style: const TextStyle(
          fontSize: 14.0,
        ),
      ),
      content: Column(
        children: [
          _setTitleWidget(title: "اصالت"),
          const SizedBox(
            height: 8.0,
          ),
          const Text(
            "در صورت ثبت کالا به عنوان اصل و تحویل کالای غیر اصل به مشتری، فروشنده تا ۱۰ برابر قیمت کالای اصلی آن جریمه خواهد شد.",
            style: TextStyle(color: Colors.red, fontSize: 12.0),
          ),
          const SizedBox(
            height: 16.0,
          ),
          SizedBox(
            height: 35.0,
            child: Center(
              child: ToggleButtons(
                isSelected: controller.isOriginalList,
                borderRadius: BorderRadius.circular(10.0),
                onPressed: (index) {
                  controller.updateIsOriginal(index: index);
                },
                children: const [
                  SizedBox(width: 150, child: Center(child: Text("کالا اصلی است"))),
                  SizedBox(width: 150, child: Center(child: Text("کالا اصلی نیست"))),
                ],
              ),
            ),
          ),
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
          TextFormField(
            controller: controller.productDescriptionController,
            decoration: InputDecoration(
              labelText: LocaleKeys.screen_add_product_fields_name_product_description.tr,
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            maxLines: null,
          ),
          const SizedBox(
            height: 16.0,
          ),
          SizedBox(
            height: 35.0,
            child: Center(
              child: ToggleButtons(
                isSelected: controller.isBrandList,
                borderRadius: BorderRadius.circular(10.0),
                onPressed: (index) {
                  controller.updateIsBrand(index: index);
                },
                children: const [
                  SizedBox(width: 150, child: Center(child: Text("برند دارد"))),
                  SizedBox(width: 150, child: Center(child: Text("برند ندارد"))),
                ],
              ),
            ),
          ),
          Visibility(
            visible: controller.isBrand.value == 1,
            child: Column(
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                TextField(
                  focusNode: controller.brandNode,
                  controller: controller.productBrandController,
                  readOnly: true,
                  decoration: InputDecoration(
                    labelText: LocaleKeys.screen_add_product_brand.tr,
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    suffixIcon: controller.productBrandController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              controller.removeBrand();
                            },
                            icon: const Icon(
                              Icons.clear,
                            ),
                          )
                        : const SizedBox(),
                  ),
                  onTap: () {
                    List<VMBrand> tempData = List<VMBrand>.empty(growable: true);

                    Get.defaultDialog(
                        title: LocaleKeys.screen_add_product_brand_selection.tr,
                        content: GetBuilder(
                          init: controller,
                          builder: (dynamic _) {
                            return SizedBox(
                              width: Get.width,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: 40.0,
                                          child: TextField(
                                            controller: controller.searchBrandController,
                                            decoration: InputDecoration(
                                              labelText: LocaleKeys.general_search.tr,
                                              alignLabelWithHint: true,
                                              border: OutlineInputBorder(
                                                borderSide: const BorderSide(color: Colors.grey),
                                                borderRadius: BorderRadius.circular(8.0),
                                              ),
                                              contentPadding: const EdgeInsets.all(8.0),
                                            ),
                                            onChanged: (value) async {
                                              await controller.startApiGetBrands(keyword: value);
                                              tempData.clear();
                                              tempData.addAll(controller.brandsList);
                                              controller.justUpdate();
                                            },
                                          ),
                                        ),
                                      ),
                                      Visibility(
                                        visible: tempData.isEmpty && controller.searchBrandController.text.isNotEmpty,
                                        child: IconButton(
                                          icon: const Icon(Icons.add),
                                          onPressed: () {
                                            VMBrand brand = VMBrand(id: null, name: controller.searchBrandController.text);
                                            controller.selectedBrand.value = brand;
                                            controller.productBrandController.text = brand.name!;
                                            controller.searchBrandController.text = "";
                                            controller.unFocus();
                                            Get.back();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                  const Divider(),
                                  SizedBox(
                                    width: Get.width,
                                    height: 200.0,
                                    child: Stack(
                                      children: [
                                        ListView.builder(
                                          itemCount: tempData.length,
                                          itemBuilder: (context, index) {
                                            var item = tempData[index];
                                            return Column(
                                              children: [
                                                InkWell(
                                                  borderRadius: BorderRadius.circular(8.0),
                                                  onTap: () {
                                                    controller.searchBrandController.text = "";
                                                    controller.selectedBrand.value = item;
                                                    controller.productBrandController.text = item.name!;
                                                    controller.unFocus();
                                                    Get.back();
                                                  },
                                                  child: Container(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Center(
                                                      child: Text(item.name!),
                                                    ),
                                                  ),
                                                ),
                                                const Divider(),
                                              ],
                                            );
                                          },
                                        ),
                                        controller.isBrandLoading.value
                                            ? Container(
                                                height: 200.0,
                                                color: const Color.fromARGB(150, 0, 0, 0),
                                                child: SpinKitCircle(
                                                  itemBuilder: (BuildContext context, int index) {
                                                    return DecoratedBox(
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: index.isEven ? Colors.lightBlueAccent : Colors.yellow,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        actions: [
                          SizedBox(
                            width: Get.width,
                            child: InkWell(
                              onTap: () {
                                controller.searchBrandController.text = "";
                                controller.unFocus();
                                Get.back();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: const Center(
                                  child: Text(
                                    "بستن",
                                    style: TextStyle(fontSize: 13.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          _setTitleWidget(title: LocaleKeys.screen_add_product_packaging_dimensions.tr),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              LocaleKeys.screen_add_product_enter_number_between_x_and_x_cm.trParams(
                {
                  "min": "1",
                  "max": "1000",
                },
              ),
              style: const TextStyle(fontSize: 12.0, color: Colors.blue),
            ),
          ),
          TextFormField(
            validator: (value) {
              // Conditions
              var checkValue = value == null || value.isEmpty;
              var checkWeight = !checkValue &&
                  (int.parse(controller.productPackLengthController.text) < 1 || int.parse(controller.productPackLengthController.text) > 1000);

              if (checkValue) {
                return LocaleKeys.screen_add_product_fields_error_general_error.trParams(
                  {
                    "field": LocaleKeys.screen_add_product_fields_name_length.tr,
                  },
                );
              } else if (checkWeight) {
                return LocaleKeys.screen_add_product_fields_error_numerical_between_x_and_x.trParams(
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
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly, LimitNumberInputFormatter(minNumber: 1, maxNumber: 1000)],
            decoration: InputDecoration(
              labelText: LocaleKeys.screen_add_product_fields_name_length_cm.tr,
              hintText: "0",
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
          TextFormField(
            validator: (value) {
              // Conditions
              var checkValue = value == null || value.isEmpty;
              var checkWeight = !checkValue &&
                  (int.parse(controller.productPackWidthController.text) < 1 || int.parse(controller.productPackWidthController.text) > 1000);

              if (checkValue) {
                return LocaleKeys.screen_add_product_fields_error_general_error.trParams(
                  {
                    "field": LocaleKeys.screen_add_product_fields_name_width.tr,
                  },
                );
              } else if (checkWeight) {
                return LocaleKeys.screen_add_product_fields_error_numerical_between_x_and_x.trParams(
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
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly, LimitNumberInputFormatter(minNumber: 1, maxNumber: 1000)],
            decoration: InputDecoration(
              labelText: LocaleKeys.screen_add_product_fields_name_width_cm.tr,
              hintText: "0",
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
          TextFormField(
            validator: (value) {
              // Conditions
              var checkValue = value == null || value.isEmpty;
              var checkWeight = !checkValue &&
                  (int.parse(controller.productPackHeightController.text) < 1 || int.parse(controller.productPackHeightController.text) > 1000);

              if (checkValue) {
                return LocaleKeys.screen_add_product_fields_error_general_error.trParams(
                  {
                    "field": LocaleKeys.screen_add_product_fields_name_height.tr,
                  },
                );
              } else if (checkWeight) {
                return LocaleKeys.screen_add_product_fields_error_numerical_between_x_and_x.trParams(
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
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly, LimitNumberInputFormatter(minNumber: 1, maxNumber: 1000)],
            decoration: InputDecoration(
              labelText: LocaleKeys.screen_add_product_fields_name_height_cm.tr,
              hintText: "0",
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
          _setTitleWidget(title: LocaleKeys.screen_add_product_package_weight.tr),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${LocaleKeys.screen_add_product_enter_number_between_x_and_x.trParams(
                {
                  "min": "1",
                  "max": "1000",
                },
              )} ${LocaleKeys.screen_add_product_also_select_the_type_of_weight.tr}",
              style: const TextStyle(fontSize: 12.0, color: Colors.blue),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(16.0, 0.0, 15.0, 0.0),
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
                items: const [
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
          const SizedBox(
            height: 16.0,
          ),
          TextFormField(
            validator: (value) {
              // Conditions
              var checkValue = value == null || value.isEmpty;
              var checkWeight = !checkValue &&
                  (int.parse(controller.productWeightController.text) < 1 || int.parse(controller.productWeightController.text) > 1000);

              if (checkValue) {
                return LocaleKeys.screen_add_product_fields_error_general_error.trParams(
                  {
                    "field": LocaleKeys.screen_add_product_package_weight.tr,
                  },
                );
              } else if (checkWeight) {
                return LocaleKeys.screen_add_product_fields_error_numerical_between_x_and_x.trParams(
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
            inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly, LimitNumberInputFormatter(minNumber: 1, maxNumber: 1000)],
            decoration: InputDecoration(
              labelText: LocaleKeys.screen_add_product_package_weight.tr,
              hintText: "0",
              alignLabelWithHint: true,
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) {
              controller.justUpdate();
            },
          ),
        ],
      ),
    );
  }

  Step _otherSpecificationStep() {
    return Step(
      title: Text(
        LocaleKeys.screen_add_product_registration_other_specification.tr,
        style: const TextStyle(
          fontSize: 14.0,
        ),
      ),
      content: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: controller.groupOptionsList.length,
        itemBuilder: (context, index) {
          var item = controller.groupOptionsList[index];
          return Column(
            children: [
              ExpandablePanel(
                header: Container(
                  padding: const EdgeInsets.only(top: 8.0),
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
                      const SizedBox(
                        width: 8.0,
                      ),
                      Text(
                        item.name!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                expanded: Column(
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: item.searchTextController,
                      decoration: InputDecoration(
                          labelText: LocaleKeys.general_search.tr,
                          alignLabelWithHint: true,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          contentPadding: const EdgeInsets.all(8.0),
                          prefixIcon: IconButton(
                            onPressed: () {
                              if (item.searchTextController!.text.isNotEmpty) {
                                item.searchResult!.clear();
                                for (var spcItem in item.items!) {
                                  if (spcItem.name!.contains(item.searchTextController!.text)) {
                                    item.searchResult!.add(spcItem);
                                  }
                                }
                                controller.justUpdate();
                              }
                            },
                            icon: const Icon(Icons.search),
                          ),
                          suffixIcon: item.searchTextController!.text.isNotEmpty
                              ? IconButton(
                                  onPressed: () {
                                    item.searchTextController!.text = "";
                                    item.searchResult!.clear();
                                    controller.justUpdate();
                                  },
                                  icon: const Icon(Icons.close),
                                )
                              : null),
                      onEditingComplete: () {
                        item.searchResult!.clear();
                        for (var spcItem in item.items!) {
                          if (spcItem.name!.contains(item.searchTextController!.text)) {
                            item.searchResult!.add(spcItem);
                          }
                        }
                        controller.justUpdate();
                      },
                      onChanged: (value) {
                        if (!kIsWeb) {
                          item.searchResult!.clear();
                          for (var spcItem in item.items!) {
                            if (spcItem.name!.contains(item.searchTextController!.text)) {
                              item.searchResult!.add(spcItem);
                            }
                          }
                          controller.justUpdate();
                        }
                      },
                    ),
                    const Divider(),
                    Container(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: item.searchResult!.isNotEmpty ? item.searchResult!.length : item.items!.length,
                        itemBuilder: (context, ind) {
                          var spcItem = item.searchResult!.isNotEmpty ? item.searchResult![ind] : item.items![ind];

                          // Conditions
                          var checkSpcItemSelectedItem = spcItem.selectedItem != null && spcItem.selectedItem!.value != null;

                          switch (spcItem.type) {
                            case OptionType.COLOR:
                              return Container();
                            case OptionType.SELECTABLE:
                              return Column(
                                children: [
                                  TextField(
                                    focusNode: spcItem.textNode,
                                    controller: spcItem.textController,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      labelText: spcItem.name,
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    onTap: () {
                                      List<VMOptionValue> tempData = List<VMOptionValue>.empty(growable: true);

                                      tempData.addAll(spcItem.values!);

                                      Get.defaultDialog(
                                          title: spcItem.name!,
                                          content: WillPopScope(
                                            onWillPop: () {
                                              spcItem.searchTextController.text = "";
                                              spcItem.searchTextNode.unfocus();
                                              Get.back();
                                              return Future.delayed(const Duration(seconds: 0)).then((value) {
                                                return true;
                                              });
                                            },
                                            child: GetBuilder(
                                              init: controller,
                                              builder: (dynamic _) {
                                                return Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: SizedBox(
                                                            height: 40.0,
                                                            child: TextField(
                                                              focusNode: spcItem.searchTextNode,
                                                              controller: spcItem.searchTextController,
                                                              decoration: InputDecoration(
                                                                labelText: LocaleKeys.general_search.tr,
                                                                alignLabelWithHint: true,
                                                                border: OutlineInputBorder(
                                                                  borderSide: const BorderSide(color: Colors.grey),
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                ),
                                                                contentPadding: const EdgeInsets.all(8.0),
                                                              ),
                                                              onChanged: (value) {
                                                                tempData.clear();
                                                                if (value.isNotEmpty) {
                                                                  for (var element in spcItem.values!) {
                                                                    if (element.title!.contains(value)) {
                                                                      tempData.add(element);
                                                                    }
                                                                  }
                                                                } else {
                                                                  tempData.addAll(spcItem.values!);
                                                                }
                                                                controller.justUpdate();
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                        Visibility(
                                                          visible: tempData.isEmpty,
                                                          child: IconButton(
                                                            icon: const Icon(Icons.add),
                                                            onPressed: () {
                                                              VMOptionValue spcData = VMOptionValue(
                                                                  title: spcItem.searchTextController.text,
                                                                  id: null,
                                                                  value: spcItem.searchTextController.text);
                                                              spcItem.searchTextController.text = "";
                                                              spcItem.searchTextNode.unfocus();
                                                              spcItem.textController.text = spcData.value!;
                                                              spcItem.selectedItem = spcData;
                                                              Get.back();
                                                            },
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    const Divider(),
                                                    SizedBox(
                                                      width: Get.width,
                                                      height: 200.0,
                                                      child: ListView.builder(
                                                        itemCount: tempData.length,
                                                        itemBuilder: (context, index) {
                                                          var item = tempData[index];
                                                          return Column(
                                                            children: [
                                                              InkWell(
                                                                borderRadius: BorderRadius.circular(8.0),
                                                                onTap: () {
                                                                  spcItem.searchTextController.text = "";
                                                                  spcItem.searchTextNode.unfocus();
                                                                  spcItem.textController.text = item.value!;
                                                                  spcItem.selectedItem = item;
                                                                  Get.back();
                                                                },
                                                                child: Container(
                                                                  padding: const EdgeInsets.all(8.0),
                                                                  child: Center(
                                                                    child: Text(item.title!),
                                                                  ),
                                                                ),
                                                              ),
                                                              const Divider(),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            ),
                                          ),
                                          actions: [
                                            InkWell(
                                              onTap: () {
                                                spcItem.searchTextController.text = "";
                                                spcItem.searchTextNode.unfocus();
                                                Get.back();
                                              },
                                              child: Container(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Center(
                                                  child: Text(
                                                    LocaleKeys.buttons_close.tr,
                                                    style: const TextStyle(fontSize: 13.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ]);
                                    },
                                  ),
                                  const Divider(),
                                ],
                              );
                            case OptionType.TEXT_INPUT_SINGLE:
                              return Column(
                                children: [
                                  TextField(
                                    focusNode: spcItem.textNode,
                                    controller: spcItem.textController,
                                    decoration: InputDecoration(
                                      labelText: spcItem.name,
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      spcItem.typedText = spcItem.textController.text;
                                    },
                                    maxLines: 1,
                                  ),
                                  const Divider(),
                                ],
                              );
                            case OptionType.TEXT_INPUT_MULTI:
                              return Column(
                                children: [
                                  TextField(
                                    focusNode: spcItem.textNode,
                                    controller: spcItem.textController,
                                    decoration: InputDecoration(
                                      labelText: spcItem.name,
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      spcItem.typedText = spcItem.textController.text;
                                    },
                                    maxLines: null,
                                  ),
                                  const Divider(),
                                ],
                              );
                            case OptionType.BOOL:
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(spcItem.name!),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
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
                                          spcItem.values!.length,
                                          (indexItem) => DropdownMenuItem<String>(
                                            value: spcItem.values![indexItem].value,
                                            child: Text(
                                              "${spcItem.values![indexItem].title}",
                                            ),
                                          ),
                                        ),
                                        onChanged: (String? value) async {
                                          for (var item in spcItem.values!) {
                                            // Conditions
                                            var checkItem = item.value!.toLowerCase() == value!.toLowerCase();

                                            if (checkItem) {
                                              spcItem.selectedItem = item;
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
                                        value: checkSpcItemSelectedItem ? spcItem.selectedItem!.value : null,
                                      ),
                                    ),
                                  ),
                                  const Divider(),
                                ],
                              );
                            case OptionType.NUMBER_INPUT:
                              return Column(
                                children: [
                                  TextField(
                                    focusNode: spcItem.textNode,
                                    controller: spcItem.textController,
                                    textAlign: TextAlign.left,
                                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,1}')),
                                    ],
                                    decoration: InputDecoration(
                                      labelText: spcItem.name,
                                      hintText: "0",
                                      alignLabelWithHint: true,
                                      border: OutlineInputBorder(
                                        borderSide: const BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                    ),
                                    onChanged: (value) {
                                      spcItem.typedText = spcItem.textController.text;
                                    },
                                  ),
                                  const Divider(),
                                ],
                              );
                            case OptionType.MULTI_SELECT:
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  MultiSelect(
                                    autovalidate: spcItem.isRequired!,
                                    addedData: true,
                                    addedDataFunction: (value) {
                                      VMOptionValue spcData =
                                          VMOptionValue(id: value["value"], title: value["text"], value: value["value"], isNew: true);
                                      spcItem.values!.add(spcData);
                                      spcItem.selectedItems ??= List<VMOptionValue>.empty(growable: true);

                                      spcItem.selectedItems!.add(spcData);
                                      controller.justUpdate();
                                    },
                                    titleText: spcItem.name,
                                    validator: (value) {
                                      if (value == null) {
                                        return LocaleKeys.screen_add_product_specs_select_one_or_more_items.tr;
                                      }
                                      return null;
                                    },
                                    dataSource: List.generate(
                                        spcItem.values!.length,
                                        (muIndex) => {
                                              "Title": spcItem.values![muIndex].title,
                                              "Value": spcItem.values![muIndex].value,
                                              "SpecValueId": spcItem.values![muIndex].id
                                            }).toList(),
                                    textField: "Title",
                                    valueField: "SpecValueId",
                                    filterable: true,
                                    required: spcItem.isRequired,
                                    initialValue: spcItem.selectedItems != null
                                        ? List.generate(spcItem.selectedItems!.length, (muIndex) => spcItem.selectedItems![muIndex].id).toList()
                                        : null,
                                    saveButtonText: LocaleKeys.buttons_confirm.tr,
                                    cancelButtonText: LocaleKeys.buttons_cancel.tr,
                                    hintText: LocaleKeys.screen_add_product_specs_select_one_or_more_items.tr,
                                    cancelButtonColor: Colors.red,
                                    onSaved: (value) {},
                                    open: () {
                                      controller.unFocus();
                                    },
                                    change: (value) {
                                      List<String?> tempList = List<String?>.empty(growable: true);
                                      if (value != null) {
                                        for (var i in value) {
                                          tempList.add(i);
                                        }
                                      }

                                      spcItem.selectedItems = List<VMOptionValue>.empty(growable: true);

                                      for (String? val in tempList) {
                                        for (var item in spcItem.values!) {
                                          // Conditions
                                          var checkSpecificationTypeItemId = val!.toLowerCase() == item.id!.toLowerCase();
                                          if (checkSpecificationTypeItemId) {
                                            spcItem.selectedItems!.add(item);
                                          }
                                        }
                                      }
                                      controller.justUpdate();
                                    },
                                  ),
                                  const Divider(),
                                ],
                              );
                            case OptionType.WEIGHT:
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(LocaleKeys.screen_add_product_specs_product_weight.tr),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "${LocaleKeys.screen_add_product_enter_number_between_x_and_x.trParams(
                                        {
                                          "min": "1",
                                          "max": "1000",
                                        },
                                      )} ${LocaleKeys.screen_add_product_also_select_the_type_of_weight.tr}",
                                      style: const TextStyle(fontSize: 12.0, color: Colors.blue),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 15.0, 0.0),
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
                                              items: const [
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
                                                controller.updateProductWeightType(productWeightType: value!);
                                                var weight = 0;
                                                if (spcItem.textController.text.isNotEmpty) {
                                                  weight = int.parse(spcItem.textController.text);
                                                  if (value == 0 && weight > 1000) {
                                                    weight = (weight / 1000).round();
                                                  }

                                                  if (value == 1 && weight < 1000) {
                                                    weight = (weight * 1000);
                                                  }

                                                  spcItem.textController.text = weight.toString();
                                                  controller.productWeightText.value = spcItem.textController.text;
                                                }
                                              },
                                              hint: const Text(
                                                LocaleKeys.screen_add_product_fields_name_type_of_weight,
                                              ),
                                              value: controller.productWeightType.value,
                                              onTap: () {
                                                controller.unFocus();
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 8.0,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          controller: spcItem.textController,
                                          focusNode: GetPlatform.isMobile ? spcItem.textNode : null,
                                          textAlignVertical: TextAlignVertical.center,
                                          textAlign: TextAlign.left,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: <TextInputFormatter>[
                                            FilteringTextInputFormatter.digitsOnly,
                                            LimitNumberInputFormatter(minNumber: 1, maxNumber: 1000)
                                          ],
                                          readOnly: controller.productWeightType.value == null ? true : false,
                                          decoration: InputDecoration(
                                            labelText: LocaleKeys.screen_add_product_specs_product_weight.tr,
                                            hintText: "0",
                                            alignLabelWithHint: true,
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(color: Colors.grey),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          onTap: () {
                                            if (controller.productWeightType.value == null) {
                                              ShowMessage.getSnackBar(
                                                message: LocaleKeys.screen_add_product_fields_error_first_determine_the_type_of_weight.tr,
                                                type: MessageType.WARNING,
                                              );
                                            }
                                          },
                                          onChanged: (value) {
                                            controller.justUpdate();
                                            if (spcItem.textController.text.isNotEmpty) {
                                              var weight = int.parse(spcItem.textController.text);
                                              weight = controller.productWeightType == 0 ? weight : weight * 1000;
                                              spcItem.typedText = weight.toString();
                                            } else {
                                              spcItem.typedText = "";
                                            }

                                            controller.productWeightText.value = spcItem.typedText ?? "";
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              );
                            case OptionType.DIMENSION:
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(LocaleKeys.screen_add_product_specs_product_dimension.tr),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      LocaleKeys.screen_add_product_enter_number_between_x_and_x_cm.trParams(
                                        {
                                          "min": "1",
                                          "max": "1000",
                                        },
                                      ),
                                      style: const TextStyle(fontSize: 12.0, color: Colors.blue),
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
                                            LimitNumberInputFormatter(minNumber: 1, maxNumber: 1000)
                                          ],
                                          decoration: InputDecoration(
                                            labelText: LocaleKeys.screen_add_product_fields_name_length_cm.tr,
                                            hintText: "0",
                                            alignLabelWithHint: true,
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(color: Colors.grey),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            var length =
                                                controller.productLengthController.text.isNotEmpty ? controller.productLengthController.text : "";
                                            var width =
                                                controller.productWidthController.text.isNotEmpty ? controller.productWidthController.text : "";
                                            var height =
                                                controller.productHeightController.text.isNotEmpty ? controller.productHeightController.text : "";

                                            var lengthString = length.isNotEmpty ? length : "";
                                            var widthString = width.isNotEmpty
                                                ? length.isNotEmpty
                                                    ? "x$width"
                                                    : width
                                                : "";
                                            var heightString = height.isNotEmpty
                                                ? length.isNotEmpty || width.isNotEmpty
                                                    ? "x$height"
                                                    : height
                                                : "";

                                            spcItem.typedText = "$lengthString$widthString$heightString";
                                          },
                                        ),
                                      ),
                                      const SizedBox(
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
                                            LimitNumberInputFormatter(minNumber: 1, maxNumber: 1000)
                                          ],
                                          decoration: InputDecoration(
                                            labelText: LocaleKeys.screen_add_product_fields_name_width_cm.tr,
                                            hintText: "0",
                                            alignLabelWithHint: true,
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(color: Colors.grey),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            var length =
                                                controller.productLengthController.text.isNotEmpty ? controller.productLengthController.text : "";
                                            var width =
                                                controller.productWidthController.text.isNotEmpty ? controller.productWidthController.text : "";
                                            var height =
                                                controller.productHeightController.text.isNotEmpty ? controller.productHeightController.text : "";

                                            var lengthString = length.isNotEmpty ? length : "";
                                            var widthString = width.isNotEmpty
                                                ? length.isNotEmpty
                                                    ? "x$width"
                                                    : width
                                                : "";
                                            var heightString = height.isNotEmpty
                                                ? length.isNotEmpty || width.isNotEmpty
                                                    ? "x$height"
                                                    : height
                                                : "";

                                            spcItem.typedText = "$lengthString$widthString$heightString";
                                          },
                                        ),
                                      ),
                                      const SizedBox(
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
                                            LimitNumberInputFormatter(minNumber: 1, maxNumber: 1000)
                                          ],
                                          decoration: InputDecoration(
                                            labelText: LocaleKeys.screen_add_product_fields_name_height_cm.tr,
                                            hintText: "0",
                                            alignLabelWithHint: true,
                                            border: OutlineInputBorder(
                                              borderSide: const BorderSide(color: Colors.grey),
                                              borderRadius: BorderRadius.circular(8.0),
                                            ),
                                          ),
                                          onChanged: (value) {
                                            var length =
                                                controller.productLengthController.text.isNotEmpty ? controller.productLengthController.text : "";
                                            var width =
                                                controller.productWidthController.text.isNotEmpty ? controller.productWidthController.text : "";
                                            var height =
                                                controller.productHeightController.text.isNotEmpty ? controller.productHeightController.text : "";

                                            var lengthString = length.isNotEmpty ? length : "";
                                            var widthString = width.isNotEmpty
                                                ? length.isNotEmpty
                                                    ? "x$width"
                                                    : width
                                                : "";
                                            var heightString = height.isNotEmpty
                                                ? length.isNotEmpty || width.isNotEmpty
                                                    ? "x$height"
                                                    : height
                                                : "";

                                            spcItem.typedText = "$lengthString$widthString$heightString";
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                ],
                              );
                            case OptionType.FILE_DOC:
                              return Container();
                            case OptionType.FILE_PIC:
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
              const Divider(
                color: Colors.blue,
                thickness: 2.0,
              )
            ],
          );
        },
      ),
    );
  }
}
