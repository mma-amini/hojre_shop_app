import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/add_product_specifications.controller.dart';

class AddProductSpecificationsScreen
    extends GetView<AddProductSpecificationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddProductSpecificationsScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddProductSpecificationsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
