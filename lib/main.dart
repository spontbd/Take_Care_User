import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:takecare_user/controllers/language_controller.dart';
import 'package:takecare_user/pages/On%20Demand/on_demand_page.dart';
import 'package:takecare_user/pages/home_page.dart';
import 'package:takecare_user/pages/otp_verification_page.dart';
import 'package:takecare_user/pages/sign_up_page.dart';
import 'package:takecare_user/pages/splash_screen.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'controller/data_controller.dart';
import 'controllers/DataContollers.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications',// description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  //await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final DataController dataController = Get.put(DataController());
  final DataControllers dataControllers = Get.put(DataControllers());
  final LanguageController languageController = Get.put(LanguageController());

  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  /// Set Device orientation
  AllColor.portraitMood;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        print('..............Hello Notification.............');
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage? message) {
      RemoteNotification? notification = message!.notification;
      AndroidNotification? android = message.notification?.android;
      if (android != null) {

        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification!.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                color: Colors.blue,
                playSound: true,
                icon: '@mipmap/ic_launcher',
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) {
      print('A new onMessageOpenedApp event was published!');
      RemoteNotification? notification = message!.notification;
      AndroidNotification? android = message.notification?.android;
      if(notification != null && android != null) {
        print('yes');
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Take Care',
        theme: AllColor.theme,
        debugShowCheckedModeBanner: false,
        home: const OnDemandPage()
    );
  }
}
