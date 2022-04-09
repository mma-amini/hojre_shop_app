import 'package:hojre_shop_app/domain/core/helpers/brain.dart';

class Routes {
  static Future<String> get initialRoute async {
    // TODO: implement method
    return Brain.checkUser() ? HOME : LOGIN;
  }

  static const HOME = '/home';
  static const LOGIN = '/login';
}
