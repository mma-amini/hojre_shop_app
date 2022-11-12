import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';

class TextPleaseLoginWidget extends StatelessWidget {
  const TextPleaseLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.screen_login_please_login.tr,
      style: const TextStyle(
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }
}
