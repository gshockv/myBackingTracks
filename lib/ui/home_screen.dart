import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybackingtracks/ui/add_record_mixin.dart';
import 'package:mybackingtracks/ui/tracks/my_tracks_list_screen.dart';
import 'package:mybackingtracks/ui/wishlist/wish_list_screen.dart';

import 'utils/app_colors.dart';
import 'utils/ui_utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  final List<CanAddNewRecord> _pages = [
    MyTracksListScreen(),
    WishListScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: Container(
        //color: Color(AppColors.primaryDarkColor),
        decoration: UiUtils.createDarkGradientBackground(),
        child: Center(
          child: _pages[_selectedPageIndex],
        ),
      ),
      bottomNavigationBar: _createBottomNavigationBar(),
    );
  }

  Widget _createAppBar() {
    return AppBar(
      elevation: 1,
      backgroundColor: Color(AppColors.primaryDarkColor),
      title: RichText(
        text: TextSpan(
          text: "My",
          style: GoogleFonts.raleway(
              fontSize: 25,
              //fontStyle: FontStyle.italic,
              //color: Color(AppColors.appBarPrimaryColor),
              color: Colors.deepOrange[600],
              fontWeight: FontWeight.w500,
              letterSpacing: 0.8
          ),
          children: [
            TextSpan(
              text: " BackingTracks",
              style: GoogleFonts.raleway(
                  fontSize: 25,
                  //fontStyle: FontStyle.italic,
                  //color: Color(AppColors.appBarPrimaryColor),
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.8
              ),
            )
          ]
        )
      ),
      actions: <Widget>[
        IconButton(
          iconSize: 32,
          icon: Icon(
            Icons.add, 
            color: Color(AppColors.appBarActionColor)
          ),
          onPressed: _onAddRecordClick,
        )
      ],
    );
  }

  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedPageIndex,

      backgroundColor: Color(AppColors.primaryLightColor),
      selectedItemColor: Colors.deepOrange[600],
      unselectedItemColor: Colors.white,
      
      iconSize: 32,
      //elevation: 12,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.tap_and_play),
          title: Text("My Tracks")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.playlist_add_check),
          title: Text("Wish List")
        )
      ],

      onTap: _onPageSelected,
    );
  }
  
  _onPageSelected(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  _onAddRecordClick() {
    _pages[_selectedPageIndex].addRecord(context);
  }
}
