import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojre_shop_app/domain/core/helpers/brain.dart';

class DeveloperController extends GetxController {
  TextEditingController domainTextController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    domainTextController.text = Brain.baseDomain;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  updateDomain() {
    Brain.baseDomain = domainTextController.text;
  }
}
