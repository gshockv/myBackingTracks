import 'package:flutter/material.dart';
import 'package:mybackingtracks/ui/add_record_mixin.dart';
import 'package:mybackingtracks/ui/wishlist/edit_wish_track_screen.dart';

class WishListScreen extends StatelessWidget with CanAddNewRecord {
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Wish List...",
        style: TextStyle(color: Colors.lightGreen[400], fontSize: 28),
      ),
    );
  }
}
