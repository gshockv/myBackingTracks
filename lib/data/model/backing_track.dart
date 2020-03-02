
import 'package:mybackingtracks/data/model/track.dart';

class BackingTrack extends Track {
  String localFilePath;
  bool learnt;

  BackingTrack({this.localFilePath, this.learnt}) : super();
}
