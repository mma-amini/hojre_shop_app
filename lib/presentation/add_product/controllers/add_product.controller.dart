import 'dart:convert';
import 'dart:typed_data';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/message_type.dart';
import 'package:hojre_shop_app/domain/core/dto/enums/spec_type.dart';
import 'package:hojre_shop_app/domain/core/dto/models/brand_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/group_spec_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_group_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/product_model.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/requests/request_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/dto/use_cases/responses/response_dto_use_case_exports.dart';
import 'package:hojre_shop_app/domain/core/helpers/log_helper.dart';
import 'package:hojre_shop_app/domain/core/helpers/show_message.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_insert_product_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_product_groups_use_case.dart';
import 'package:hojre_shop_app/domain/core/interfaces/use_cases/i_use_case_exports.dart';
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
  final groupSpecsList = List<VMGroupSpec>.empty(growable: true).obs;
  final allSpc = List<VMSpecItem>.empty(growable: true).obs;
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
    const url = 'https://3soot.ir/Guide/ShopProductPhoto';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openCameraDialog({bool isMainImage = false}) async {
    //Conditions
    var checkProductID = (sendProduct.value.ProductId ?? "").isNotEmpty;

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

  unFocus() {
    focusNodesList.forEach((element) {
      element.unfocus();
    });
    update();
  }

  justUpdate() {
    update();
  }

  void onFormSaved({bool isMain = true}) {
    final FormState form = formKey.currentState!;
    form.save();

    // Conditions
    var checkProductID = (sendProduct.value.ProductId ?? "").isNotEmpty;

    var checkPackageDimensions = productPackLengthController.text.isEmpty ||
        productPackWidthController.text.isEmpty ||
        productPackHeightController.text.isEmpty;
    var checkPackageWeight = productWeightController.text.isEmpty || int.parse(productWeightController.text) < 0;

    if (image == null && isMain) {
      ShowMessage.getSnackBar(message: "تصویر اصلی انتخاب نشده است", type: MessageType.ERROR);
      return;
    }

    if (isBrand.value == 2) {
      ShowMessage.getSnackBar(message: "وضعیت برند را مشخص نمایید", type: MessageType.ERROR);
      return;
    } else if (isBrand.value == 1) {
      LogHelper.printLog(data: "Brand: B");
      if (selectedBrand.value.Name == null || selectedBrand.value.Name!.isEmpty) {
        ShowMessage.getSnackBar(message: "برند را انتخاب نمایید", type: MessageType.ERROR);
        return;
      }

      sendProduct.value.BrandName = selectedBrand.value.Name != null ? selectedBrand.value.Name : null;
      sendProduct.value.BrandId = selectedBrand.value.Id != null ? selectedBrand.value.Id : null;
    }

    if (isOriginal.value == 2) {
      ShowMessage.getSnackBar(message: "وضعیت اصالت کالا را مشخص نمایید", type: MessageType.ERROR);
      return;
    } else {
      sendProduct.value.Original = isOriginal.value == 1 ? true : false;
    }

    if (checkPackageWeight) {
      ShowMessage.getSnackBar(message: "وزن کالا وارد نشده است.", type: MessageType.ERROR);
      return;
    } else {
      if (packWeightType == null) {
        ShowMessage.getSnackBar(message: "نوع وزن کالا انتخاب نشده است.", type: MessageType.ERROR);
        return;
      }
      sendProduct.value.ProductPackWeight = packWeightType == 0
          ? int.parse(productWeightController.text)
          : int.parse(productWeightController.text) * 1000;
    }

    if (checkPackageDimensions) {
      ShowMessage.getSnackBar(message: "ابعاد کالا وارد نشده است.", type: MessageType.ERROR);
      return;
    } else {
      sendProduct.value.ProductPackLength = int.parse(productPackLengthController.text);
      sendProduct.value.ProductPackWidth = int.parse(productPackWidthController.text);
      sendProduct.value.ProductPackHeight = int.parse(productPackHeightController.text);
    }

    sendProduct.value.ProductName = productNameController.text;
    sendProduct.value.Description = productDescriptionController.text;
    sendProduct.value.ProductGroupId = category.value.CategoryId;

    List<SectionOfInsertProductRequestDtoUseCase> sectionsList =
        List<SectionOfInsertProductRequestDtoUseCase>.empty(growable: true);

    for (var schema in groupSpecsList) {
      SectionOfInsertProductRequestDtoUseCase section = SectionOfInsertProductRequestDtoUseCase();
      section.SpecId = schema.SpecId;
      List<DataOfSectionOfInsertProductRequestDtoUseCase> sendSpecificationsList =
          List<DataOfSectionOfInsertProductRequestDtoUseCase>.empty(growable: true);
      for (var specification in schema.Items!) {
        DataOfSectionOfInsertProductRequestDtoUseCase sendSpecification =
            DataOfSectionOfInsertProductRequestDtoUseCase();

        // Conditions
        var checkValue = (specification.IsRequired ?? false) && sendSpecification.Value == null;

        sendSpecification.InputType = specification.InputTitle;
        sendSpecification.SpecItemId = specification.SpecItemId;

        switch (specification.type) {
          case SpecificationType.COLOR:
            break;

          case SpecificationType.SELECTABLE:
            // Conditions
            var checkSelectedItem = specification.SelectedItem == null;

            if (checkSelectedItem) {
              sendSpecification.Value = null;
            } else {
              sendSpecification.Value = specification.SelectedItem;
            }
            break;

          case SpecificationType.TEXT_INPUT:
            sendSpecification.Value = specification.TypedText;
            break;

          case SpecificationType.NUMBER_INPUT:
            sendSpecification.Value = specification.TypedText;
            break;

          case SpecificationType.BOOL:
            sendSpecification.Value = specification.BooleanValue != null ? specification.BooleanValue : null;
            break;

          case SpecificationType.MULTI_SELECT:
            // Conditions
            var checkSelectedItems = specification.SelectedItems == null || specification.SelectedItems!.isEmpty;

            if (checkSelectedItems) {
              sendSpecification.Value = null;
            } else {
              List<VMSpecValue> valuesList = List<VMSpecValue>.empty(growable: true);
              for (var item in specification.SelectedItems!) {
                if (item.isNew) {
                  item.SpecValueId = null;
                }
                valuesList.add(item);
              }
              sendSpecification.Value = valuesList;
            }
            break;

          case SpecificationType.WEIGHT:
            sendSpecification.Value = specification.TypedText;
            break;

          case SpecificationType.DIMENSION:
            sendSpecification.Value = specification.TypedText;
            break;
        }

        if (checkValue) {
          ShowMessage.getSnackBar(
              message: "مشخصه ${specification.Name} در افزودن مشخصات تعیین نشده است.", type: MessageType.ERROR);
          return;
        }

        sendSpecificationsList.add(sendSpecification);
      }
      section.Specs = List<DataOfSectionOfInsertProductRequestDtoUseCase>.empty(growable: true);
      section.Specs!.addAll(sendSpecificationsList);
      sectionsList.add(section);
    }

    sendProduct.value.Sections = List<SectionOfInsertProductRequestDtoUseCase>.empty(growable: true);
    sendProduct.value.Sections!.addAll(sectionsList);

    sendProduct.value.Sections!.forEach((element) {
      LogHelper.printLog(data: "element: ${element.SpecId}");

      element.Specs!.forEach((element2) {
        LogHelper.printLog(data: "element 2: ${element2.InputType}");

        LogHelper.printLog(data: "Value: ${element2.Value}");
      });
    });

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
      var uploadCheck = picture.IsUploaded == false;

      if (uploadCheck) {
        await startApiInsertProductPicture(insertProductPictureRequestDtoUseCase: picture);
      }
    }

    for (var pic in picturesList) {
      // Conditions
      var uploadCheck = pic.IsUploaded == false;

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

  startApiInsertProduct() async {
    updateLoading(isLoading: true);
    await iInsertProductUseCase.Handler(params: sendProduct.value).then((response) {
      var result = response.getOrElse(() => InsertProductResponseDtoUseCase());
      this.productId.value = result.ProductId ?? "";

      this.picturesList.clear();
      var mainImageName = Uuid().v4();
      InsertProductPictureRequestDtoUseCase mainPicture = InsertProductPictureRequestDtoUseCase(
        Sort: 0,
        IsMain: true,
        IsUploaded: false,
        PickedFile: this.image.value.pickedFile,
        Id: mainImageName,
        ProductId: this.productId.value,
      );
      picturesList.add(mainPicture);

      var picSort = 1;
      for (var image in imagesList) {
        var name = Uuid().v4();
        InsertProductPictureRequestDtoUseCase picture = InsertProductPictureRequestDtoUseCase(
          Sort: picSort,
          IsMain: false,
          IsUploaded: false,
          PickedFile: image.pickedFile,
          Id: name,
          ProductId: this.productId.value,
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
    await iInsertProductPictureUseCase.Handler(params: insertProductPictureRequestDtoUseCase).then((response) {
      for (var pic in picturesList) {
        if (pic.Id!.toLowerCase() == insertProductPictureRequestDtoUseCase.Id!.toLowerCase()) {
          pic.IsUploaded = true;
        }
      }
    }).catchError((error) {
      updateLoading(isLoading: false);
      cancelToken.cancel("cancelled");
      LogHelper.printLog(data: error, logHelperType: LogHelperType.ERROR);
    });
  }
}
