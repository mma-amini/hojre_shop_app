import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../../widgets/loading_view/loading_view.widget.dart';
import 'widgets_export.dart';

class BuildDesktopView extends StatelessWidget {
  const BuildDesktopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.screen_product_manager_page_title.tr),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 8.0,
              ),
              SearchWidget(key: Key("SearchWidget desktop")),
              CategoryListWidget(key: Key("CategoryListWidget desktop")),
              ProductListWidget(key: Key("ProductListWidget desktop")),
            ],
          ),
          LoadingViewWidget(key: const Key("ProductManagerScreen LoadingViewWidget desktop")),
        ],
      ),
      floatingActionButton: AddProductButtonWidget(key: Key("AddProductButtonWidget desktop")),
    );
  }
}
