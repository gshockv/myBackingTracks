import 'package:flutter/material.dart';
import 'package:mybackingtracks/data/db/backings/backing_tracks_db_repository.dart';
import 'package:mybackingtracks/data/db/backings/backing_tracks_repository.dart';
import 'package:mybackingtracks/data/model/backing_track.dart';

class BakingTracksModel extends ChangeNotifier {
  BackingTracksRepository _repository;

  Future<List<BackingTrack>> get backingTracks => _loadBackingTracks();

  BakingTracksModel() {
    _repository = BackingTracksDbRepository();
  }

  Future<void> addBackingTrack(BackingTrack track) async {
    await _repository.insert(track);
    notifyListeners();
  }

  Future<void> updateBackingTrack(BackingTrack track) async {
    await _repository.update(track);
    notifyListeners();
  }

  Future<void> deleteBackingTrack(BackingTrack track) async {
    await _repository.delete(track);
    notifyListeners();
  }

  Future<void> markTrackIsLearnt(BackingTrack track, bool isLearnt) async {
    track.learnt = isLearnt;
    await updateBackingTrack(track);
    notifyListeners();
  }

  Future<List<BackingTrack>> _loadBackingTracks() async {
    return await _repository.backingTracks();
  }
}
