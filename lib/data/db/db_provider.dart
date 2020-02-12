import 'package:mybackingtracks/data/db/wishlist/wish_list_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const _DB_NAME = 'backing_tracks.db';
  static const _DB_VERSION = 1;

  static final DatabaseProvider _instance = DatabaseProvider._();
  DatabaseProvider._();

  factory DatabaseProvider() => _instance;

  Database _database;
  
  Future<Database> db() async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), _DB_NAME), 
      version: _DB_VERSION,

      onCreate: (db, version) {
        return db.execute(WishListDao().createTableQuery);
      }
    );
  }
}
