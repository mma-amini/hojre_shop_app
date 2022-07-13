import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_model.dart';
import 'package:hojre_shop_app/domain/core/helpers/crop_editor_helper.dart';
import 'package:uuid/uuid.dart';

class PhotoEditController extends GetxController {
  bool _cropping = false;
  final isLoading = false.obs;

  final double maxWidth = 1000.0;
  final double maxHeight = 1000.0;
  final double quality = 0.5;
  final double cropAspectRatios = CropAspectRatios.ratio1_1;

  final image = VMSendProductPicture().obs;
  final GlobalKey<ExtendedImageEditorState> editorKey = GlobalKey<ExtendedImageEditorState>();

  @override
  void onInit() {
    var argData = Get.arguments;
    if (argData != null) {
      image.value = argData['image'] ?? VMSendProductPicture();
    }

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  updateIsLoading({required bool isLoading}) {
    this.isLoading.update((val) {
      this.isLoading.value = isLoading;
    });
  }

  Future<void> cropImage() async {
    if (_cropping) {
      return;
    }

    updateIsLoading(isLoading: true);

    final Uint8List fileData =
        Uint8List.fromList((await cropImageDataWithDartLibrary(state: editorKey.currentState!))!);
    _cropping = false;
    updateIsLoading(isLoading: false);

    VMSendProductPicture finalPics = VMSendProductPicture(
      id: const Uuid().v4(),
      pickedFile: fileData,
      isUploaded: false,
    );
    Get.back(result: {"image": finalPics});
  }
}
