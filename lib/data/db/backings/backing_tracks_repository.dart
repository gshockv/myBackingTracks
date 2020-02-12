import 'package:mybackingtracks/data/backing_track.dart';
import 'package:mybackingtracks/data/db/db_provider.dart';

abstract class BakingTracksRepository {
  DatabaseProvider databaseProvider;

  Future<BackingTrack> insert(BackingTrack track);
  Future<BackingTrack> update(BackingTrack track);
  Future<BackingTrack> delete(BackingTrack track);

  Future<List<BackingTrack>> bakingsTracks();
}
