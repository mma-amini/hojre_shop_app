import 'package:flutter/material.dart';

import '../../../generated/assets.dart';

class ImageLogoWidget extends StatelessWidget {
  const ImageLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesHojreShopManagementLogo,
      height: 120.0,
    );
  }
}
