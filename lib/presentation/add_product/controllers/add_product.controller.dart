import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_group_model.dart';
import 'package:hojre_shop_app/domain/core/helpers/log_helper.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_product_groups_use_case.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';

class AddProductController extends GetxController {
  final isLoading = false.obs;

  final Rx<VMProductGroup> category = VMProductGroup().obs;

  TextEditingController productGroupsDialogSearchController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  IProductGroupsUseCase iProductGroupsUseCase;

  final GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  List<VMProductGroup> tempProductGroupsList = List<VMProductGroup>.empty(growable: true);
  final productGroupsList = List<VMProductGroup>.empty(growable: true).obs;

  AddProductController({required this.iProductGroupsUseCase});

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    startApiProductGroups();
  }

  @override
  void onClose() {}

  updateLoading({required bool isLoading}) {
    this.isLoading.update((val) {
      this.isLoading.value = isLoading;
    });
  }

  updateProductGroupsList({required List<VMProductGroup> productGroupsList}) {
    this.productGroupsList.obs.update((val) {
      this.productGroupsList.addAll(productGroupsList);
    });

    openProductGroupsDialog();
  }

  searchOnProductGroupsList({required String value}) {
    tempProductGroupsList.clear();
    productGroupsList.forEach((element) {
      if (element.CategoryName!.contains(value)) {
        tempProductGroupsList.add(element);
      }
    });
    update();
  }

  updateCategory({required VMProductGroup category}) {
    this.category.update((val) {
      this.category.value = category;
    });

    update();
  }

  openProductGroupsDialog() async {
    List<VMProductGroup> tempProductGroupsList = List<VMProductGroup>.empty(growable: true);

    Get.defaultDialog(
      title: LocaleKeys.screen_add_product_select_the_product_group.tr,
      content: GetBuilder(
        init: this,
        builder: (dynamic _) {
          return Container(
            width: 400.0,
            child: WillPopScope(
              onWillPop: () {
                productGroupsDialogSearchController.text = "";
                Get.back();
                return Future.delayed(Duration(milliseconds: 500)).then((value) {
                  return true;
                });
              },
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: TextFormField(
                        controller: productGroupsDialogSearchController,
                        style: TextStyle(fontSize: 12.0),
                        decoration: InputDecoration(
                          labelText: LocaleKeys.general_search.tr,
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                          border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onChanged: (value) {
                          tempProductGroupsList.clear();
                          productGroupsList.forEach((element) {
                            if (element.CategoryName!.contains(value)) {
                              tempProductGroupsList.add(element);
                            }
                          });
                          update();
                        },
                      ),
                    ),
                    Divider(),
                    Container(
                      height: 200.0,
                      child: ListView.builder(
                        itemCount: productGroupsDialogSearchController.text.isNotEmpty
                            ? tempProductGroupsList.length
                            : productGroupsList.length,
                        itemBuilder: (context, index) {
                          var item = productGroupsDialogSearchController.text.isNotEmpty
                              ? tempProductGroupsList[index]
                              : productGroupsList[index];
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  updateCategory(category: item);
                                  productGroupsDialogSearchController.text = "";
                                  // Get.offNamed(Routes.ADD_PRODUCT, arguments: {"productGroup": item});
                                  Get.back();
                                },
                                child: Container(
                                  padding: EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "${item.CategoryName}",
                                      style: TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                ),
                              ),
                              Divider()
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      actions: [
        Container(
          child: InkWell(
            onTap: () {
              productGroupsDialogSearchController.text = "";
              Get.back();
            },
            child: Container(
              width: Get.context!.width,
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  LocaleKeys.buttons_close.tr,
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void onFormSaved({bool isMain = true}) {
    final FormState form = formKey.currentState!;
    form.save();
  }

  startApiProductGroups() async {
    updateLoading(isLoading: true);
    await iProductGroupsUseCase.Handler().then((response) {
      updateLoading(isLoading: false);
      var data = response.getOrElse(() => []);

      List<VMProductGroup> tempProductGroupsList = List<VMProductGroup>.empty(growable: true);

      data.forEach((element) {
        VMProductGroup productGroup = VMProductGroup(
          CategoryId: element.CategoryId,
          CategoryName: element.CategoryName,
          Picture: element.Picture,
          ParentId: element.ParentId,
        );

        tempProductGroupsList.add(productGroup);
      });

      updateProductGroupsList(productGroupsList: tempProductGroupsList);
    }).catchError((error) {
      updateLoading(isLoading: false);
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
    });
  }
}
