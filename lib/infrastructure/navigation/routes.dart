import 'package:hojre_shop_app/domain/core/helpers/brain.dart';

class Routes {
  static Future<String> get initialRoute async {
    // TODO: implement method
    return Brain.checkUser() ? HOME : LOGIN;
  }

  static const ADD_PRODUCT = '$PRODUCT_MANAGER/add-product';
  static const ADD_PRODUCT_SPECIFICATIONS = '/add-product-specifications';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const PRODUCT_DESIGN_MANAGER = '/product-design-manager';
  static const PRODUCT_MANAGER = '/product-manager';
  static const PHOTO_EDIT = '/photo-edit';
}
