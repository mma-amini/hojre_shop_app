import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../../widgets/loading_view/loading_view.widget.dart';
import 'widgets_export.dart';

class BuildMobileView extends StatelessWidget {
  const BuildMobileView({Key? key}) : super(key: key);

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
              SearchWidget(key: Key("SearchWidget mobile")),
              CategoryListWidget(key: Key("CategoryListWidget mobile")),
              ProductListWidget(key: Key("ProductListWidget mobile")),
            ],
          ),
          LoadingViewWidget(key: const Key("ProductManagerScreen LoadingViewWidget mobile")),
        ],
      ),
      floatingActionButton: AddProductButtonWidget(key: Key("AddProductButtonWidget mobile")),
    );
  }
}
