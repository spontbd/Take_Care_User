import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/pages/sign_in_page.dart';
import 'package:takecare_user/public_variables/size_config.dart';
import 'home_page.dart';

class OtpVerificationPage extends StatefulWidget {
  const OtpVerificationPage({Key? key}) : super(key: key);

  @override
  _OtpVerificationPageState createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {



  late Timer _timer;
  int _start = 180;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
          //  timer.cancel();
            dispose();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    startTimer();
    /* if(DataControllers.to.userServiceResponse.value.data!.isNotEmpty)
      {
        showBottom = false;
      }*/
  }




  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;


    return Scaffold(
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [


            Padding(
              padding: const EdgeInsets.only(left: 60.0, top: 200),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Enter 6 digit code that ',
                  style: TextStyle(
                    fontSize: dynamicSize(0.07),
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 60.0, top: 5),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'sent you in',
                      style: TextStyle(
                        fontSize: dynamicSize(0.07),
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                FlatButton(
                    onPressed: () {},
                    child: Text(
                      DataControllers.to.phoneNumber.value.text,
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),

                    )
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child:Container(
                // padding: const EdgeInsets.only(left:40),
                margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/3),

                child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      "",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: dynamicSize(0.07)),
                    )),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left:10.0,right: 10),
              width:  MediaQuery.of(context).size.width,
              child: OTPTextField(
                length: 6,
                //numberOfFields: 5,
                width: size.width ,
                fieldWidth: dynamicSize(.12),
                style: TextStyle(
                    fontSize: dynamicSize(0.08)
                ),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.box,
                onCompleted: (pin) {
                  print("Completed: " + pin);
                  DataControllers.to.name.value.text = pin;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '${_start} sec.',
                  style: TextStyle(
                    fontSize: dynamicSize(0.07),
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            Spacer(),
            SizedBox(
              height: dynamicSize(0.15),
              width: MediaQuery.of(context).size.width,
              child: Container(
                //margin: EdgeInsets.only(bottom: 5),
                padding: const EdgeInsets.only(left: 5, right: 5, bottom:10),
                child: RaisedButton(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () async{

                    if(DataControllers.to.name.value.text.isNotEmpty)
                    {

                      await DataControllers.to.postVerifyOTP(DataControllers.to.phoneNumber.value.text, DataControllers.to.name.value.text);

                      Fluttertoast.showToast(
                          msg: DataControllers.to.userLoginResponse.value.message!,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      if(DataControllers.to.userLoginResponse.value.success == true)
                      {
                         Get.offAll(SignInPage());

                      }

                    }else
                    {
                      Fluttertoast.showToast(
                          msg: "Fil up the filed!!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }

/*
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  SignInPage()),
                    );*/
                  },
                  //padding: EdgeInsets.all(10.0),
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: Text(
                    "Verify",
                    style: TextStyle(fontSize: dynamicSize(0.07)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}