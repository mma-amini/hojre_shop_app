import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/loading_view/loading_view.widget.dart';
import 'body_widget.dart';

class BuildDesktopView extends StatelessWidget {
  const BuildDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Get.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.blue.withOpacity(0.7),
                const Color.fromARGB(255, 5, 49, 88),
              ],
            ),
          ),
          child: BodyWidget(key: Key('BodyWidget desktop')),
        ),
        LoadingViewWidget(key: Key('LoginScreen LoadingViewWidget desktop')),
      ],
    );
  }
}
