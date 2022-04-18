import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import '../controllers/DataContollers.dart';
import '../public_variables/notifications.dart';
import '../ui/variables.dart';


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


  Future<String> generateUserToken()async{
    try{
      final FirebaseMessaging fcm = FirebaseMessaging.instance;
      final fcmToken = await fcm.getToken();
      return fcmToken!;
    }catch(e){
      if(kDebugMode){print(e.toString());}
      return '';
    }
  }

  Future<void> sendNotification(String receiverId)async{

    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users')
        .where('phone', isEqualTo: receiverId).get();
    final List<QueryDocumentSnapshot> user = snapshot.docs;
    final String token = user[0].get('token');

    final data = {
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id':'1',
      'status': 'done',
      'message':'${DataControllers.to.userLoginResponse.value.data!.user!.fullName} sent you a request',
      'senderId':'${DataControllers.to.userLoginResponse.value.data!.user!.phone}',
      'receiverId': receiverId,
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
              'body': '${DataControllers.to.userLoginResponse.value.data!.user!.fullName} sent you a request',
            'priority': 'high',
            'data': data,
            'to': token}
          })
      );

      if(response.statusCode==200){
        if(kDebugMode){print('Request sent successfully');}
      }else{
        if(kDebugMode){print('Request Failed!');}
      }
    }catch(e){
      if(kDebugMode){print('Error>>>$e');}
    }
  }


  Future<void> createRequest(String receiverId) async{
    try{
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('request')
          .where('receiver_id', isEqualTo: receiverId)
          .where('status', isEqualTo: Variables.requestStatus[0]).get();
      final List<QueryDocumentSnapshot> requestList = snapshot.docs;

      if(requestList.isEmpty){
        var uuid = const Uuid();
        final String id = uuid.v1();
        await FirebaseFirestore.instance.collection('request').doc(id).set({
          'id': id,
          'sender_id': DataControllers.to.userLoginResponse.value.data!.user!.phone,
          'sender_name': DataControllers.to.userLoginResponse.value.data!.user!.fullName,
          'receiver_id': receiverId,
          'status': Variables.requestStatus[0],
          'date_time': DateTime.now().millisecondsSinceEpoch.toString()
        }).whenComplete(()async{
          await sendNotification(receiverId);

          Future.delayed(const Duration(minutes: 1)).then((value)async{
            QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('request')
                .where('id', isEqualTo: id)
                .where('status', isEqualTo: Variables.requestStatus[0]).get();
            final List<QueryDocumentSnapshot> requestList = snapshot.docs;
            if(requestList.isNotEmpty){
              await FirebaseFirestore.instance.collection('request').doc(id).update({
                'status': Variables.requestStatus[2],
              });
            }
          });
        });
      }else{showToast('Provider busy! Try again');}
    }catch(e){
      showToast(e.toString());
    }
  }

}