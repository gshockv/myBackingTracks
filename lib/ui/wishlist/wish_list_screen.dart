import 'package:flutter/material.dart';
import 'package:mybackingtracks/ui/add_record_mixin.dart';

class WishListScreen extends StatefulWidget with CanAddNewRecord {
  @override
  State<StatefulWidget> createState() {
    return _WishListScreenState();
  }

  @override
  void addRecord() {
    print("Add record to Wish List...");
  }
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Wish List...",
        style: TextStyle(
          color: Colors.lightGreen[400],
          fontSize: 28
        ),
      ),
    );
  }

}
