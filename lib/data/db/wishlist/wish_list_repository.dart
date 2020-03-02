import 'dart:async';
import 'package:mybackingtracks/data/db/db_provider.dart';
import 'package:mybackingtracks/data/model/track.dart';

abstract class WishListRepository {
  DatabaseProvider databaseProvider;

  Future<Track> insert(Track track);
  Future<Track> update(Track track);
  Future<Track> delete(Track track);
  Future<List<Track>> getWishList();
}
