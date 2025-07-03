import 'package:sqflite_sqlcipher/sqflite.dart';

import '../../domain/entities/book_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;

  DatabaseHelper._instance() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._instance();

  static Database? _database;

  Future<Database?> get database async {
    _database ??= await _initDb();
    return _database;
  }

  static const String _tblLiked = 'liked';
  static const String _tblCache = 'cache';

  Future<Database> _initDb() async {
    final path = await getDatabasesPath();
    final databasePath = '$path/book_catalogue.db';

    var db = await openDatabase(
      databasePath,
      version: 1,
      onCreate: _onCreate,
      password: 'book catalogue centauryal',
    );
    return db;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE  $_tblLiked (
        id INTEGER PRIMARY KEY,
        title TEXT,
        authors TEXT,
        summaries TEXT
      );
    ''');
    await db.execute('''
      CREATE TABLE $_tblCache (
        id INTEGER PRIMARY KEY,
        title TEXT,
        authors TEXT,
        summaries TEXT
      );
    ''');
  }

  Future<void> insertCacheTransaction(List<BookModel> books) async {
    final db = await database;
    db?.transaction((txn) async {
      for (final book in books) {
        final movieJson = book.toMap();
        txn.insert(_tblCache, movieJson);
      }
    });
  }

  Future<List<Map<String, dynamic>>> getCacheBooks() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblCache);

    return results;
  }

  Future<int> clearCache() async {
    final db = await database;
    return await db!.delete(_tblCache);
  }

  Future<int> insertLiked(BookModel book) async {
    final db = await database;
    return await db!.insert(_tblLiked, book.toMap());
  }

  Future<int> removeLiked(BookModel book) async {
    final db = await database;
    return await db!.delete(_tblLiked, where: 'id = ?', whereArgs: [book.id]);
  }

  Future<Map<String, dynamic>?> getLikedById(int id) async {
    final db = await database;
    final results = await db!.query(
      _tblLiked,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (results.isNotEmpty) {
      return results.first;
    } else {
      return null;
    }
  }

  Future<List<Map<String, dynamic>>> getLikedBooks() async {
    final db = await database;
    final List<Map<String, dynamic>> results = await db!.query(_tblLiked);

    return results;
  }
}
