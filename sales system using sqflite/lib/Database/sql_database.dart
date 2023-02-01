import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initiateDb();
    return _db;
  }

  initiateDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'myDb.db');
    Database myDb = await openDatabase(path,
        onCreate: _onCreate, version: 2, onUpgrade: _onUpgrade);
    return myDb;
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    await db.execute('''
        CREATE TABLE 'finishedProducts' (
        'id' INTEGER PRIMARY KEY, 
        'cat' TEXT,
        'name' TEXT,
        'price' INTEGER
      )
      ''');
    // await db.execute('''
    //     ALTER TABLE 'products' ADD img TEXT
    //   ''');
    print('onUpgrade==============================');
  }

  insertTheFirstUser() async {
    Database? mydb = await db;
    int response = await insert("users", {
      "name": 'default',
      "salary": 00,
      "email": 'email@gmail.com',
      "password": 'password',
      "access": 'admin',
    });
    print('insertThefirstUser');
    if (response > 0) {
      print('first user inserted successfully!');
    }
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
      CREATE TABLE 'products' (
        'id' INTEGER PRIMARY KEY, 
        'cat' TEXT,
        'name' TEXT,
        'price' INTEGER,
        'initialAmount' INTEGER,
        'description' TEXT,
        'img' TEXT
      )
    ''');
    batch.execute('''
      CREATE TABLE 'users' (
        'id' INTEGER PRIMARY KEY,
        'name' TEXT,
        'salary' INTEGER,
        'email' TEXT,
        'password' TEXT,
        'access' TEXT
      )
    ''');
    await batch.commit();
    print('onCreate==============================');
    // await insertTheFirstUser();
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  insert(
    String table,
    Map<String, Object?> values,
  ) async {
    Database? mydb = await db;
    int response = await mydb!.insert(table, values);
    return response;
  }

  update(
    String table,
    Map<String, Object?> values,
  ) async {
    Database? mydb = await db;
    int response = await mydb!.update(table, values);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }
}
