import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AllColor{

  static const Color themeColor= Color(0xffff0054);
  static const Color blue= Color(0xff028ac9);
  static const Color blue_light= Color(0xff39BFFE);
  static const Color black= Color(0xff000000);
  static const Color button_color= Color(0xff39bffe);
  static const Color card_bg= Color(0x51535353);
  static const Color transBack= Color(0x6C000000);
  static const Color textFieldColor= Color(0xffEEEEF4);
  static final Color textColor= Colors.grey.shade900;
  static const Color search_field_color= Color(0xffd8d8d8);
  static const Color cancel_icon_color= Color(0xff707070);
  static const Color colorDashboardProfileRed = Color(0xffF17979);
  static const Color colorDashboardOnDemand_blue = Color(0xff41C5DF);
  static const Color colorArrow = Color(0xff2D75B8);
  static const Color colorExperience = Color(0xcaf8edc2);
  static const Color colorTransBlack  = Color(0x410C0C0C);
  static const Color colorGreen_light  = Color(0x7784C71F);
  static const Color colorGreen  = Color(0xFC34C759);


  static const Color selected_color= Color(0x65eeecec);
  static const Color shado_color= Color(0xffeeecec);
  static const Color white_blue= Color(0xffe3f2fd);
  static const Color white_light= Color(0xfff6f5f5);
  static const Color white= Color(0xffffffff);
  static const Color white_orange= Color(0xffffeece);
  static const Color white_yeo= Color(0xffe5f7c1);
  static const Color white_yellow= Color(0xfff1f8e9);
  static const Color white_pink= Color(0xffffebee);
  static const Color pink_button= Color(0xffff0163);
  static const Color buttomdialog= Color(0xff91515D);
  static const Color blackOrange= Color(0xffa68400);

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