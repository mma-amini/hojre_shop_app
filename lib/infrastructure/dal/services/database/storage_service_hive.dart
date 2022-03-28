import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hojre_shop_app/infrastructure/dal/services/database/storage_service_tables.dart';

import 'storage_service.dart';

part 'storage_service_hive.g.dart';

@HiveType(typeId: 0)
class VMDatabase extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String? property;

  @HiveField(2)
  String? record;

  @HiveField(3)
  String? value;
}

class StorageServiceHive extends StorageService {
  static var dbBoxName = "alphaBox";

  @override
  Future insert({required Map<dynamic, dynamic> data, required StorageServiceTables storageServiceTables}) async {
    var vmDatabase = VMDatabase();
    vmDatabase.property = storageServiceTables.name;
    vmDatabase.record = storageServiceTables.name;
    vmDatabase.value = jsonEncode(data);
    var box = await Hive.openBox<VMDatabase>(dbBoxName);
    box.put(storageServiceTables.name, vmDatabase);
  }

  @override
  Future deleteByProperty(StorageServiceTables storageServiceTables) async {
    var box = await Hive.openBox<VMDatabase>(dbBoxName);
    await box.delete(storageServiceTables.name);
  }

  @override
  Future<Map?> getByProperty(StorageServiceTables storageServiceTables) async {
    await Hive.openBox<VMDatabase>(dbBoxName);
    var box = Hive.box<VMDatabase>(dbBoxName);
    var data = box.get(storageServiceTables.name);
    if (data != null) {
      var map = jsonDecode(data.value!);
      return map;
    }
    return null;
  }

  @override
  Future<Map?> futureGetData({required StorageServiceTables storageServiceTables}) async {
    return await getByProperty(storageServiceTables);
  }
}
