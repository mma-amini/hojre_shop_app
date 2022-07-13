import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'controllers/photo_edit.controller.dart';

class PhotoEditScreen extends GetView<PhotoEditController> {
  const PhotoEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "ویرایش عکس",
            ),
            centerTitle: true,
          ),
          body: Obx(() {
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ExtendedImage.memory(
                        controller.image.value.pickedFile!,
                        fit: BoxFit.contain,
                        mode: ExtendedImageMode.editor,
                        enableLoadState: true,
                        extendedImageEditorKey: controller.editorKey,
                        cacheRawData: true,
                        initEditorConfigHandler: (ExtendedImageState? state) {
                          return EditorConfig(
                            maxScale: 8.0,
                            cropRectPadding: const EdgeInsets.all(20.0),
                            hitTestSize: 20.0,
                            initCropRectType: InitCropRectType.imageRect,
                            cropAspectRatio: controller.cropAspectRatios,
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    )
                  ],
                ),
                controller.isLoading.value
                    ? Container(
                        height: Get.context!.height,
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
            );
          }),
          bottomNavigationBar: BottomAppBar(
            //color: Colors.lightBlue,
            shape: const CircularNotchedRectangle(),
            child: ButtonTheme(
              minWidth: 0.0,
              padding: EdgeInsets.zero,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Get.isDarkMode ? Colors.white.withOpacity(0.15) : Colors.blue.withOpacity(0.15),
                    elevation: 0.0,
                    child: InkWell(
                      onTap: () {
                        controller.updateIsLoading(isLoading: true);
                        controller.cropImage();
                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(18.0, 6.0, 18.0, 6.0),
                        child: Text(
                          "تایید",
                          style: TextStyle(
                            color: Get.isDarkMode ? Colors.white : Colors.blue,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.flip),
                    onPressed: () {
                      controller.editorKey.currentState!.flip();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.rotate_left),
                    onPressed: () {
                      controller.editorKey.currentState!.rotate(right: false);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.rotate_right),
                    onPressed: () {
                      controller.editorKey.currentState!.rotate(right: true);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.restore),
                    onPressed: () {
                      controller.editorKey.currentState!.reset();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
