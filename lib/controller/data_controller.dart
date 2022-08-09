import 'dart:convert';
// import 'package:barikoi_maps_place_picker/barikoi_maps_place_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';
import '../controllers/DataContollers.dart';
import '../model/AvailableProviderResponse.dart';
import '../pages/On Demand/accepted_page.dart';
import '../pages/On Demand/confirm_order_page.dart';
import '../pages/On Demand/request_page.dart';
import '../public_variables/notifications.dart';
import '../ui/variables.dart';


class DataController extends GetxController{
  static DataController dc =Get.find();
  SharedPreferences? preferences;
  RxDouble size = 360.0.obs;
  RxBool loading=false.obs;

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

    final data = <String,dynamic>{
      'click_action': 'FLUTTER_NOTIFICATION_CLICK',
      'id':'1',
      'status': 'done',
      'message':'${DataControllers.to.userLoginResponse.value.data!.user!.fullName} sent you a request',
      'sender':'${DataControllers.to.userLoginResponse.value.data!.user!.phone}',
      'receiver': receiverId,
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
              'body': '${DataControllers.to.userLoginResponse.value.data!.user!.fullName} sent you a request'},
            'priority': 'high',
            'data': data,
            'to': token
          })
      );
      print('Response body: ${response.statusCode}');
      if(response.statusCode==200){
        if(kDebugMode){print('Request sent successfully');}
      }else{
        if(kDebugMode){print('Request Failed!');}
      }
    }catch(e){
      if(kDebugMode){print('Error>>>$e');}
    }
  }


  // Future<void> createRequest(Providerdata providerData,PickResult result, int requestIndex) async{
  //   try{
  //     loading(true);update();
  //     QuerySnapshot receiverShot = await FirebaseFirestore.instance.collection('request')
  //         .where('receiver_id', isEqualTo: providerData.phone.toString()).get();
  //     final List<QueryDocumentSnapshot>  lst1 = receiverShot.docs;
  //     List<QueryDocumentSnapshot> receiverList = lst1.where((element) => element['status']==Variables.orderStatusData[0].statusCode || element['status']==Variables.orderStatusData[1].statusCode).toList();
  //
  //     QuerySnapshot senderShot = await FirebaseFirestore.instance.collection('request')
  //         .where('sender_id', isEqualTo: providerData.phone.toString()).get();
  //     final List<QueryDocumentSnapshot> lst2 = senderShot.docs;
  //     List<QueryDocumentSnapshot> senderList = lst2.where((element) => element['status']==Variables.orderStatusData[0].statusCode || element['status']==Variables.orderStatusData[1].statusCode).toList();
  //
  //     if(senderList.isNotEmpty){
  //       loading(false);update();
  //       showToast('You already busy with a Provider');
  //     } else if(receiverList.isNotEmpty){
  //       loading(false);update();
  //       showToast('Provider busy now! Try again');
  //     } else if(receiverList.isEmpty && senderList.isEmpty){
  //       saveData(providerData, result, requestIndex);
  //     }else{
  //       loading(false);update();
  //       showToast('Something went wrong! Try again');
  //     }
  //   }catch(e){
  //     loading(false);update();
  //     showToast('Something went wrong! Try again');
  //     if (kDebugMode) {
  //       print(e.toString());
  //     }
  //   }
  // }

  // Future<void> saveData(Providerdata providerData,PickResult result, int requestIndex)async{
  //   var uuid = const Uuid();
  //   final String id = uuid.v1();
  //   await FirebaseFirestore.instance.collection('request').doc(id).set({
  //     'id': id,
  //     'sender_id': DataControllers.to.userLoginResponse.value.data!.user!.phone,
  //     'sender_name': DataControllers.to.userLoginResponse.value.data!.user!.fullName,
  //     'receiver_id': providerData.phone.toString(),
  //     'receiver_name': providerData.fullName,
  //     'lat': result.latitude,
  //     'lng': result.longitude,
  //     'booking_address': result.formattedAddress,
  //     'order_note': '',
  //     'engage_start_time': null,
  //     'engage_end_time': null,
  //     'status': Variables.orderStatusData[0].statusCode,
  //     'date_time': DateTime.now().millisecondsSinceEpoch
  //
  //   }).whenComplete(()async{
  //     await sendNotification(providerData.phone.toString());
  //     loading(false);update();
  //     Get.to(()=>RequestPage( docId: id, requestIndex: requestIndex,receiverId: providerData.phone.toString()));
  //   });
  // }

  Future<void> autoCancelRequest(String docId, String receiverId)async{
    Future.delayed(const Duration(seconds: 500)).then((value)async{
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('request')
          .where('id', isEqualTo: docId).get();
      final List<QueryDocumentSnapshot> requestList = snapshot.docs;

      if(requestList.first.get('status')==Variables.orderStatusData[0].statusCode){
        await FirebaseFirestore.instance.collection('request').doc(docId).update({
          'status': Variables.orderStatusData[2].statusCode,
        });
        showToast('Request not accepted');
        Navigator.pop(Get.context!);
      }else if(requestList.first.get('status')==Variables.orderStatusData[1].statusCode){
        showToast('Request accepted');
        Get.to(()=>AcceptedPage(reqDocId: docId,receiverId: receiverId));
      }else if(requestList[0].get('status')==Variables.orderStatusData[2].statusCode){
        showToast('Request declined');
        Navigator.pop(Get.context!);
      }else{
        showToast('Something wrong. Try again');
        Navigator.pop(Get.context!);
      }
    });
  }


  Future<void> confirmOrder(String reqDocId, String receiverId)async{
    try{
      loading(true);update();
      await FirebaseFirestore.instance.collection('request').doc(reqDocId).update({
        'status': Variables.orderStatusData[3].statusCode,
      }).whenComplete(()async{
        QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('users')
            .where('phone', isEqualTo: receiverId).get();
        final List<QueryDocumentSnapshot> user = snapshot.docs;
        final String token = user.first.get('token');

        final data = <String,dynamic>{
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'id':'1',
          'status': 'done',
          'message':'${DataControllers.to.userLoginResponse.value.data!.user!.fullName} confirmed your request',
          'sender':'${DataControllers.to.userLoginResponse.value.data!.user!.phone}',
          'receiver': receiverId,
        };

        http.Response response = await http.post(
            Uri.parse('https://fcm.googleapis.com/fcm/send'),
            headers:<String,String>{
              'Content-Type': 'application/json',
              'Authorization': 'key=AAAANQH8hdE:APA91bGQJCiSJClNaFXsgIGNbI3wNM8chjmPXNM5Is0hj_WHlgiyU663TvmpPP4YOwOsVnEnuinjYBY4GZdfNz5nO1w2jSAA5RlgdnkNGPJAf7ZEM_LS_u-pLe5tWntbRffqxmvcoxLB'
            },
            body: jsonEncode(<String,dynamic>{
              'notification': <String,dynamic>{
                'title': 'Notification from Takecare',
                'body': '${DataControllers.to.userLoginResponse.value.data!.user!.fullName} confirmed your request'},
              'priority': 'high',
              'data': data,
              'to': token
            })
        );
       loading(false);update();

        if(response.statusCode==200){
          if(kDebugMode){print('Confirmation success');}
          showToast('Confirmation success');
          Navigator.of(Get.context!).pushReplacement(
              MaterialPageRoute(builder: (_) => const ConfirmOrderPage()));
        }else{
          showToast('Confirmation Failed');
          if(kDebugMode){print('Confirmation Failed!');}
        }
      });
    }catch(e){
      showToast(e.toString());
    }
  }

}