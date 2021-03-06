import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takecare_user/controller/data_controller.dart';
import 'package:takecare_user/pages/sign_in_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNavPage();
  }

  Future<void> _navigateToNavPage() async {
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Get.offAll(()=>const SignInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (dataController) {
        dataController.iniatializeApp(context);
        return SafeArea(
            child: Scaffold(
          body: Stack(
            children: [
              Center(
                  child: Text(
                'Splash Screen',
                style: TextStyle(color: AllColor.themeColor,
                    fontSize: dynamicSize(0.1)),
              ))
            ],
          ),
        ));
      }
    );
  }
}
