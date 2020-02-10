
import 'package:mybackingtracks/data/track.dart';

extension TrackDbMethods on Track {
  Map<String, dynamic> toMap() {
    return {
      "id" : id,
      "artist": artist,
      "title" : title,
      "album_cover" : albumCover
    };
  }
}
