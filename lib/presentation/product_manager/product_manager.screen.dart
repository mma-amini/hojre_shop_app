import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';
import 'package:hojre_shop_app/infrastructure/navigation/routes.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'controllers/product_manager.controller.dart';

class ProductManagerScreen extends GetView<ProductManagerController> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: controller,
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(LocaleKeys.screen_product_manager_page_title.tr),
          ),
          body: Obx(() {
            return Stack(
              children: [
                Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 60.0,
                        child: TextField(
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
                      ),
                      SizedBox(
                        height: 54.0,
                        child: ListView.separated(
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
                                      visible: (item.Picture ?? "").isNotEmpty,
                                      child: SizedBox(
                                        height: 30.0,
                                        width: 30.0,
                                        child: CachedNetworkImage(
                                          placeholder: (context, url) => Image.asset(
                                            "assets/media/images/hojre_shop_management_logo.png",
                                          ),
                                          imageUrl: item.Picture ?? "",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Visibility(
                                      visible: (item.Picture ?? "").isNotEmpty,
                                      child: const SizedBox(
                                        width: 8.0,
                                      ),
                                    ),
                                    Text(
                                      item.CategoryName ?? "",
                                      style: const TextStyle(
                                        fontFamily: 'Vazir Med',
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: SmartRefresher(
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

                              return InkWell(
                                borderRadius: BorderRadius.circular(8.0),
                                onTap: () {},
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
                                          color: (item.IsActive ?? false) ? Colors.green : Colors.orange,
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
                                                placeholder: (context, url) => Image.asset(
                                                  "assets/media/images/product.jpg",
                                                ),
                                                imageUrl: item.Picture ?? "",
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
                                                  item.ProductName ?? "",
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
                                                            "${item.NotApprovedProductDesignsCount}",
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
                                                            "${item.ApprovedProductDesignsCount}",
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
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
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
            onPressed: () {
              Get.toNamed(Routes.ADD_PRODUCT);
            },
            tooltip: LocaleKeys.screen_product_manager_add_product_button_tooltip.tr,
            child: const Icon(
              Icons.add,
            ),
          ),
        );
      },
    );
  }
}
