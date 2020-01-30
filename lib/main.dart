import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:mybackingtracks/data/provider/mytracks_provider.dart';
import 'package:mybackingtracks/data/provider/wishlist_provider.dart';

import 'ui/home_screen.dart';
import 'ui/utils/app_colors.dart';

void main() => runApp(
  MultiProvider(
    providers: [
      ChangeNotifierProvider(builder: (context) => MyTracksProvider()),
      ChangeNotifierProvider(builder: (context) => WishListProvider())
    ],
    child: MyBackingTracksApp()
  )
);

class MyBackingTracksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Color(AppColors.primaryDarkColor)
      )
    );

    return MaterialApp(
      title: 'My BackingTracks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: SafeArea(
          child: HomeScreen()
      ),
    );
  }
}
