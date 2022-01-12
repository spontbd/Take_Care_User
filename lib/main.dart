import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:takecare_user/pages/splash_screen.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'controller/data_controller.dart';

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
  // final bool _isPhone = Device.get().isPhone;
  // SharedPreferences pref = await SharedPreferences.getInstance();
  // if(_isPhone) {AllColor.portraitMood;}
  // else {AllColor.landscapeMood;}
  // AllColor.systemOverlay;
  // pref.setBool('isPhone', _isPhone);
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
    final DataController dataController = Get.put(DataController());
    return GetMaterialApp(
        title: 'Take Care',
        theme: AllColor.theme,
        debugShowCheckedModeBanner: false,
        home: const SplashScreen()
    );
  }
}
