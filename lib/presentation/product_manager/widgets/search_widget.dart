import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../controllers/product_manager.controller.dart';

class SearchWidget extends StatelessWidget {
  SearchWidget({Key? key}) : super(key: key);

  final controller = Get.find<ProductManagerController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 60.0,
      child: TextField(
        controller: controller.searchTextEditingController,
        maxLines: 1,
        scrollPadding: const EdgeInsets.all(0),
        decoration: InputDecoration(
            label: Text(LocaleKeys.general_search.tr),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(100.0),
            ),
            prefixIcon: const Icon(Icons.search),
            contentPadding: const EdgeInsets.all(8.0)),
      ),
    );
  }
}
