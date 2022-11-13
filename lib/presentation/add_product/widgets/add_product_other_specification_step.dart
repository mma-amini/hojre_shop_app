import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../domain/core/dto/enums/message_type.dart';
import '../../../domain/core/dto/enums/option_type.dart';
import '../../../domain/core/dto/models/group_option_model.dart';
import '../../../domain/core/helpers/show_message.dart';
import '../../../generated/locales.g.dart';
import '../../widgets/custom_input_format.dart';
import '../../widgets/expandable.dart';
import '../../widgets/multi_select_drop_down/flutter_multiselect.dart';
import '../controllers/add_product.controller.dart';

class AddProductOtherSpecificationStep extends StatelessWidget {
  AddProductOtherSpecificationStep({Key? key}) : super(key: key);

  final controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
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
      );
    });
  }
}
