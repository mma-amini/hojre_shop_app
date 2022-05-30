import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/models/brand_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/group_spec_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_group_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_model.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/request_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/helpers/log_helper.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_product_groups_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_use_case_exports.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';
import 'package:hojre_shop_app/infrastructure/navigation/routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class AddProductController extends GetxController {
  final isLoading = false.obs;
  final isBrandLoading = false.obs;

  final productWeightText = "".obs;

  final Rxn<int> packWeightType = Rxn<int>();
  final Rxn<int> productWeightType = Rxn<int>();
  final currentStep = 0.obs;

  final category = VMProductGroup().obs;

  FocusNode productNameNode = FocusNode();
  FocusNode productDescriptionNode = FocusNode();
  FocusNode productPackWeightNode = FocusNode();
  FocusNode productPackLengthNode = FocusNode();
  FocusNode productPackWidthNode = FocusNode();
  FocusNode productPackHeightNode = FocusNode();
  FocusNode brandNode = FocusNode();
  FocusNode searchBrandNode = FocusNode();
  FocusNode productWeightNode = FocusNode();
  FocusNode productLengthNode = FocusNode();
  FocusNode productWidthNode = FocusNode();
  FocusNode productHeightNode = FocusNode();

  TextEditingController productGroupsDialogSearchController = TextEditingController();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDescriptionController = TextEditingController();
  TextEditingController productBrandController = TextEditingController();
  TextEditingController searchBrandController = TextEditingController();
  TextEditingController productWeightController = TextEditingController();
  TextEditingController productPackLengthController = TextEditingController();
  TextEditingController productPackWidthController = TextEditingController();
  TextEditingController productPackHeightController = TextEditingController();
  TextEditingController productLengthController = TextEditingController();
  TextEditingController productWidthController = TextEditingController();
  TextEditingController productHeightController = TextEditingController();

  IProductGroupsUseCase iProductGroupsUseCase;
  IGroupSpecsUseCase iGroupSpecsUseCase;
  IBrandsUseCase iBrandsUseCase;

  final selectedBrand = VMBrand().obs;
  final image = VMSendProductPicture().obs;
  ImagePicker imagePicker = ImagePicker();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<FocusNode> focusNodesList = List<FocusNode>.empty(growable: true);
  List<VMProductGroup> tempProductGroupsList = List<VMProductGroup>.empty(growable: true);
  final productGroupsList = List<VMProductGroup>.empty(growable: true).obs;
  final groupSpecsList = List<VMGroupSpec>.empty(growable: true).obs;
  final allSpc = List<VMSpecItem>.empty(growable: true).obs;
  final brandsList = List<VMBrand>.empty(growable: true).obs;
  final imagesList = List<VMSendProductPicture>.empty(growable: true).obs;

  AddProductController({
    required this.iProductGroupsUseCase,
    required this.iGroupSpecsUseCase,
    required this.iBrandsUseCase,
  });

  @override
  void onInit() {
    super.onInit();

    focusNodesList.add(productNameNode);
    focusNodesList.add(productDescriptionNode);
    focusNodesList.add(productPackWeightNode);
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

  updateBrandLoading({required bool isBrandLoading}) {
    this.isBrandLoading.update((val) {
      this.isBrandLoading.value = isBrandLoading;
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

  updateCurrentStep({required int step}) {
    this.currentStep.update((val) {
      this.currentStep.value = step;
    });
  }

  updateGroupSpecsList({required List<VMGroupSpec> groupSpecsList}) {
    this.groupSpecsList.obs.update((val) {
      this.groupSpecsList.addAll(groupSpecsList);
    });
  }

  updateBrandsList({required List<VMBrand> brandsList}) {
    this.brandsList.clear();
    this.brandsList.obs.update((val) {
      this.brandsList.addAll(brandsList);
    });
  }

  updateCategory({required VMProductGroup category}) {
    this.category.update((val) {
      this.category.value = category;
    });

    update();
  }

  updateImage({required VMSendProductPicture image}) {
    this.image.update((val) {
      this.image.value = image;
    });
  }

  updateImagesList({required VMSendProductPicture image}) {
    this.imagesList.obs.update((val) {
      this.imagesList.add(image);
    });
  }

  updatePackWeightType({required int packWeightType}) {
    this.packWeightType.update((val) {
      this.packWeightType.value = packWeightType;
    });

    update();
  }

  updateProductWeightType({required int productWeightType}) {
    this.productWeightType.update((val) {
      this.productWeightType.value = productWeightType;
    });

    update();
  }

  removeBrand() {
    selectedBrand.value = VMBrand();
    productBrandController.text = "";
    unFocus();
    update();
  }

  launchCameraHelpURL() async {
    const url = 'https://3soot.ir/Guide/ShopProductPhoto';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openCameraDialog({bool isMainImage = false}) async {
    // Conditions
    // var checkProductID = sendProduct.ProductID != null && sendProduct.ProductID!.isNotEmpty;
    //
    // if (checkProductID) {
    //   Brain.getSnackBar(
    //       message: "امکان تغییر در تصاویر وجود ندارد.", title: "کالای شما ثبت شده است.", type: SnackBarType.ERROR);
    //   return;
    // }

    if (kIsWeb || GetPlatform.isDesktop) {
      getImage(imageSource: ImageSource.gallery, isMainImage: isMainImage);
    } else {
      showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 270),
        context: Get.context!,
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 250,
              height: 120,
              child: SizedBox.expand(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: SizedBox.expand(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 8.0),
                          Text(
                            LocaleKeys.screen_add_product_select_input.tr,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Vazir Bold',
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.back();
                                  getImage(imageSource: ImageSource.camera, isMainImage: isMainImage);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 35.0,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AutoSizeText(
                                        LocaleKeys.screen_add_product_camera.tr,
                                        minFontSize: 8.0,
                                        maxLines: 2,
                                        wrapWords: true,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontFamily: 'Vazir Bold',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 50.0,
                              ),
                              InkWell(
                                onTap: () async {
                                  Get.back();
                                  getImage(imageSource: ImageSource.gallery, isMainImage: isMainImage);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      child: Icon(
                                        Icons.photo,
                                        size: 35.0,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AutoSizeText(
                                        LocaleKeys.screen_add_product_gallery.tr,
                                        minFontSize: 8.0,
                                        maxLines: 2,
                                        wrapWords: true,
                                        style: TextStyle(
                                          fontSize: 12.0,
                                          fontFamily: 'Vazir Bold',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              margin: EdgeInsets.only(
                bottom: 50,
                left: 12,
                right: 12,
              ),
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          var curve = Curves.easeInOutCirc;
          return SlideTransition(
            position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).chain(CurveTween(curve: curve)).animate(anim),
            child: child,
          );
        },
      );
    }
  }

  getImage({required ImageSource imageSource, bool? isMainImage = false}) async {
    Uint8List pickedImage;
    if (imageSource == ImageSource.camera) {
      PickedFile? pickedFile = await imagePicker.getImage(source: imageSource);
      pickedImage = await pickedFile!.readAsBytes();
    } else {
      FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'bmp'],
        allowCompression: true,
        dialogTitle: LocaleKeys.screen_add_product_image_selection.tr,
        withData: true,
        lockParentWindow: false,
      );

      pickedImage = pickedFile!.files[0].bytes!;
    }

    var data = await Get.toNamed(
      Routes.PHOTO_EDIT,
      arguments: {
        "image": VMSendProductPicture(
          pickedFile: pickedImage,
        ),
      },
    );

    if (data != null) {
      if (isMainImage ?? false) {
        updateImage(image: data['image']);
      } else {
        updateImagesList(image: data['image']);
      }
    }

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
                                  startApiGroupSpecs();
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
              Get.back(
                closeOverlays: true,
              );
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
      barrierDismissible: false,
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

  goToAddProductSpecificationsPage() {
    Get.toNamed(
      Routes.ADD_PRODUCT_SPECIFICATIONS,
      arguments: {"specifications": groupSpecsList.value},
    );
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

  startApiGroupSpecs() async {
    updateLoading(isLoading: true);

    await iGroupSpecsUseCase.Handler(params: GroupSpecsRequestDtoUseCase(categoryId: category.value.CategoryId ?? ""))
        .then((response) {
      updateLoading(isLoading: false);
      var data = response.getOrElse(() => []);

      List<VMGroupSpec> tempGroupSpecsList = List<VMGroupSpec>.empty(growable: true);

      for (var element in data) {
        var js = json.encode(element);
        Map<String, dynamic> jsData = json.decode(js);
        VMGroupSpec groupSpec = VMGroupSpec.fromJson(jsData);

        tempGroupSpecsList.add(groupSpec);
      }

      updateGroupSpecsList(groupSpecsList: tempGroupSpecsList);
    }).catchError((error) {
      updateLoading(isLoading: false);
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
    });
  }

  startApiGetBrands({required String keyword}) async {
    updateBrandLoading(isBrandLoading: true);
    await iBrandsUseCase.Handler(params: BrandsRequestDtoUseCase(keyword: keyword)).then((response) {
      updateBrandLoading(isBrandLoading: false);
      var data = response.getOrElse(() => []);

      List<VMBrand> tempBrandsList = List<VMBrand>.empty(growable: true);

      for (var element in data) {
        var js = json.encode(element);
        Map<String, dynamic> jsData = json.decode(js);
        VMBrand brand = VMBrand.fromJson(jsData);

        tempBrandsList.add(brand);
      }

      updateBrandsList(brandsList: tempBrandsList);
    }).catchError((error) {
      updateBrandLoading(isBrandLoading: false);
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
    });
  }
}
