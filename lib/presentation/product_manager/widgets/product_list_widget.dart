import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../generated/assets.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../controllers/product_manager.controller.dart';

class ProductListWidget extends StatelessWidget {
  ProductListWidget({Key? key}) : super(key: key);

  final controller = Get.find<ProductManagerController>();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          controller: controller.refreshController,
          header: const WaterDropHeader(
            complete: Text(""),
          ),
          footer: CustomFooter(
            builder: (BuildContext context, LoadStatus? mode) {
              Widget body;
              if (mode == LoadStatus.idle) {
                body = const Text(
                  "برای دریافت داده‌های بیشتر صفحه را به سمت بالا بکشید",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                  textAlign: TextAlign.center,
                );
              } else if (mode == LoadStatus.loading) {
                body = const CircularProgressIndicator();
              } else if (mode == LoadStatus.failed) {
                body = const Text(
                  "خطا در دریافت اطلاعات! مجددا تلاش کنید",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                  textAlign: TextAlign.center,
                );
              } else if (mode == LoadStatus.canLoading) {
                body = const Text(
                  "دریافت داده‌های بیشتر",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                  textAlign: TextAlign.center,
                );
              } else {
                body = const Text(
                  "داده دیگری موجود نیست",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13.0,
                  ),
                  textAlign: TextAlign.center,
                );
              }
              return SizedBox(
                height: 40.0,
                child: Center(child: body),
              );
            },
          ),
          onRefresh: controller.onRefresh,
          onLoading: () {
            if (controller.loadData) {
              controller.updateSkip();
              controller.startApiShopProducts();
            } else {
              controller.refreshController.loadNoData();
            }
          },
          child: ListView.builder(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            itemCount: controller.shopProductsList.length,
            itemBuilder: (context, index) {
              var item = controller.shopProductsList[index];

              return _productItem(item: item);
            },
          ),
        );
      }),
    );
  }

  Widget _productItem({required VMProduct item}) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Get.toNamed(
              Routes.PRODUCT_DESIGN_MANAGER,
              parameters: {
                "productId": item.id ?? "",
              },
            );
          },
          child: Stack(
            children: [
              Positioned(
                top: 4.0,
                left: 4.0,
                child: Container(
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (item.isActive ?? false) ? Colors.green : Colors.orange,
                  ),
                ),
              ),
              Container(
                height: 90.0,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                      child: AspectRatio(
                        aspectRatio: 1.0,
                        child: CachedNetworkImage(
                          placeholder: (context, url) => Image.asset(Assets.imagesProduct),
                          errorWidget: (context, url, error) => Image.asset(Assets.imagesProduct),
                          imageUrl: item.picture ?? "",
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AutoSizeText(
                            item.productName ?? "",
                            maxLines: 2,
                            maxFontSize: 14.0,
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.orange, width: 1.5),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${item.notApprovedProductDesignsCount}",
                                      style: const TextStyle(
                                        color: Colors.orange,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8.0,
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.green, width: 1.5),
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "${item.approvedProductDesignsCount}",
                                      style: const TextStyle(
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}
