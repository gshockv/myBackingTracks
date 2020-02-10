import 'package:flutter/material.dart';
import 'package:mybackingtracks/data/track.dart';
import 'package:mybackingtracks/data/wishlist_model.dart';
import 'package:mybackingtracks/ui/add_record_mixin.dart';
import 'package:mybackingtracks/ui/circle_asset_image.dart';
import 'package:mybackingtracks/ui/wishlist/edit_wish_track_screen.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatefulWidget with CanAddNewRecord {
  @override
  _WishListScreenState createState() => _WishListScreenState();

  @override
  void addRecord(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) {
              return EditWishTrackScreen();
            },
            fullscreenDialog: true));
  }
}

class _WishListScreenState extends State<WishListScreen> {



  @override
  Widget build(BuildContext context) {
    return Consumer<WishListModel>(
      builder: (context, model, child) {
        return FutureBuilder(
          future: model.wishList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _buildLoadingStateUi();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                return _buildWishListView(snapshot);
              } else {
                return _buildEmptyStateUi();
              }
            } else {
              return _buildErrorStateUi();
            }
          },
        );
      },
    );
  }

  Widget _buildWishListView(AsyncSnapshot snapshot) {
    return ListView.separated(
      itemCount: snapshot.data.length,
      itemBuilder: (context, index) {
        Track track = snapshot.data[index];
        return ListTile(
          leading: CircleAssetImage(
            imageAssetPath: "graphics/default_album_cover.jpg",
            width: 52,
            height: 52,
          ),
          title: Text(track.title),
          subtitle: Text(
            track.artist
          ),
          
          onTap: () {
            _openTrackForEdit(track);
          },
        );
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }

  Widget _buildEmptyStateUi() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.hourglass_empty,
            color: Colors.white38,
            size: 76.0,
          ),
          SizedBox(
            height: 24.0,
          ),
          Text(
            "Your Wish List is Empty",
            style: TextStyle(fontSize: 20.0, color: Colors.white60),
          ),
          SizedBox(height: 10.0),
          RaisedButton(
              child: Text("Add new one"),
              onPressed: () {
                widget.addRecord(context);
              })
        ],
      ),
    );
  }

  Widget _buildLoadingStateUi() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  _buildErrorStateUi() => Center(
        child: Text(
          "Error loading Wish List",
          style: TextStyle(color: Colors.red, fontSize: 24),
        ),
      );

  _openTrackForEdit(Track track) {
    print("Open track [${track.artist} : ${track.title}] for edit");

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) {
              return EditWishTrackScreen(track: track);
            },
            fullscreenDialog: true));
  }
}
