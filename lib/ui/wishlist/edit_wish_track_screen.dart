import 'package:flutter/material.dart';
import 'package:mybackingtracks/data/model/track.dart';
import 'package:mybackingtracks/ui/circle_asset_image.dart';
import 'package:mybackingtracks/ui/utils/app_colors.dart';
import 'package:mybackingtracks/ui/utils/ui_utils.dart';

class EditWishTrackScreen extends StatefulWidget {
  final Track track;

  EditWishTrackScreen({Key key, this.track}) : super(key: key);

  @override
  _EditWishTrackScreenState createState() => _EditWishTrackScreenState();
}

class _EditWishTrackScreenState extends State<EditWishTrackScreen> {
  bool isEditExistingTrack = false;

  final artistController = TextEditingController();
  final trackController = TextEditingController();

  @override
  void initState() {
    super.initState();
    isEditExistingTrack = widget.track != null;
  }

  @override
  void dispose() {
    artistController.dispose();
    trackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: _createContent(),
    );
  }

  _createAppBar() => AppBar(
        backgroundColor: Color(AppColors.primaryDarkColor),
        title: Text(isEditExistingTrack ? "Edit Track" : "Add Track"),
      );

  _createContent() => Container(
      decoration: UiUtils.createDarkGradientBackground(),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _createEditControls(),
            SizedBox(height: 16.0),
            Divider(
              color: Color(AppColors.hrColor),
            ),
            _createSaveButton()
          ],
        ),
      ));

  Widget _createEditControls() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CircleAssetImage(
          imageAssetPath: "graphics/default_album_cover.jpg",
        ),
        SizedBox(width: 16.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextField(
                controller: artistController,
                decoration: InputDecoration(
                    labelText: "Artist",
                    labelStyle: TextStyle(color: Colors.deepOrange),
                    hintText: "Artist"
                ),
              ),
              TextField(
                controller: trackController,
                decoration: InputDecoration(
                  labelText: "Track Title",
                  labelStyle: TextStyle(color: Colors.deepOrange),
                  hintText: "Track title",
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _createSaveButton() {
    return Align(
      alignment: Alignment.bottomRight,
      child: RaisedButton(
        child: Text("Save"),
        onPressed: _saveTrack,
      ),
    );
  }

  _saveTrack() {
    final String artist = artistController.text;
    final String track = trackController.text;

    if (artist.isNotEmpty && track.isNotEmpty) {
      print("Save Track [$artist : $track]");
    } else {
      print("Track info fields are empty: [$artist : $track]");
    }
  }
}
