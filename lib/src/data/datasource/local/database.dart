import 'dart:io';
import 'package:love_app/src/domain/models/config_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class DatabaseLocal {
  Future<Database> init() async {
    // Todo: get directory.
    Directory getDirectory = await getApplicationDocumentsDirectory();

    // Todo: create database.
    final path = join(getDirectory.path, 'LoveApp.db');

    // 25
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE Config(
            name TEXT NOT NULL
            ,message TEXT NOT NULL
            ,isWomen BOOLEAN NOT NULL
          )
        ''');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        if (oldVersion < newVersion) {
          await db.execute('''
            DROP TABLE IF EXISTS Config
          ''');

          await db.execute('''
          CREATE TABLE Config(
            name TEXT NOT NULL
            ,message TEXT NOT NULL
            ,isWomen BOOLEAN NOT NULL
          )
        ''');
        }
      },
    );
  }

  Future<int> insert(ConfigModel data) async {
    final db = await init();
    return await db.insert('Config', data.toJson());
  }

  Future<List<ConfigModel>> get() async {
    final db = await init();
    final resp = await db.query('Config');
    return resp.map((e) => ConfigModel.fromJsonDb(e)).toList();
  }

  Future<int> delete() async {
    final db = await init();
    return await db.delete('Config');
  }
}
