import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../domain/core/dto/models/brand_model.dart';
import '../../../generated/locales.g.dart';
import '../../widgets/custom_input_format.dart';
import '../controllers/add_product.controller.dart';
import 'set_title_widget.dart';

class AddProductBasicSpecificationStep extends StatelessWidget {
  AddProductBasicSpecificationStep({Key? key}) : super(key: key);

  final controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SetTitleWidget(title: "اصالت"),
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
        SetTitleWidget(title: LocaleKeys.screen_add_product_packaging_dimensions.tr),
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
        SetTitleWidget(title: LocaleKeys.screen_add_product_package_weight.tr),
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
            var checkWeight =
                !checkValue && (int.parse(controller.productWeightController.text) < 1 || int.parse(controller.productWeightController.text) > 1000);

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
    );
  }
}
