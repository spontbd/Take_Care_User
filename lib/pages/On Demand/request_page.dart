import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:takecare_user/pages/On%20Demand/accepted_page.dart';
import 'package:takecare_user/pages/On%20Demand/cancel_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {

  @override
  void initState() {
    super.initState();
    _navigateToNavPage();
  }

  Future<void> _navigateToNavPage() async {
    Future.delayed(const Duration(seconds: 5)).then((value) =>
        Get.offAll(()=>const AcceptedPage()));
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AllColor.themeColor,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    // crossAxisAlignment:CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => CancelPage()));
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white, fontSize: dynamicSize(0.05)),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: dynamicSize(0.2),
                  ),
                  CircleAvatar(
                    radius: 40,
                    child: ClipOval(child: Image.asset("assets/images/imam.png")),
                  ),
                  SizedBox(
                    height: dynamicSize(0.1),
                  ),
                  Text("Leya Ajanta Mondol",style: TextStyle(fontSize: dynamicSize(0.06),color: Colors.white),),
                  Text("is on the way to accept the service. ",style: TextStyle(fontSize: dynamicSize(0.05),color: Colors.white),),
                  SizedBox(
                    height: dynamicSize(0.8),
                  ),
                  Text("Please wait",style: TextStyle(fontSize: dynamicSize(0.05),color: Colors.white),),
                  Text(". . . .",style: TextStyle(fontSize: dynamicSize(0.1),color: Colors.white),),

                ],
              ),
            ),
          )),
    );
  }
}

