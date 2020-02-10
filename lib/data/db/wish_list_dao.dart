import 'package:mybackingtracks/data/track.dart';

import 'dao.dart';

class WishListDao implements Dao<Track> {
  final tableName = "wish_tracks";
  final columnId = "id";
  final _columnArtist = "artist";
  final _columnTitle = "title";
  final _columnAlbumCover = "album_cover";

  @override
  String get createTableQuery => 
    "CREATE TABLE $tableName($columnId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "
    "$_columnArtist TEXT NOT NULL, "
    "$_columnTitle TEXT NOT NULL, "
    "$_columnAlbumCover TEXT)";

  @override
  List<Track> fromList(List<Map<String, dynamic>> query) {
    final tracks = List<Track>();
    for (Map map in query) {
      tracks.add(fromMap(map));
    }
    return tracks;
  }

  @override
  Track fromMap(Map<String, dynamic> query) {
    final track = Track();
    track.id = query[columnId];
    track.artist = query[_columnArtist];
    track.title = query[_columnTitle];
    track.albumCover = query[_columnAlbumCover];
    return track;
  }

  @override
  Map<String, dynamic> toMap(Track track) {
    return <String, dynamic>{
      _columnArtist: track.artist,
      _columnTitle: track.title,
      _columnAlbumCover: track.albumCover
    };
  }
}