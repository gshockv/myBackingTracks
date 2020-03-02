
import 'package:flutter/material.dart';
import 'package:mybackingtracks/data/db/wishlist/wish_list_db_repository.dart';
import 'package:mybackingtracks/data/db/wishlist/wish_list_repository.dart';
import 'package:mybackingtracks/data/model/track.dart';

class WishListModel extends ChangeNotifier {
  WishListRepository _repository;

  Future<List<Track>> get wishList => _loadWishList();

  WishListModel() {
    _repository = WishListDatabaseRepository();
  }

  Future<void> addTrackToWishList(Track track) async {
    await _repository.insert(track);
    notifyListeners();
  }

  Future<void> removeTrackFromWishList(Track track) async {
    await _repository.delete(track);
    notifyListeners();
  }

  Future<void> updateTrackInWishList(Track track) async {
    await _repository.update(track);
    notifyListeners();
  }

  Future<List<Track>> _loadWishList() async {
    return await _repository.getWishList();
  }
}
