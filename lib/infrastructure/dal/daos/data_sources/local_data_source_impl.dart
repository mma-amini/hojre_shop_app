import 'package:hojre_shop_app/domain/core/dto/models/account_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/token_model.dart';
import 'package:hojre_shop_app/domain/core/helpers/brain.dart';
import 'package:hojre_shop_app/infrastructure/dal/services/database/storage_service_tables.dart';

class LocalDataSourceImpl {
  static Future<VMToken?> getToken() async {
    VMToken? token;
    return await Brain.storageService.getByProperty(StorageServiceTables.TABLE_TOKEN).then((value) {
      if (value != null) {
        token = VMToken(
          TokenType: value["TokenType"],
          AccessToken: value["AccessToken"],
          RefreshToken: value["RefreshToken"],
          ExpiresIn: value["ExpiresIn"],
        );
      }
      return token;
    });
  }

  static Future<VMAccount?> getAccount() async {
    VMAccount? account;
    return await Brain.storageService.getByProperty(StorageServiceTables.TABLE_USER).then((value) {
      if (value != null) {
        account = VMAccount(
          UserId: value["UserId"],
          Username: value["Username"],
          FirstName: value["FirstName"],
          LastName: value["LastName"],
          ShopId: value['ShopId'],
          ShopName: value['ShopName'],
        );
      }
      return account;
    });
  }

  static Future<bool> saveToken(VMToken token) async {
    await Brain.storageService
        .insert(data: token.toJson(), storageServiceTables: StorageServiceTables.TABLE_TOKEN)
        .then((value) {
      getToken();
    });
    Brain.token = token;
    return Future.value(true);
  }

  static Future<bool> saveAccount(VMAccount account) async {
    await Brain.storageService.insert(data: account.toJson(), storageServiceTables: StorageServiceTables.TABLE_USER);
    Brain.account = account;
    return Future.value(true);
  }

  static deleteToken() async {
    await Brain.storageService.deleteByProperty(StorageServiceTables.TABLE_TOKEN).then((value) {
      Brain.token = const VMToken();
    });
  }

  static deleteAccount() async {
    await Brain.storageService.deleteByProperty(StorageServiceTables.TABLE_USER).then((value) {
      Brain.account = VMAccount();
    });
  }
}
