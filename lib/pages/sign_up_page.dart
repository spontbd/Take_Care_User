import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takecare_user/ui/variables.dart';

import '../controllers/DataContollers.dart';
import '../public_variables/all_colors.dart';
import '../public_variables/notifications.dart';
import '../public_variables/size_config.dart';
import '../widgets/check_box.dart';
import '../widgets/text_field_tile.dart';
import 'otp_verification_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext size) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            // padding: EdgeInsets.all(dynamicSize(.04)),
           height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

                SizedBox(height: dynamicSize(.1)),

                ///Heading
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                          color: AllColor.textColor, fontSize: dynamicSize(.056)),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Account\n',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: dynamicSize(.1))),
                        const TextSpan(text: 'Information'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: dynamicSize(.06)),

                ///Name and Image Field
                Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8),
                  child: Row(
                    children: [
                      Expanded(
                          child: TextField(
                            controller: DataControllers.to.name.value,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Name*',
                                hintStyle:
                                TextStyle(fontSize: dynamicSize(0.05))),
                          ),

                      ),
                      SizedBox(width: dynamicSize(.05)),
                      InkWell(
                        onTap: () => _getImage(),
                        child: Container(
                          alignment: Alignment.center,
                          height: dynamicSize(0.15),
                          width: dynamicSize(0.15),
                          decoration: const BoxDecoration(
                              color: AllColor.blue, shape: BoxShape.circle),
                          child: Variables.imageFile == null
                              ? Icon(CupertinoIcons.person_solid,
                                  color: Colors.white, size: dynamicSize(2))
                              : ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(dynamicSize(0.2))),
                                  child: Image.file(Variables.imageFile,
                                      height: dynamicSize(0.2),
                                      width: dynamicSize(0.2),
                                      fit: BoxFit.cover)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: dynamicSize(.15)),

                ///Gender
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    children: Variables.genderList
                        .map((item) => Expanded(
                                child: InkWell(
                              onTap: () => setState(
                                  () => DataControllers.to.gender.value = item),
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(
                                    right: item == 'Male' || item == 'Female'
                                        ? size.width * .02
                                        : 0.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: AllColor.blue),
                                    color: item == DataControllers.to.gender.value
                                        ? AllColor.blue
                                        : Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(size.width * .01))),
                                padding: EdgeInsets.symmetric(
                                    vertical: size.width * .025,
                                    horizontal: size.width * .04),
                                child: Text(
                                  item,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: size.width * .04,
                                      color:
                                          item == DataControllers.to.gender.value
                                              ? Colors.white
                                              : AllColor.textColor),
                                ),
                              ),
                            )))
                        .toList(),
                  ),
                ),
                SizedBox(height: dynamicSize(.04)),

                /// Number
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: dynamicSize(0.15),
                          child: TextField(
                            enabled: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: '+88',
                                hintStyle:
                                    TextStyle(fontSize: dynamicSize(0.05))),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: dynamicSize(0.15),
                          child: TextField(
                            controller:  DataControllers.to.phoneNumber.value,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Enter Your Mobile Number',
                                hintStyle:
                                    TextStyle(fontSize: dynamicSize(0.05))),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: dynamicSize(0.04),
                ),
                ///Password
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Container(
                    height: dynamicSize(0.15),
                    child: BorderTextField(
                        labelText: "Password*",
                        controller: DataControllers.to.password.value,
                        obscure: true),
                  ),
                ),
                
                SizedBox(height: dynamicSize(0.02),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CheckBox(),
                    RichText(
                      text: TextSpan(
                        text: 'By singing up I agree to the all ',
                        style: TextStyle(fontSize: dynamicSize(0.045), color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Terms & Condition',
                              recognizer: new TapGestureRecognizer()
                                ..onTap = () => print('Tap Here onTap'),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  decoration: TextDecoration.underline)),
                        ],
                      ),
                    ),

                  ],
                ),

              ],
            ),
          ),
        ),
        bottomNavigationBar:


        Padding(
          padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.08)),
          child: ElevatedButton(
            onPressed: () async {
              if(
              DataControllers.to.phoneNumber.value.text.isNotEmpty  &&
                  DataControllers.to.password.value.text.isNotEmpty &&
                  DataControllers.to.gender.value.isNotEmpty  &&
                  DataControllers.to.name.value.text.isNotEmpty  &&
                  Variables.base64Image.isNotEmpty
              )
              {

                await DataControllers.to.postRegister(
                    DataControllers.to.name.value.text,
                    DataControllers.to.phoneNumber.value.text,
                    DataControllers.to.password.value.text,
                    DataControllers.to.gender.value,
                    "4",
                    Variables.base64Image
                );

                Fluttertoast.showToast(
                    msg: DataControllers.to.regsiter.value.message!,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
                if(DataControllers.to.regsiter.value.success == true)
                {
                  Get.to(OtpVerificationPage());
                  /*   Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OtpVerificationPage()),
                              );*/
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
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Sign Up',
                      style: TextStyle(fontSize: dynamicSize(0.045))),
                )
              ],
            ),
          )
        ),


       /* SizedBox(
          height: dynamicSize(0.18),
          width: MediaQuery.of(context).size.width,
          child: Container(
            //margin: EdgeInsets.only(bottom: 5),
            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
            child: RaisedButton(
              elevation: 9,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () async {

                if(
                DataControllers.to.phoneNumber.value.text.isNotEmpty  &&
                    DataControllers.to.password.value.text.isNotEmpty &&
                    DataControllers.to.gender.value.isNotEmpty  &&
                    DataControllers.to.name.value.text.isNotEmpty  &&
                    Variables.base64Image.isNotEmpty
                )
                {

                  await DataControllers.to.postRegister(
                      DataControllers.to.name.value.text,
                      DataControllers.to.phoneNumber.value.text,
                      DataControllers.to.password.value.text,
                      DataControllers.to.gender.value,
                      "4",
                      Variables.base64Image
                  );

                  Fluttertoast.showToast(
                      msg: DataControllers.to.regsiter.value.message!,
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0
                  );
                  if(DataControllers.to.regsiter.value.success == true)
                  {
                    Get.to(OtpVerificationPage());
                    *//*   Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OtpVerificationPage()),
                              );*//*
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


              },
              color: Colors.redAccent,
              textColor: Colors.white,
              child: const Text(
                "Verify",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ) ,*/
      ),
    );
  }

  void _getImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    // var choosedimage = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() => Variables.imageFile = File(image.path));

      List<int> imageBytes = Variables.imageFile.readAsBytesSync();
      Variables.base64Image = base64Encode(imageBytes);
      //Variables.base64Image = Base64Encoder().convert(Variables.imageFile.readAsBytesSync());//base64Encode(Variables.imageFile.readAsBytesSync());
      // Variables.base64Image = base64Encode(Variables.imageFile.readAsBytesSync());
      print("image : " + Variables.base64Image);
      // String fileName = _image!.path.split("/").last;
      //print('Image File Name: $fileName');
      //showLoadingDialog(context);
      /*    await userProvider
          .profileImageUpdate(base64Image, fileName)
          .then((value) {
        if (value) {
          showToast('Success');
          Navigator.pop(context);
        } else {
          showToast('Failed!');
          Navigator.pop(context);
        }
      });*/

    } else {
      showToast('Image not selected');
    }
  }
}
