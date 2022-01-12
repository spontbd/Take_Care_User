import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AllColor{

  static const Color themeColor= Color(0xffff0054);
  static const Color blue= Color(0xff028ac9);
  static const Color black= Color(0xff000000);

  static const Map<int, Color> themeMapColor = {
    50: Color.fromRGBO(255, 0, 84, .1),
    100: Color.fromRGBO(255, 0, 84, .2),
    200: Color.fromRGBO(255, 0, 84, .3),
    300: Color.fromRGBO(255, 0, 84, .4),
    400: Color.fromRGBO(255, 0, 84, .5),
    500: Color.fromRGBO(255, 0, 84, .6),
    600: Color.fromRGBO(255, 0, 84, .7),
    700: Color.fromRGBO(255, 0, 84, .8),
    800: Color.fromRGBO(255, 0, 84, .9),
    900: Color.fromRGBO(255, 0, 84, 1),
  };

  static final theme = ThemeData(
      backgroundColor:  Colors.white,
      scaffoldBackgroundColor: Colors.white,
      primarySwatch: const MaterialColor(0xffFF0054, AllColor.themeMapColor),
      canvasColor: Colors.transparent,
      // fontFamily: 'ubuntu',
      //textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.redAccent),
      // bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //     backgroundColor: Colors.transparent,
      //     elevation: 0.0,
      //     showSelectedLabels: true,
      //     showUnselectedLabels: true,
      //     unselectedItemColor: Colors.white,
      //     selectedItemColor: orangeThemeColor
      // )
  );

  static var systemOverlay = SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark));

  static var portraitMood =SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  static var landscapeMood =SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft,DeviceOrientation.landscapeRight]);

}