import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{

  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(){
    const InitializationSettings initializationSettings =
         InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/launcher_icon'));
    _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static void display(RemoteMessage message)async{
    try{
      Random random = Random();
      int id = random.nextInt(1000);
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          'mychanel',
          'my chanel',
          importance: Importance.max,
          priority: Priority.high
        ));

      await _flutterLocalNotificationsPlugin.show(
          id,
          message.notification!.title,
          message.notification!.body,
          notificationDetails);
    }catch(e){
      print('Error>>>$e');
    }
  }
}