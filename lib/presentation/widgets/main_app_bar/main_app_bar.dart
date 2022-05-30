import 'package:flutter/material.dart';

class MainAppBar {
  AppBar init({
    bool? isMainPage = false,
    Function? onBack,
    Widget? title,
    bool? centerTitle = true,
  }) {
    return AppBar(
      title: title,
      centerTitle: centerTitle,
      leading: IconButton(
        onPressed: () {
          onBack!();
        },
        icon: Icon(
          Icons.arrow_back_ios,
        ),
      ),
    );
  }
}
