import 'package:sqflite/sqflite.dart';
import '../models/list_model.dart';
import '../models/item_model.dart';

class ShoppingDatabase {
  // 1- create Database
  // 2- create Tables
  // 3- open Database
  // 4- Insert Into Database
  // 5- Get from Database
  // 6- Delete Database
  Database? database;

  ShoppingDatabase._init();

  factory ShoppingDatabase() {
    return ShoppingDatabase._init();
  }

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

  Future<int> insertList(Lists lists) async {
    int id = await database!.insert(
      'list',
      lists.toMap(),
    );
    return id;
  }

  Future<int> insertItem(Items items) async {
    int id = await database!.insert(
      'items',
      items.toMap(),
    );
    return id;
  }

  Future<List<Lists>> getLists() async {
    final List<Map<String, dynamic>> maps = await database!.query('list');
    return List.generate(
      maps.length,
      (index) => Lists(
        id: maps[index]['id'],
        name: maps[index]['name'],
        priority: maps[index]['priority'],
      ),
    );
  }

  Future<List<Items>> getItems(int idList) async {
    final List<Map<String, dynamic>> maps = await database!.query(
      'items',
      where: 'idList = ?',
      whereArgs: [idList],
    );
    return List.generate(
      maps.length,
      (index) => Items(
        id: maps[index]['id'],
        idList: maps[index]['idList'],
        name: maps[index]['name'],
        quantity: maps[index]['quantity'],
        note: maps[index]['note'],
      ),
    );
  }

  Future<int> deleteList(Lists list) async {
    int result = await database!.delete(
      'items',
      where: 'idList = ?',
      whereArgs: [list.id],
    );
    result = await database!.delete(
      'list',
      where: 'id = ?',
      whereArgs: [list.id],
    );
    return result;
  }
}
