import 'package:flutter/material.dart';
import 'package:mybackingtracks/ui/app_colors.dart';

class BackingTracksListScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BackingTracksListScreenState();
  }
}

class _BackingTracksListScreenState extends State<BackingTracksListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: Container(
        decoration: _createGradientWindowBackground(),
        child: Center(
          child: Text(
            "My Backing Tracks...",
            style: TextStyle(fontSize: 36, color: Colors.red, fontWeight: FontWeight.w200),
          ),
        ),
      ),
    );
  }

  Widget _createAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(AppColors.primaryDarkColor),
      title: Text(
        "My BackingTracks",
        style: TextStyle(
          color: Color(AppColors.appBarPrimaryColor),
          fontWeight: FontWeight.w500,
          fontSize: 26
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.add, 
            color: Color(AppColors.appBarPrimaryColor)
          ),
          onPressed: () {},
        )
      ],
    );
  }

  Decoration _createGradientWindowBackground() {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: [0.5, 1.0],
        colors: [
          Color(AppColors.primaryDarkColor),
          Color(AppColors.primaryLightColor)
        ]
      )
    );
  }
}
