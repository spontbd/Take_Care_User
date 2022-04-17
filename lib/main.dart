import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takecare_user/controllers/language_controller.dart';
import 'package:takecare_user/pages/sign_in_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'api_service/service.dart';
import 'controller/data_controller.dart';
import 'controllers/DataContollers.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async{
  ///Onclick listener
  //NotificationService.display(message);
}

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  NotificationService.initialize();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final DataController dataController = Get.put(DataController());
  final DataControllers dataControllers = Get.put(DataControllers());
  final LanguageController languageController = Get.put(LanguageController());


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
    _fcmInit();
  }

  Future<void> _fcmInit()async{
    FirebaseMessaging.instance.getInitialMessage();


    ///When App Running
    FirebaseMessaging.onMessage.listen((event) {
      if (kDebugMode) {
        print('!!FCM message Received!! (On Running)\n');
        print('Event: ${event.data}\n'
            'body: ${event.notification!.body}\n'
            'Message ID: ${event.messageId}\n');
      }
      NotificationService.display(event);

    });

    ///When App Minimized
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      if (kDebugMode) {
        print('!!FCM message Received (On Minimize)!!');
        print('Event: ${event.data}\n'
            'body: ${event.notification!.body}\n'
            'Message ID: ${event.messageId}\n');
      }
      NotificationService.display(event);
    });

    ///When App Destroyed
    FirebaseMessaging.instance.getInitialMessage().then((value){
      if (kDebugMode) {print('!!FCM message Received (On Destroy)!!');}
      NotificationService.display(value!);
    });
  }


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Take Care',
        theme: AllColor.theme,
        debugShowCheckedModeBanner: false,
        home: const SignInPage()
    );
  }
}
