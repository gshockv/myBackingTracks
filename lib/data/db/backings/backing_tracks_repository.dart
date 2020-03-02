import 'package:mybackingtracks/data/db/db_provider.dart';
import 'package:mybackingtracks/data/model/backing_track.dart';

abstract class BackingTracksRepository {
  DatabaseProvider databaseProvider;

  Future<BackingTrack> insert(BackingTrack track);
  Future<BackingTrack> update(BackingTrack track);
  Future<BackingTrack> delete(BackingTrack track);

  Future<List<BackingTrack>> backingTracks();
}
