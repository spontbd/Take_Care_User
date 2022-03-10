
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

var signIn_or_SignUP = false;
var progressValue = 33.0;
class Variables {
  static const List<String> genderList=['Male','Female','Others'];
  static const List<String> FahilyList=['Male','Female','Others'];
  static File imageFile = new File(" ");
  static String base64Image = " ";
  static int exp = 0;
  static int spe = 0;
  static late  SharedPreferences storeSharedPreferences;

}