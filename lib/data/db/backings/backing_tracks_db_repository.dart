import 'package:mybackingtracks/data/db/backings/backing_tracks_repository.dart';
import 'package:mybackingtracks/data/db/db_provider.dart';
import 'package:mybackingtracks/data/db/wishlist/wish_list_dao.dart';
import 'package:mybackingtracks/data/model/backing_track.dart';

class BackingTracksDbRepository implements BackingTracksRepository {
  final _dao = WishListDao();

  @override
  DatabaseProvider databaseProvider = DatabaseProvider();

  @override
  Future<List<BackingTrack>> backingTracks() async {
    final db = await databaseProvider.db();
    final maps = await db.query(_dao.tableName);
    return _dao.fromList(maps);
  }

  @override
  Future<BackingTrack> insert(BackingTrack track) async {
    final db = await databaseProvider.db();
    track.id = await db.insert(
      _dao.tableName, 
      _dao.toMap(track)
    );
    return track;
  }

  @override
  Future<BackingTrack> update(BackingTrack track) async {
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
  Future<BackingTrack> delete(BackingTrack track) async {
    final db = await databaseProvider.db();
    await db.delete(
      _dao.tableName,
      where: _dao.columnId + " = ?",
      whereArgs: [track.id]
    );
    return track;
  }
}
