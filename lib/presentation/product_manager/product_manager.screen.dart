import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';

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
                      SizedBox(
                        height: 8.0,
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        height: 60.0,
                        child: TextField(
                          maxLines: 1,
                          scrollPadding: EdgeInsets.all(0),
                          decoration: InputDecoration(
                              label: Text(LocaleKeys.general_search.tr),
                              border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(100.0),
                              ),
                              prefixIcon: Icon(Icons.search),
                              contentPadding: EdgeInsets.all(8.0)),
                        ),
                      ),
                      Container(
                        height: 54.0,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.all(8.0),
                          itemCount: controller.productGroupsList.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
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
                                padding: EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.grey.withOpacity(0.5),
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 30.0,
                                      width: 30.0,
                                      child: FittedBox(
                                        child: CachedNetworkImage(
                                          placeholder: (context, url) => Image.asset(
                                            "assets/media/images/hojre_shop_management_logo.png",
                                          ),
                                          imageUrl: item.Picture ?? "",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text(
                                      item.CategoryName ?? "",
                                      style: TextStyle(
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
                        child: ListView.builder(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                          itemCount: controller.shopProductsList.length,
                          itemBuilder: (context, index) {
                            var item = controller.shopProductsList[index];

                            return InkWell(
                              borderRadius: BorderRadius.circular(8.0),
                              onTap: () {},
                              child: Container(
                                height: 90.0,
                                padding: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1.0),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
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
                                    SizedBox(width: 8.0),
                                    Expanded(
                                      child: Text(item.ProductName ?? ""),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
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
        );
      },
    );
  }
}
