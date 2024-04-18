import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SchoolDb {
  static Future<Database> openDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'development.sqlite3'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY)',
        );
      },
      version: 1,
    );
  }
}