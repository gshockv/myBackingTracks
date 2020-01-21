import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mybackingtracks/ui/app_colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _createAppBar(),
      body: Container(
        color: Color(AppColors.primaryDarkColor),
        //decoration: _createGradientWindowBackground(),
        child: Center(
          child: Container(),
        ),
      ),
      bottomNavigationBar: _createBottomNavigationBar(),
    );
  }

  Widget _createAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(AppColors.primaryDarkColor),
      title: Text(
        "My BackingTracks",
        style: GoogleFonts.raleway(          
          fontSize: 25,
          // fontStyle: FontStyle.italic,
          //color: Color(AppColors.appBarPrimaryColor),
          color: Colors.deepOrange[200],
          fontWeight: FontWeight.w600,
          letterSpacing: 0.8
        ),
      ),
      actions: <Widget>[
        IconButton(
          iconSize: 32,
          icon: Icon(
            Icons.add, 
            color: Color(AppColors.appBarActionColor)
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

  Widget _createBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedPageIndex,

      backgroundColor: Color(AppColors.primaryLightColor),
      selectedItemColor: Colors.deepOrange[400],
      unselectedItemColor: Colors.white,
      iconSize: 38,
      elevation: 12,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.art_track),
          title: Text("My Tracks")
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets),
          title: Text("Wish List")
        )
      ],

      onTap: _onPageSelected,
    );
  }

  void _onPageSelected(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }
}
