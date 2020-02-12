import 'package:mybackingtracks/data/db/db_provider.dart';
import 'package:mybackingtracks/data/db/wishlist/wish_list_dao.dart';
import 'package:mybackingtracks/data/db/wishlist/wish_list_repository.dart';
import 'package:mybackingtracks/data/track.dart';

class WishListDatabaseRepository implements WishListRepository {
  final _dao = WishListDao();

  @override
  DatabaseProvider databaseProvider = DatabaseProvider();

  @override
  Future<Track> insert(Track track) async {
    final db = await databaseProvider.db();
    track.id = await db.insert(
      _dao.tableName,
      _dao.toMap(track)
    );
    return track;
  }

  @override
  Future<Track> update(Track track) async {
    final db = await databaseProvider.db();
    await db.update(
      _dao.tableName,
      _dao.toMap(track),
      where: _dao.columnId + " = ?",
      whereArgs: [track.id]
    );
    return track;
  }

  @override
  Future<Track> delete(Track track) async {
    final db = await databaseProvider.db();
    await db.delete(
      _dao.tableName,
      where: _dao.columnId + " = ?",
      whereArgs: [track.id]
    );
    return track;
  }

  @override
  Future<List<Track>> getWishList() async {
    final db = await databaseProvider.db();
    final maps = await db.query(_dao.tableName);
    return _dao.fromList(maps);
  }
}
