import 'package:clean_arc_flutter/data/infrastructures/db_service_interface.dart';
import 'package:sqflite/sqlite_api.dart';

class DBService extends DBServiceInterface {
  Database _database;

  DBService(Future<Database> database) {
    database.then((db) {
      _database = db;
    });
  }

  Future<int> insert(String sql, List<dynamic> arguments) async {
    return await _database.rawInsert(sql, arguments);
  }

  Future<int> update(String sql, List<dynamic> arguments) async {
    return await _database.rawUpdate(sql, arguments);
  }

  Future<int> delete(String sql, List<dynamic> arguments) async {
    return await _database.rawDelete(sql, arguments);
  }

  Future<List<Map>> select(String sql, List<dynamic> arguments) async {
    return await _database.rawQuery(sql, arguments);
  }

}