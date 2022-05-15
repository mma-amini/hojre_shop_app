import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_group_model.dart';
import 'package:hojre_shop_app/domain/core/helpers/log_helper.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_product_groups_use_case.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';

class AddProductController extends GetxController {
  final isLoading = false.obs;

  final Rxn<int> weightType = Rxn<int>();

  final category = VMProductGroup().obs;

  FocusNode productNameNode = FocusNode();
  FocusNode productDescriptionNode = FocusNode();
  FocusNode productWeightNode = FocusNode();
  FocusNode productPackLengthNode = FocusNode();
  FocusNode productPackWidthNode = FocusNode();
  FocusNode productPackHeightNode = FocusNode();
  FocusNode brandNode = FocusNode();
  FocusNode searchBrandNode = FocusNode();

  TextEditingController productGroupsDialogSearchController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productBrandController = TextEditingController();
  TextEditingController searchBrandController = TextEditingController();
  TextEditingController productWeightController = TextEditingController();
  TextEditingController productPackLengthController = TextEditingController();
  TextEditingController productPackWidthController = TextEditingController();
  TextEditingController productPackHeightController = TextEditingController();

  IProductGroupsUseCase iProductGroupsUseCase;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<FocusNode> focusNodesList = List<FocusNode>.empty(growable: true);
  List<VMProductGroup> tempProductGroupsList = List<VMProductGroup>.empty(growable: true);
  final productGroupsList = List<VMProductGroup>.empty(growable: true).obs;

  AddProductController({required this.iProductGroupsUseCase});

  @override
  void onInit() {
    super.onInit();

    focusNodesList.add(productNameNode);
    focusNodesList.add(productDescriptionNode);
    focusNodesList.add(productWeightNode);
    focusNodesList.add(productPackLengthNode);
    focusNodesList.add(productPackWidthNode);
    focusNodesList.add(productPackHeightNode);
    focusNodesList.add(brandNode);
    focusNodesList.add(searchBrandNode);
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
    for (var element in productGroupsList) {
      if (element.CategoryName!.contains(value)) {
        tempProductGroupsList.add(element);
      }
    }
    update();
  }

  updateCategory({required VMProductGroup category}) {
    this.category.update((val) {
      this.category.value = category;
    });

    update();
  }

  updateWeightType({required int weightType}) {
    this.weightType.update((val) {
      this.weightType.value = weightType;
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
          return SizedBox(
            width: 400.0,
            child: WillPopScope(
              onWillPop: () {
                productGroupsDialogSearchController.text = "";
                Get.back();
                return Future.delayed(const Duration(milliseconds: 500)).then((value) {
                  return true;
                });
              },
              child: Container(
                child: Column(
                  children: [
                    Container(
                      child: TextFormField(
                        controller: productGroupsDialogSearchController,
                        style: const TextStyle(fontSize: 12.0),
                        decoration: InputDecoration(
                          labelText: LocaleKeys.general_search.tr,
                          alignLabelWithHint: true,
                          contentPadding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 4.0),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        onChanged: (value) {
                          tempProductGroupsList.clear();
                          for (var element in productGroupsList) {
                            if (element.CategoryName!.contains(value)) {
                              tempProductGroupsList.add(element);
                            }
                          }
                          update();
                        },
                      ),
                    ),
                    const Divider(),
                    SizedBox(
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
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "${item.CategoryName}",
                                      style: const TextStyle(fontSize: 12.0),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider()
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
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  LocaleKeys.buttons_close.tr,
                  style: const TextStyle(color: Colors.blue),
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

  unFocus() {
    focusNodesList.forEach((element) {
      element.unfocus();
    });
    update();
  }

  justUpdate() {
    update();
  }

  startApiProductGroups() async {
    updateLoading(isLoading: true);
    await iProductGroupsUseCase.Handler().then((response) {
      updateLoading(isLoading: false);
      var data = response.getOrElse(() => []);

      List<VMProductGroup> tempProductGroupsList = List<VMProductGroup>.empty(growable: true);

      for (var element in data) {
        VMProductGroup productGroup = VMProductGroup(
          CategoryId: element.CategoryId,
          CategoryName: element.CategoryName,
          Picture: element.Picture,
          ParentId: element.ParentId,
        );

        tempProductGroupsList.add(productGroup);
      }

      updateProductGroupsList(productGroupsList: tempProductGroupsList);
    }).catchError((error) {
      updateLoading(isLoading: false);
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
    });
  }
}
