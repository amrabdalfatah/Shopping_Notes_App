import 'package:sqflite/sqflite.dart';

class ShoppingDatabase {
  // 1- create Database
  // 2- create Tables
  // 3- open Database
  // 4- Insert Into Database
  // 5- Get from Database
  // 6- Update on Database
  // 7- Delete Database
  Database? database;

  Future<Database> openDB() async {
    if (database == null) {
      database = await openDatabase(
        'shopping.db',
        version: 1,
        onCreate: (database, version) {
          print('Database created');
          database.execute(
              'CREATE TABLE list(id INTEGER PRIMARY KEY, name TEXT, priority INTEGER)');
          database.execute(
              'CREATE TABLE items(id INTEGER PRIMARY KEY, idList INTEGER, name TEXT, quantity TEXT, note TEXT)');
          print('Table Created');
        },
        onOpen: (database) {
          print('Database Opened');
        },
      );
    }
    return database!;
  }
}
