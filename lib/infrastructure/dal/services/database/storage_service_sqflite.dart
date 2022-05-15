import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'storage_service.dart';
import 'storage_service_tables.dart';

class StorageServiceSqflite extends StorageService {
  @override
  Future insert({required Map<dynamic, dynamic> data, required StorageServiceTables storageServiceTables}) async {
    Database db = await DatabaseHelper.instance.database;
    await db.rawDelete(
        "INSERT INTO ${DatabaseHelper.table} (${DatabaseHelper.property}, ${DatabaseHelper.record}, ${DatabaseHelper.value} VALUES (?, ?, ?)",
        [storageServiceTables.name, storageServiceTables.name, jsonEncode(data)]);
  }

  @override
  Future deleteByProperty(StorageServiceTables storageServiceTables) async {
    Database db = await DatabaseHelper.instance.database;

    await db.rawDelete(
        "DELETE FROM ${DatabaseHelper.table} WHERE ${DatabaseHelper.property} = ?", [storageServiceTables.name]);
  }

  @override
  Future<Map?> getByProperty(StorageServiceTables storageServiceTables) async {
    Database db = await DatabaseHelper.instance.database;
    List<Map<String, Object?>>? data;

    await db.rawQuery(
        "SELECT ${DatabaseHelper.value} FROM ${DatabaseHelper.table} WHERE ${DatabaseHelper.property} = ? LIMIT ?",
        [storageServiceTables.name, 1]).then((value) {
      data = value;
    });

    if (data != null && data!.isNotEmpty) {
      var map = jsonDecode(data![0][DatabaseHelper.value].toString());
      return map;
    }
    return null;
  }

  @override
  Future<Map?> futureGetData({required StorageServiceTables storageServiceTables}) async {
    return await getByProperty(storageServiceTables);
  }
}

class DatabaseHelper {
  static const _databaseName = "alpha.db";
  static const _databaseVersion = 1;

  static const table = 'main_table';

  static const id = 'id';
  static const property = 'property';
  static const record = 'record';
  static const value = 'value';

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE $table ($id INTEGER PRIMARY KEY, $property TEXT, $record TEXT, $value TEXT)");
  }
}
