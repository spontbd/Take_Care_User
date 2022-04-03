
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Common {
  //late SharedPreferences storeSharedPreferences;

  static show(String title,Color colorBackground)
  {
    Fluttertoast.showToast(
        msg: title,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: colorBackground,
        textColor: Colors.white,
        fontSize: 16.0);
  }


  static late final SharedPreferences storeSharedPreferences;
  static Future init() async {
    storeSharedPreferences = await SharedPreferences.getInstance();
  }

}