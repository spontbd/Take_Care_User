import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../public_variables/all_colors.dart';
import '../public_variables/size_config.dart';

class RecoverPassPage extends StatefulWidget {
  const RecoverPassPage({Key? key}) : super(key: key);

  @override
  State<RecoverPassPage> createState() => _RecoverPassPageState();
}

class _RecoverPassPageState extends State<RecoverPassPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Container(
            height: dynamicSize(0.5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/clip_path_shape.png"),
                  //fit:BoxFit.cover
                  alignment: Alignment.topRight),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(
                        color: AllColor.textColor, fontSize: dynamicSize(.05)),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'Recover Your\n',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: dynamicSize(.09))),
                      TextSpan(
                        text: 'Password !',
                        style: TextStyle(
                          fontSize: dynamicSize(0.07),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: dynamicSize(.06)),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Enter 6 digit code here !',
                    style: TextStyle(
                      fontSize: dynamicSize(0.05),
                      color: Colors.black,
                    ),
                  ),
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

                ),
              ),
              SizedBox(height: dynamicSize(.06)),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Expanded(
                  child: Container(
                    height: dynamicSize(0.12),
                    child: TextField(
                      //controller: DataControllers.to.name.value,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'New Password*',
                          hintStyle: TextStyle(fontSize: dynamicSize(0.04))),
                    ),
                  ),
                ),
              ),
              SizedBox(height: dynamicSize(.06)),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Expanded(
                  child: Container(
                    height: dynamicSize(0.12),
                    child: TextField(
                      //controller: DataControllers.to.name.value,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm Password*',
                          hintStyle: TextStyle(fontSize: dynamicSize(0.04))),
                    ),
                  ),
                ),
              ),
              SizedBox(height: dynamicSize(.1)),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.08)),
                  child: ElevatedButton(
                    onPressed: () async {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Submit',
                              style: TextStyle(fontSize: dynamicSize(0.05))),
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
