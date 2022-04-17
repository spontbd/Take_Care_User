import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


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

    if (MediaQuery.of(context).size.width<=500) {
      size.value = MediaQuery.of(context).size.width;
    } else {
      size.value = MediaQuery.of(context).size.height;
    }
    update();
    print('Size: ${size.value}');
  }


  Future<void> createUser(String phone)async{
    try{
      final FirebaseMessaging fcm = FirebaseMessaging.instance;
      final fcmToken = await fcm.getToken();

      await FirebaseFirestore.instance.collection('users').doc(phone).set({
        'token': fcmToken,
        'phone' : phone,
        'createdAt': DateTime.now().millisecondsSinceEpoch.toString()
      },SetOptions(merge: true)).whenComplete((){
        if (kDebugMode) {print('!!User & Token Created!!');}
      });
    }catch(e){
      if(kDebugMode){print(e.toString());}
    }
  }

  Future<void> sendNotification(String receiver, String token)async{
    final data = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id':'1',
      'status': 'done',
      'message':'$receiver you have new message',
      'sender':'Sujit Sarkar',
      'receiver': receiver,
    };

    try{
      http.Response response = await http.post(
          Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers:<String,String>{
            'Content-Type': 'application/json',
            'Authorization': 'key=AAAANQH8hdE:APA91bGQJCiSJClNaFXsgIGNbI3wNM8chjmPXNM5Is0hj_WHlgiyU663TvmpPP4YOwOsVnEnuinjYBY4GZdfNz5nO1w2jSAA5RlgdnkNGPJAf7ZEM_LS_u-pLe5tWntbRffqxmvcoxLB'
          },
          body: jsonEncode(<String,dynamic>{
            'notification': <String,dynamic>{
              'title': 'Notification from Takecare',
              'body':'$receiver you have new message'},
            'priority': 'high',
            'data': data,
            'to': token
          })
      );

      if(response.statusCode==200){
        if(kDebugMode){print('Notification sent success');}
      }else{
        if(kDebugMode){print('Notification sent Failed!');}
      }
    }catch(e){
      if(kDebugMode){print('Error>>>$e');}
    }
  }

}