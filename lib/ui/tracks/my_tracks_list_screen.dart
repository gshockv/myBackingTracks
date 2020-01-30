import 'package:flutter/material.dart';
import 'package:mybackingtracks/ui/add_record_mixin.dart';

class MyTracksListScreen extends StatefulWidget with CanAddNewRecord {
  @override
  State<StatefulWidget> createState() {
    return _MyTracksListScreenState();
  }

  @override
  void addRecord() {
    print("Add new backing track record...");
  }
}

class _MyTracksListScreenState extends State<MyTracksListScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "My Tracks...",
        style: TextStyle(
          color: Colors.deepOrange[400],
          fontSize: 28
        ),
      ),
    );
  }
}
