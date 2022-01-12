import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/public_variables/size_config.dart';

class SingIn extends StatefulWidget {
  const SingIn({Key? key}) : super(key: key);

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  bool isHiddenPassword = true;

  final fromkey = GlobalKey<FormState>();

  void validate() {
    if (fromkey.currentState!.validate()) {
      print("object");
    } else {
      print("not");
    }
  }

  @override
  Widget build(BuildContext context) {
   Get.put(DataControllers());
    return Obx(() {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            key: fromkey,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8,top: 5),
                child: SizedBox(
                  width: dynamicSize(0.4),
                  height:dynamicSize(0.05),
                  child: TextFormField(

                    controller: DataControllers.to.phoneNumber.value,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    style: new TextStyle(fontWeight: FontWeight.normal, color: Colors.black),
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                      border: OutlineInputBorder(),
                      labelText: "Mobile Number*",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 8,top: 6),
                child: SizedBox(
                  width: dynamicSize(0.4),
                  height:dynamicSize(0.05),
                  child: TextFormField(
                    controller: DataControllers.to.password.value,
                    obscureText: isHiddenPassword,
                    decoration: InputDecoration(
                      contentPadding: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
                      border: OutlineInputBorder(),
                      icon: null,
                      labelText: 'Password*',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:dynamicSize(0.02),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Forget Password?",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: dynamicSize(0.02)
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    );
  }
}
