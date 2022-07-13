import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';

import 'controllers/product_design_manager.controller.dart';

class ProductDesignManagerScreen extends GetView<ProductDesignManagerController> {
  const ProductDesignManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              LocaleKeys.screen_product_design_manager_page_title.tr,
            ),
            centerTitle: true,
          ),
          body: Obx(() {
            return Stack(
              children: [
                Container(),
                controller.isLoading.value
                    ? Container(
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
                      )
                    : Container()
              ],
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            tooltip: LocaleKeys.screen_product_design_manager_add_product_design_button_tooltip.tr,
            child: const Icon(
              Icons.add,
            ),
          ),
        );
      },
    );
  }
}
