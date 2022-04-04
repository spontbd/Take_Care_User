import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class DataController extends GetxController{
  static DataController dc = Get.find();
  SharedPreferences? preferences;
  RxBool isPhone = true.obs;
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

  void getSize(BuildContext context){
    // Mobile (Smartphone) max-width: 480px
    // Low Resolution Tablets and ipads max-width: 767px
    // Tablets Ipads portrait mode max-width:1024px
    // Desktops max-width:1280px
    // Huge size (Larger screen) max-width: 1281px and greater
    final Size s = MediaQuery.of(context).size;
    if(s.width<=500){
      size(s.width);
    }else if(s.width>500){
      size(s.width);
    }
    update();
    if (kDebugMode){
      print('Size: w=${s.width}, h=${s.height}');
    }
  }
}


/*
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

}*/
