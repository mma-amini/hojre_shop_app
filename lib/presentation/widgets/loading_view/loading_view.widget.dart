import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import 'controller/loading_view.controller.dart';

class LoadingViewWidget extends StatelessWidget {
  LoadingViewWidget({Key? key}) : super(key: key);

  final controller = Get.find<LoadingViewWidgetController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Visibility(
        visible: controller.showLoading.value,
        child: Container(
          color: const Color.fromARGB(50, 255, 255, 255),
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
        ),
      );
    });
  }
}
