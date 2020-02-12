import 'package:mybackingtracks/data/track.dart';

class BackingTrack extends Track {
  String localFilePath;
  bool learnt;

  BackingTrack({this.localFilePath, this.learnt}) : super();
}
