import 'package:flutter/material.dart';
import 'package:mybackingtracks/ui/tracks_list_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BackingTracksListScreen(),
    );
  }
}
