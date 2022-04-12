import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/helpers/show_message.dart';

import 'controllers/product_manager.controller.dart';

class ProductManagerScreen extends GetView<ProductManagerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductManagerScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            ShowMessage.GetSnackBar(message: "dsfsdf", context: context);
          },
          child: Text("sadasd"),
        ),
      ),
    );
  }
}
