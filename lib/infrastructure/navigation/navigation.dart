import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../config.dart';
import '../../presentation/screens.dart';
import 'bindings/controllers/controllers_bindings.dart';
import 'routes.dart';

class EnvironmentsBadge extends StatelessWidget {
  final Widget child;
  const EnvironmentsBadge({required this.child, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var env = ConfigEnvironments.getEnvironments()['env'];
    return env != Environments.PRODUCTION
        ? Banner(
            location: BannerLocation.topStart,
            message: env!,
            color: env == Environments.QAS ? Colors.blue : Colors.purple,
            child: child,
          )
        : SizedBox(child: child);
  }
}

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeScreen(),
      binding: HomeControllerBinding(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
      binding: LoginControllerBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT_MANAGER,
      page: () => const ProductManagerScreen(),
      binding: ProductManagerControllerBinding(),
    ),
    GetPage(
      name: Routes.ADD_PRODUCT,
      page: () => const AddProductScreen(),
      binding: AddProductControllerBinding(),
    ),
    GetPage(
      name: Routes.PRODUCT_DESIGN_MANAGER,
      page: () => const ProductDesignManagerScreen(),
      binding: ProductDesignManagerControllerBinding(),
    ),
    GetPage(
      name: Routes.PHOTO_EDIT,
      page: () => const PhotoEditScreen(),
      binding: PhotoEditControllerBinding(),
    ),
    GetPage(
      name: Routes.DEVELOPER,
      page: () => const DeveloperScreen(),
      binding: DeveloperControllerBinding(),
    ),
  ];
}
