import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;
import 'package:sqflite/sqlite_api.dart';

class DBHelper {

  static const String _dbName = "places.db";
  static const int _dbVersion = 1;

  // Opens or creates the DB
  static Future<Database> _openDb() async {
    String dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath, _dbName),
      version: _dbVersion,
      onCreate: (db, version) {
        return db.execute(
          """
            CREATE TABLE user_places(
              id TEXT PRIMARY KEY,
              title TEXT,
              image TEXT
            )
          """
        );
      }
    );
  }

  static Future<void> insert (String table, Map<String, Object> data) async {
    final Database sqlDb = await DBHelper._openDb();

    sqlDb.insert(
      table, 
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final Database sqlDb = await DBHelper._openDb();

    return sqlDb.query(
      table
    );
  }

}