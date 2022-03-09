import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class DataController extends GetxController{
  static DataController dc =Get.find();
  SharedPreferences? preferences;
  RxDouble size = 360.0.obs;
  var feedbackController = TextEditingController(text:'').obs;
  void updateFeedController(String val){
    feedbackController.value.text=val;
    update();
  }
  void clearFeedController(){
    feedbackController.value.clear();
    update();
  }

  Future<void> iniatializeApp(BuildContext context) async {
    preferences = await SharedPreferences.getInstance();

    if (MediaQuery.of(context).size.width<=500) {size.value = MediaQuery.of(context).size.width;
    } else {
      size.value = MediaQuery.of(context).size.height;
    }
    update();
    print('Size: ${size.value}');
  }

}