import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:takecare_user/pages/splash_screen.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'controller/data_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  /// Set Device orientation
  final bool _isPhone = Device.get().isPhone;
  SharedPreferences pref = await SharedPreferences.getInstance();
  if(_isPhone) {AllColor.portraitMood;}
  else {AllColor.landscapeMood;}
  AllColor.systemOverlay;
  pref.setBool('isPhone', _isPhone);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
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
