import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/home.controller.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('screen_home'.tr),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            controller.updateLocale();
          },
          child: Container(
            padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
            child: Text('buttons_login'.tr),
          ),
        ),
      ),
    );
  }
}
