import 'package:hojre_shop_app/domain/core/dto/models/account_model.dart';
import 'package:hojre_shop_app/domain/core/dto/models/token_model.dart';
import 'package:hojre_shop_app/domain/core/helpers/brain.dart';
import 'package:hojre_shop_app/infrastructure/dal/services/database/storage_service_tables.dart';

class LocalDataSourceImpl {
  static Future<VMToken?> getToken() async {
    VMToken? token;
    return await Brain.storageService.getByProperty(StorageServiceTables.tableToken).then((value) {
      if (value != null) {
        token = VMToken(
          tokenType: value["tokenType"],
          accessToken: value["accessToken"],
          refreshToken: value["refreshToken"],
          expiresIn: value["expiresIn"],
        );
      }
      return token;
    });
  }

  static Future<VMAccount?> getAccount() async {
    VMAccount? account;
    return await Brain.storageService.getByProperty(StorageServiceTables.tableUser).then((value) {
      if (value != null) {
        account = VMAccount(
          userId: value["userId"],
          username: value["username"],
          firstName: value["firstName"],
          lastName: value["lastName"],
          shopId: value['shopId'],
          shopName: value['shopName'],
          clientSecret: value['clientSecret'],
        );
      }
      return account;
    });
  }

  static Future<bool> saveToken(VMToken token) async {
    await Brain.storageService
        .insert(data: token.toJson(), storageServiceTables: StorageServiceTables.tableToken)
        .then((value) {
      getToken();
    });
    Brain.token = token;
    return Future.value(true);
  }

  static Future<bool> saveAccount(VMAccount account) async {
    await Brain.storageService.insert(data: account.toJson(), storageServiceTables: StorageServiceTables.tableUser);
    Brain.account = account;
    return Future.value(true);
  }

  static deleteToken() async {
    await Brain.storageService.deleteByProperty(StorageServiceTables.tableToken).then((value) {
      Brain.token = const VMToken();
    });
  }

  static deleteAccount() async {
    await Brain.storageService.deleteByProperty(StorageServiceTables.tableUser).then((value) {
      Brain.account = VMAccount();
    });
  }
}
