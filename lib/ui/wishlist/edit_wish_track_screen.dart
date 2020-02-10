import 'package:flutter/material.dart';
import 'package:mybackingtracks/data/track.dart';
import 'package:mybackingtracks/data/wishlist_model.dart';
import 'package:mybackingtracks/ui/circle_asset_image.dart';
import 'package:mybackingtracks/ui/utils/app_colors.dart';
import 'package:mybackingtracks/ui/utils/ui_utils.dart';
import 'package:provider/provider.dart';

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

    if (isEditExistingTrack) {
      artistController.text = widget.track.artist;
      trackController.text = widget.track.title;
    }
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
            _createButtons()
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
                    hintText: "Artist"),
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

  Widget _createButtons() {
    return Row(
      children: <Widget>[
        Expanded(
            child: isEditExistingTrack
                ? Align(
                    alignment: Alignment.bottomLeft,
                    child: RaisedButton(
                        color: Colors.red,
                        child: Text("Delete"),
                        onPressed: () { 
                          _tryToRemoveTrack();
                        }
                    ),
                  )
                : Text("")),
        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: RaisedButton(
              child: Text("Save"),
              onPressed: _saveTrack,
            ),
          ),
        ),
      ],
    );
  }

  _saveTrack() async {
    final String artist = artistController.text;
    final String title = trackController.text;

    final dataModel = Provider.of<WishListModel>(context, listen: false);

    if (artist.isNotEmpty && title.isNotEmpty) {
      print("Save Track [$artist : $title]");
      if (isEditExistingTrack) {
        final Track track = widget.track;
        track.artist = artist;
        track.title = title;

        await dataModel.updateTrackInWishList(track);
      } else {
        final Track track = Track();
        track.artist = artist;
        track.title = title;

        await dataModel.addTrackToWishList(track);
      }

      Navigator.pop(context);
    } else {
      print("Track info fields are empty: [$artist : $title]");
    }
  }

  _tryToRemoveTrack() {
    final confirmAlert = AlertDialog(
      title: Text("WishList"),
      content: Text("Remove this track from Wish List?"),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          }, 
          child: Text("CANCEL")
        ),
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            _removeTrack();
          },
          child: Text("REMOVE"),
        )
      ],
    );
    showDialog(
      context: context,
      builder: (context) {
        return confirmAlert;
      }
    );
  }

  _removeTrack() async {
    await Provider.of<WishListModel>(context, listen: false).removeTrackFromWishList(widget.track);
    Navigator.pop(context);
  }
}
