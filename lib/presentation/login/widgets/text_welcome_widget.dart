import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';

class TextWelcomeWidget extends StatelessWidget {
  const TextWelcomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      LocaleKeys.screen_login_welcome.tr,
      style: const TextStyle(
        fontFamily: 'Vazir Med',
        fontSize: 24.0,
        color: Colors.white,
      ),
    );
  }
}
