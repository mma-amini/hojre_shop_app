import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_group_model.dart';

import '../../../generated/assets.dart';
import '../controllers/product_manager.controller.dart';

class CategoryListWidget extends StatelessWidget {
  CategoryListWidget({Key? key}) : super(key: key);

  final controller = Get.find<ProductManagerController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.0,
      child: Obx(() {
        return ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8.0),
          itemCount: controller.productGroupsList.length,
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 8.0,
            );
          },
          itemBuilder: (context, index) {
            var item = controller.productGroupsList[index];
            return _categoryItem(item: item);
          },
        );
      }),
    );
  }

  Widget _categoryItem({required VMProductGroup item}) {
    return InkWell(
      borderRadius: BorderRadius.circular(12.0),
      onTap: () {
        controller.updateSelectedCategory(selectedCategory: item);
      },
      child: Container(
        height: 50.0,
        padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.grey.withOpacity(0.5),
        ),
        child: Row(
          children: [
            Visibility(
              visible: (item.picture ?? "").isNotEmpty,
              child: SizedBox(
                height: 30.0,
                width: 30.0,
                child: CachedNetworkImage(
                  placeholder: (context, url) => Image.asset(Assets.imagesHojreShopManagementLogo),
                  errorWidget: (context, url, error) => Image.asset(Assets.imagesHojreShopManagementLogo),
                  imageUrl: item.picture ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Visibility(
              visible: (item.picture ?? "").isNotEmpty,
              child: const SizedBox(
                width: 8.0,
              ),
            ),
            Text(
              item.categoryName ?? "",
              style: const TextStyle(
                fontFamily: 'Vazir Med',
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
