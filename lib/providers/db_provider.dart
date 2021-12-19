import 'dart:io';
import 'package:todo_mock/models/character_model.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'character_manager.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Character('
          'id INTEGER PRIMARY KEY,'
          'name TEXT,'
          'titan TEXT,'
          'affiliation TEXT,'
          'residence TEXT'
          ')');
    });
  }

  // Insert employee on database
  createCharacter(Character newCharacter) async {
    await deleteAllCharacters();
    final db = await database;
    final res = await db?.insert('Character', newCharacter.toJson());

    return res;
  }

  // Delete all employees
  Future<int> deleteAllCharacters() async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM Character');

    return res;
  }

  Future<List<Character>> getAllCharacters() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM CHARACTER");

    List<Character> list =
        res.isNotEmpty ? res.map((c) => Character.fromJson(c)).toList() : [];

    return list;
  }
}
