import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'ui/home_screen.dart';
import 'ui/utils/app_colors.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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

      // theme: ThemeData(
      //   primarySwatch: Colors.deepPurple,
      // ),
      home: SafeArea(
          child: HomeScreen()
      ),
    );
  }
}
