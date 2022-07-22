import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/message_type.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/option_type.dart';
import 'package:hojre_shop_app/domain/core/dto/models/brand_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/group_option_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_group_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_model.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/request_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/response_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/helpers/log_helper.dart';
import 'package:hojre_shop_app/domain/core/helpers/show_message.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_brands_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_group_specs_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_insert_product_picture_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_insert_product_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_product_groups_use_case.dart';
import 'package:hojre_shop_app/generated/locales.g.dart';
import 'package:hojre_shop_app/infrastructure/navigation/routes.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class AddProductController extends GetxController {
  final isLoading = false.obs;
  final isBrandLoading = false.obs;

  final productWeightText = "".obs;
  final productId = "".obs;

  final Rxn<int> packWeightType = Rxn<int>();
  final Rxn<int> productWeightType = Rxn<int>();
  final currentStep = 0.obs;
  final isBrand = 2.obs;
  final isOriginal = 2.obs;

  final category = VMProductGroup().obs;
  final sendProduct = InsertProductRequestDtoUseCase().obs;

  CancelToken cancelToken = CancelToken();

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
  IInsertProductUseCase iInsertProductUseCase;
  IInsertProductPictureUseCase iInsertProductPictureUseCase;

  final selectedBrand = VMBrand().obs;
  final image = VMSendProductPicture().obs;
  ImagePicker imagePicker = ImagePicker();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<FocusNode> focusNodesList = List<FocusNode>.empty(growable: true);
  List<VMProductGroup> tempProductGroupsList = List<VMProductGroup>.empty(growable: true);
  final productGroupsList = List<VMProductGroup>.empty(growable: true).obs;
  final groupOptionsList = List<VMGroupOption>.empty(growable: true).obs;
  final allOptions = List<VMOptionItem>.empty(growable: true).obs;
  final brandsList = List<VMBrand>.empty(growable: true).obs;
  final imagesList = List<VMSendProductPicture>.empty(growable: true).obs;
  final picturesList = List<InsertProductPictureRequestDtoUseCase>.empty(growable: true).obs;
  final isBrandList = List<bool>.empty(growable: true).obs;
  final isOriginalList = List<bool>.empty(growable: true).obs;

  AddProductController({
    required this.iProductGroupsUseCase,
    required this.iGroupSpecsUseCase,
    required this.iBrandsUseCase,
    required this.iInsertProductUseCase,
    required this.iInsertProductPictureUseCase,
  });

  @override
  void onInit() {
    isOriginalList.add(false);
    isOriginalList.add(false);
    isBrandList.add(false);
    isBrandList.add(false);

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
      if (element.categoryName!.contains(value)) {
        tempProductGroupsList.add(element);
      }
    }
    update();
  }

  updateCurrentStep({required int step}) {
    currentStep.update((val) {
      currentStep.value = step;
    });
  }

  updateGroupOptionsList({required List<VMGroupOption> groupOptionsList}) {
    this.groupOptionsList.clear();
    this.groupOptionsList.obs.update((val) {
      this.groupOptionsList.addAll(groupOptionsList);
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
    imagesList.obs.update((val) {
      imagesList.add(image);
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

  updateIsOriginal({required int index}) {
    isOriginalList.clear();
    isOriginalList.obs.update((val) {
      if (index == 0) {
        isOriginalList.add(true);
        isOriginalList.add(false);
        isOriginal.value = 1;
      } else {
        isOriginalList.add(false);
        isOriginalList.add(true);
        isOriginal.value = 0;
      }
    });
  }

  updateIsBrand({required int index}) {
    isBrandList.clear();
    isBrandList.obs.update((val) {
      if (index == 0) {
        isBrandList.add(true);
        isBrandList.add(false);
      } else {
        isBrandList.add(false);
        isBrandList.add(true);
      }
    });

    isBrand.update((val) {
      if (index == 0) {
        isBrand.value = 1;
      } else {
        isBrand.value = 0;
      }
    });
  }

  launchCameraHelpURL() async {
    var url = Uri(path: 'https://3soot.ir/Guide/ShopProductPhoto');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openCameraDialog({bool isMainImage = false}) async {
    //Conditions
    var checkProductID = (sendProduct.value.productId ?? "").isNotEmpty;

    if (checkProductID) {
      ShowMessage.getSnackBar(
          message: "امکان تغییر در تصاویر وجود ندارد.", title: "کالای شما ثبت شده است.", type: MessageType.ERROR);
      return;
    }

    if (kIsWeb || GetPlatform.isDesktop) {
      getImage(imageSource: ImageSource.gallery, isMainImage: isMainImage);
    } else {
      showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 270),
        context: Get.context!,
        pageBuilder: (_, __, ___) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 250,
              height: 120,
              margin: const EdgeInsets.only(
                bottom: 50,
                left: 12,
                right: 12,
              ),
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
                          const SizedBox(height: 8.0),
                          Text(
                            LocaleKeys.screen_add_product_select_input.tr,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Vazir Bold',
                            ),
                          ),
                          const SizedBox(height: 20.0),
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
                                    const Icon(
                                      Icons.camera_alt,
                                      size: 35.0,
                                      color: Colors.blue,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AutoSizeText(
                                        LocaleKeys.screen_add_product_camera.tr,
                                        minFontSize: 8.0,
                                        maxLines: 2,
                                        wrapWords: true,
                                        style: const TextStyle(
                                          fontSize: 12.0,
                                          fontFamily: 'Vazir Bold',
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                width: 50.0,
                              ),
                              InkWell(
                                onTap: () async {
                                  Get.back();
                                  getImage(imageSource: ImageSource.gallery, isMainImage: isMainImage);
                                },
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.photo,
                                      size: 35.0,
                                      color: Colors.blue,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: AutoSizeText(
                                        LocaleKeys.screen_add_product_gallery.tr,
                                        minFontSize: 8.0,
                                        maxLines: 2,
                                        wrapWords: true,
                                        style: const TextStyle(
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
            ),
          );
        },
        transitionBuilder: (_, anim, __, child) {
          var curve = Curves.easeInOutCirc;
          return SlideTransition(
            position:
                Tween(begin: const Offset(0, 1), end: const Offset(0, 0)).chain(CurveTween(curve: curve)).animate(anim),
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
              child: Column(
                children: [
                  TextFormField(
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
                        if (element.categoryName!.contains(value)) {
                          tempProductGroupsList.add(element);
                        }
                      }
                      update();
                    },
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
                                startApiGroupOptions();
                                Get.back();
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    "${item.categoryName}",
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
          );
        },
      ),
      actions: [
        InkWell(
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
        )
      ],
      barrierDismissible: false,
    );
  }

  unFocus() {
    for (var element in focusNodesList) {
      element.unfocus();
    }
    update();
  }

  justUpdate() {
    update();
  }

  void onFormSaved({bool isMain = true}) {
    final FormState form = formKey.currentState!;
    form.save();

    // Conditions
    var checkProductID = (sendProduct.value.productId ?? "").isNotEmpty;

    var checkPackageDimensions = productPackLengthController.text.isEmpty ||
        productPackWidthController.text.isEmpty ||
        productPackHeightController.text.isEmpty;
    var checkPackageWeight = productWeightController.text.isEmpty || int.parse(productWeightController.text) < 0;

    if (image.value.file == null && isMain) {
      ShowMessage.getSnackBar(message: "تصویر اصلی انتخاب نشده است", type: MessageType.ERROR);
      return;
    }

    if (isBrand.value == 2) {
      ShowMessage.getSnackBar(message: "وضعیت برند را مشخص نمایید", type: MessageType.ERROR);
      return;
    } else if (isBrand.value == 1) {
      LogHelper.printLog(data: "Brand: B");
      if (selectedBrand.value.name == null || selectedBrand.value.name!.isEmpty) {
        ShowMessage.getSnackBar(message: "برند را انتخاب نمایید", type: MessageType.ERROR);
        return;
      }

      sendProduct.value.brandName = selectedBrand.value.name;
      sendProduct.value.brandId = selectedBrand.value.id;
    }

    if (isOriginal.value == 2) {
      ShowMessage.getSnackBar(message: "وضعیت اصالت کالا را مشخص نمایید", type: MessageType.ERROR);
      return;
    } else {
      sendProduct.value.original = isOriginal.value == 1 ? true : false;
    }

    if (checkPackageWeight) {
      ShowMessage.getSnackBar(message: "وزن کالا وارد نشده است.", type: MessageType.ERROR);
      return;
    } else {
      if (packWeightType.value == null) {
        ShowMessage.getSnackBar(message: "نوع وزن کالا انتخاب نشده است.", type: MessageType.ERROR);
        return;
      }
      sendProduct.value.productPackWeight = packWeightType == 0
          ? int.parse(productWeightController.text)
          : int.parse(productWeightController.text) * 1000;
    }

    if (checkPackageDimensions) {
      ShowMessage.getSnackBar(message: "ابعاد کالا وارد نشده است.", type: MessageType.ERROR);
      return;
    } else {
      sendProduct.value.productPackLength = int.parse(productPackLengthController.text);
      sendProduct.value.productPackWidth = int.parse(productPackWidthController.text);
      sendProduct.value.productPackHeight = int.parse(productPackHeightController.text);
    }

    sendProduct.value.productName = productNameController.text;
    sendProduct.value.description = productDescriptionController.text;
    sendProduct.value.productGroupId = category.value.id;

    List<SectionOfInsertProductRequestDtoUseCase> sectionsList =
        List<SectionOfInsertProductRequestDtoUseCase>.empty(growable: true);

    for (var schema in groupOptionsList) {
      SectionOfInsertProductRequestDtoUseCase section = SectionOfInsertProductRequestDtoUseCase();
      section.specId = schema.id;
      List<DataOfSectionOfInsertProductRequestDtoUseCase> sendSpecificationsList =
          List<DataOfSectionOfInsertProductRequestDtoUseCase>.empty(growable: true);
      for (var specification in schema.items!) {
        DataOfSectionOfInsertProductRequestDtoUseCase sendSpecification =
            DataOfSectionOfInsertProductRequestDtoUseCase();

        // Conditions
        var checkValue = (specification.isRequired ?? false) && sendSpecification.value == null;

        sendSpecification.inputType = specification.inputTitle;
        sendSpecification.specItemId = specification.id;

        switch (specification.type) {
          case OptionType.COLOR:
            break;

          case OptionType.SELECTABLE:
            // Conditions
            var checkSelectedItem = specification.selectedItem == null;

            if (checkSelectedItem) {
              sendSpecification.value = null;
            } else {
              sendSpecification.value = specification.selectedItem;
            }
            break;

          case OptionType.TEXT_INPUT_SINGLE:
            sendSpecification.value = specification.typedText;
            break;

          case OptionType.NUMBER_INPUT:
            sendSpecification.value = specification.typedText;
            break;

          case OptionType.BOOL:
            sendSpecification.value = specification.booleanValue;
            break;

          case OptionType.MULTI_SELECT:
            // Conditions
            var checkSelectedItems = specification.selectedItems == null || specification.selectedItems!.isEmpty;

            if (checkSelectedItems) {
              sendSpecification.value = null;
            } else {
              List<VMOptionValue> valuesList = List<VMOptionValue>.empty(growable: true);
              for (var item in specification.selectedItems!) {
                if (item.isNew) {
                  item.id = null;
                }
                valuesList.add(item);
              }
              sendSpecification.value = valuesList;
            }
            break;

          case OptionType.WEIGHT:
            sendSpecification.value = specification.typedText;
            break;

          case OptionType.DIMENSION:
            sendSpecification.value = specification.typedText;
            break;
        }

        if (checkValue) {
          ShowMessage.getSnackBar(
              message: "مشخصه ${specification.name} در افزودن مشخصات تعیین نشده است.", type: MessageType.ERROR);
          return;
        }

        sendSpecificationsList.add(sendSpecification);
      }
      section.specs = List<DataOfSectionOfInsertProductRequestDtoUseCase>.empty(growable: true);
      section.specs!.addAll(sendSpecificationsList);
      sectionsList.add(section);
    }

    sendProduct.value.sections = List<SectionOfInsertProductRequestDtoUseCase>.empty(growable: true);
    sendProduct.value.sections!.addAll(sectionsList);

    for (var element in sendProduct.value.sections!) {
      LogHelper.printLog(data: "element: ${element.specId}");

      for (var element2 in element.specs!) {
        LogHelper.printLog(data: "element 2: ${element2.inputType}");

        LogHelper.printLog(data: "Value: ${element2.value}");
      }
    }

    if (!checkProductID) {
      startApiInsertProduct();
    } else {
      // cancelToken = CancelToken();
      // startUploadImagesApi();
    }
  }

  startUploadImagesApi() async {
    if (cancelToken.isCancelled) {
      ShowMessage.getSnackBar(message: "ارسال تصاویر با مشکل مواجه شد.", type: MessageType.ERROR);
      return;
    }

    var allPicturesIsUploaded = true;

    for (var picture in picturesList) {
      // Conditions
      var uploadCheck = picture.isUploaded == false;

      if (uploadCheck) {
        await startApiInsertProductPicture(insertProductPictureRequestDtoUseCase: picture);
      }
    }

    for (var pic in picturesList) {
      // Conditions
      var uploadCheck = pic.isUploaded == false;

      if (uploadCheck) {
        allPicturesIsUploaded = false;
      }
    }

    if (allPicturesIsUploaded) {
      Get.back();
    } else {
      startUploadImagesApi();
    }
  }

  startApiProductGroups() async {
    updateLoading(isLoading: true);
    await iProductGroupsUseCase.handler().then((response) {
      updateLoading(isLoading: false);
      var data = response.getOrElse(() => []);

      List<VMProductGroup> tempProductGroupsList = List<VMProductGroup>.empty(growable: true);

      for (var element in data) {
        VMProductGroup productGroup = VMProductGroup(
          id: element.id,
          categoryName: element.categoryName,
          picture: element.picture,
          parentId: element.parentId,
        );

        tempProductGroupsList.add(productGroup);
      }

      updateProductGroupsList(productGroupsList: tempProductGroupsList);
    }).catchError((error) {
      updateLoading(isLoading: false);
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
    });
  }

  startApiGroupOptions() async {
    updateLoading(isLoading: true);

    await iGroupSpecsUseCase
        .handler(params: GroupOptionsRequestDtoUseCase(categoryId: category.value.id ?? ""))
        .then((response) {
      updateLoading(isLoading: false);
      var data = response.getOrElse(() => []);

      List<VMGroupOption> tempGroupOptionsList = List<VMGroupOption>.empty(growable: true);

      for (var element in data) {
        var js = json.encode(element);
        Map<String, dynamic> jsData = json.decode(js);
        VMGroupOption groupSpec = VMGroupOption.fromJson(jsData);

        tempGroupOptionsList.add(groupSpec);
      }

      updateGroupOptionsList(groupOptionsList: tempGroupOptionsList);
    }).catchError((error) {
      updateLoading(isLoading: false);
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
    });
  }

  startApiGetBrands({required String keyword}) async {
    updateBrandLoading(isBrandLoading: true);
    await iBrandsUseCase.handler(params: BrandsRequestDtoUseCase(keyword: keyword)).then((response) {
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

  startApiInsertProduct() async {
    updateLoading(isLoading: true);
    await iInsertProductUseCase.handler(params: sendProduct.value).then((response) {
      var result = response.getOrElse(() => InsertProductResponseDtoUseCase());
      productId.value = result.productId ?? "";

      picturesList.clear();
      var mainImageName = const Uuid().v4();
      InsertProductPictureRequestDtoUseCase mainPicture = InsertProductPictureRequestDtoUseCase(
        sort: 0,
        isMain: true,
        isUploaded: false,
        pickedFile: image.value.pickedFile,
        id: mainImageName,
        productId: productId.value,
      );
      picturesList.add(mainPicture);

      var picSort = 1;
      for (var image in imagesList) {
        var name = const Uuid().v4();
        InsertProductPictureRequestDtoUseCase picture = InsertProductPictureRequestDtoUseCase(
          sort: picSort,
          isMain: false,
          isUploaded: false,
          pickedFile: image.pickedFile,
          id: name,
          productId: productId.value,
        );
        picturesList.add(picture);
        picSort++;
      }

      startUploadImagesApi();
    }).catchError((error) {
      updateLoading(isLoading: false);
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
    });
  }

  startApiInsertProductPicture(
      {required InsertProductPictureRequestDtoUseCase insertProductPictureRequestDtoUseCase}) async {
    await iInsertProductPictureUseCase.handler(params: insertProductPictureRequestDtoUseCase).then((response) {
      for (var pic in picturesList) {
        if (pic.id!.toLowerCase() == insertProductPictureRequestDtoUseCase.id!.toLowerCase()) {
          pic.isUploaded = true;
        }
      }
    }).catchError((error) {
      updateLoading(isLoading: false);
      cancelToken.cancel("cancelled");
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
    });
  }
}
