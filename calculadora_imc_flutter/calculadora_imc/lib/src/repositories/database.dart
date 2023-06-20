import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

Map<int, String> scripts = {
  1: ''' CREATE TABLE imcs (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nome TEXT,
          altura REAL,
          peso REAL,
          imc REAL
          );'''
};

class DataBase {
  static Database? db;
  // verificando se o bd foi iniciado
  Future<Database> getDatabase() async {
    if (db == null) {
      return await iniciarBancoDeDados();
    } else {
      return db!;
    }
  }

  // Abrindo comexão com o DB e rodando o scripty  de criaçÃO.
  Future<Database> iniciarBancoDeDados() async {
    var db = await openDatabase(
      path.join(await getDatabasesPath(), 'database.db'),
      version: scripts.length,
      onCreate: (Database db, int version) async {
        for (var i = 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
          debugPrint(scripts[i]!);
        }
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) async {
        for (var i = oldVersion + 1; i <= scripts.length; i++) {
          await db.execute(scripts[i]!);
        }
      },
    );
    return db;
  }
}
