import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class DataController extends GetxController{
  SharedPreferences? preferences;
  RxBool isPhone = true.obs;
  RxDouble size = 360.0.obs;

  @override
  void onInit() {
    super.onInit();
    iniatializeApp();
  }

  Future<void> iniatializeApp() async {
    preferences = await SharedPreferences.getInstance();
    isPhone.value = preferences!.getBool('isPhone')!;
    if (isPhone.value) {size.value = MediaQuery.of(Get.context!).size.width;
    } else {
      size.value = MediaQuery.of(Get.context!).size.height;
    }
    update();
    print('IsPhone: ${isPhone.value}');
    print('Size: ${size.value}');
    print("Data Initialized !!!");
  }

}