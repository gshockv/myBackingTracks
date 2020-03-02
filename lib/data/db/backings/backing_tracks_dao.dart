import 'package:mybackingtracks/data/db/dao.dart';
import 'package:mybackingtracks/data/model/backing_track.dart';

class BackingTracksDao implements Dao<BackingTrack> {
  final columnId = "id";
  final _columnArtist = "artist";
  final _columnTitle = "title";
  final _columnAlbumCover = "album_cover";
  final _columnLocalFilePath = "local_file_path";
  final _columnLearnt = "learnt";

  @override
  String get tableName => "backing_tracks";

  @override
  String get createTableQuery => 
    "CREATE TABLE $tableName($columnId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, "
    "$_columnArtist TEXT NOT NULL, "
    "$_columnTitle TEXT NOT NULL, "
    "$_columnLocalFilePath TEXT NOT NULL, "
    "$_columnAlbumCover TEXT, "
    "$_columnLearnt INTEGER DEFAULT 0)";

  @override
  List<BackingTrack> fromList(List<Map<String, dynamic>> query) {
    final tracks = List<BackingTrack>();
    for (Map map in query) {
      tracks.add(fromMap(map));
    }
    return tracks;
  }

  @override
  BackingTrack fromMap(Map<String, dynamic> query) {
    final track = BackingTrack();
    track.id = query[columnId];
    track.artist = query[_columnArtist];
    track.title = query[_columnTitle];
    track.localFilePath = query[_columnLocalFilePath];
    track.albumCover = query[_columnAlbumCover];
    track.learnt = query[_columnLearnt] == 1;
    return track;
  }

  @override
  Map<String, dynamic> toMap(BackingTrack track) {
    return <String, dynamic>{
      _columnArtist: track.artist,
      _columnTitle: track.title,
      _columnLocalFilePath: track.localFilePath,
      _columnAlbumCover: track.albumCover,
      _columnLearnt: track.learnt ? 1 : 0
    };
  }
}
