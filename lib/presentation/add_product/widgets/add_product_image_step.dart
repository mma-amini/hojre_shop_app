import 'package:dotted_border/dotted_border.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/dto/enums/message_type.dart';
import '../../../domain/core/dto/models/product_model.dart';
import '../../../generated/locales.g.dart';
import '../../widgets/base_dialog.dart';
import '../controllers/add_product.controller.dart';
import 'set_title_widget.dart';

class AddProductImageStep extends StatelessWidget {
  AddProductImageStep({Key? key}) : super(key: key);

  final controller = Get.find<AddProductController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SetTitleWidget(title: LocaleKeys.screen_add_product_pics.tr),
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
                    var checkImage = controller.image.value.pickedFile != null;
                    if (checkImage) {
                      // controller.goToPhotoPreview(isMainImage: true);
                    } else {
                      controller.openCameraDialog(isMainImage: true);
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Obx(() {
                      return Container(
                        height: 170,
                        width: 170,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: controller.image.value.pickedFile != null
                            ? Stack(
                                children: [
                                  Obx(() {
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: ExtendedImage.memory(
                                        controller.image.value.pickedFile!,
                                        fit: BoxFit.contain,
                                        enableLoadState: true,
                                      ),
                                    );
                                  }),
                                  Positioned(
                                    bottom: 5.0,
                                    left: 5.0,
                                    child: InkWell(
                                      onTap: () {
                                        BaseDialog(
                                          messageType: MessageType.WARNING,
                                          btnOkText: LocaleKeys.buttons_yes.tr,
                                          btnOkOnTap: () {
                                            controller.image.value = VMSendProductPicture();
                                            Get.back();
                                          },
                                          btnCancelText: LocaleKeys.buttons_no.tr,
                                          btnCancelOnTap: () {
                                            Get.back();
                                          },
                                          massage: LocaleKeys.screen_add_product_are_you_sure_you_want_to_delete_this_image.tr,
                                        ).showBaseDialog();
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
                      );
                    }),
                  ),
                ),
                const SizedBox(
                  width: 8.0,
                ),
                Obx(() {
                  return Wrap(
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
                                        BaseDialog(
                                          messageType: MessageType.WARNING,
                                          btnOkText: LocaleKeys.buttons_yes.tr,
                                          btnOkOnTap: () {
                                            // controller.removeImageFromImagesList(
                                            //     image: image);
                                          },
                                          btnCancelText: LocaleKeys.buttons_no.tr,
                                          btnCancelOnTap: () {
                                            Get.back();
                                          },
                                          massage: LocaleKeys.screen_add_product_are_you_sure_you_want_to_delete_this_image.tr,
                                        ).showBaseDialog();
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
                      Obx(() {
                        return Visibility(
                          visible: controller.imagesList.isEmpty,
                          child: const SizedBox(
                            width: 83,
                            height: 83,
                          ),
                        );
                      })
                    ],
                  );
                })
              ],
            ),
          ),
        ),
      ],
    );
  }
}
