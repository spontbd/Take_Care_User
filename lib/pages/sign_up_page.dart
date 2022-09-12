import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:takecare_user/pages/sign_in_page.dart';
import 'package:takecare_user/public_variables/variables.dart';

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



  var initialProfile = true;
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to go Login'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          TextButton(
            onPressed: () {

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => SignInPage()));
            } ,
            child: new Text('Yes'),
          ),
        ],
      ),
    )) ?? false;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Variables.categoryCheckBoxValue = false;
    Variables.base64Image = "";
  }

  @override
  Widget build(BuildContext size) {
    return WillPopScope(
      onWillPop: null,
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              // padding: EdgeInsets.all(dynamicSize(.04)),
             height: MediaQuery.of(context).size.height * 1.3,
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
                  ///Heading
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                            color: AllColor.textColor, fontSize: dynamicSize(.05)),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Account\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: dynamicSize(.09))),
                          const TextSpan(text: 'Information'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: dynamicSize(.03)),
                  Center(
                    child: InkWell(
                      onTap: () => _getImage(),
                      child: Container(
                        alignment: Alignment.center,
                        height: dynamicSize(0.22),
                        width: dynamicSize(0.22),
                        decoration: const BoxDecoration(
                            color: AllColor.blue, shape: BoxShape.circle),
                        child: initialProfile
                            ? Stack(
                          children: [
                            Icon( Icons.account_circle,
                              color: Colors.white, size: dynamicSize(0.2), ),
                            Positioned(
                              bottom: 0.0,
                              right: 0.0,
                              child:
                              Icon( Icons.camera_alt_outlined,
                                color: Colors.black,),
                            ),
                          ],
                        )
                            : ClipRRect(
                            borderRadius: BorderRadius.all(
                                Radius.circular(dynamicSize(0.2))),
                            child: Image.file(Variables.imageFile,
                                height: dynamicSize(0.2),
                                width: dynamicSize(0.2),
                                fit: BoxFit.cover)),
                      ),
                    ),
                  ),
                  SizedBox(height: dynamicSize(.03)),
                  ///Name and Image Field
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              height: dynamicSize(0.12),
                              child: TextField(
                                controller: DataControllers.to.name.value,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'Name*',
                                    hintStyle:
                                    TextStyle(fontSize: dynamicSize(0.04))),
                              ),
                            ),

                        ),
                        /*SizedBox(width: dynamicSize(.02)),
                        InkWell(
                          onTap: () => _getImage(),
                          child: Container(
                            alignment: Alignment.center,
                            height: dynamicSize(0.15),
                            width: dynamicSize(0.15),
                            decoration: const BoxDecoration(
                                color: AllColor.blue, shape: BoxShape.circle),
                            child: initialProfile
                                ? Icon( CupertinoIcons.person_solid,
                                    color: Colors.white, )
                                : ClipRRect(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(dynamicSize(0.2))),
                                    child: Image.file(Variables.imageFile,
                                        height: dynamicSize(0.2),
                                        width: dynamicSize(0.2),
                                        fit: BoxFit.cover)),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                  SizedBox(height: dynamicSize(.06)),

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
                            height: dynamicSize(0.12),
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
                            height: dynamicSize(0.12),
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              controller:  DataControllers.to.phoneNumber.value,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Enter Your Mobile Number',
                                  /*hintStyle: TextStyle(fontSize: dynamicSize(0.05) ) */),
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
                      Expanded(
                        child: RichText(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                   
                          text: TextSpan(

                            text: 'By singing up I agree to the all ',
                            style: TextStyle(fontSize: dynamicSize(0.035), color: Colors.black),
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
                      ),

                    ],
                  ),


                  SizedBox(height: 10,),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.08)),
                      child: ElevatedButton(
                        onPressed: () async {
                          if(
                          DataControllers.to.phoneNumber.value.text.isNotEmpty  &&
                              DataControllers.to.password.value.text.isNotEmpty &&
                              DataControllers.to.gender.value.isNotEmpty  &&
                              DataControllers.to.name.value.text.isNotEmpty  &&
                              (Variables.base64Image.isNotEmpty &&  Variables.base64Image != "") &&
                              Variables.categoryCheckBoxValue
                          )
                          {

                            final signature = await SmsAutoFill().getAppSignature;


                            await DataControllers.to.postRegister(
                                DataControllers.to.name.value.text,
                                DataControllers.to.phoneNumber.value.text,
                                DataControllers.to.password.value.text,
                                DataControllers.to.gender.value,
                                "4",
                                Variables.base64Image,
                                signature
                            );

                            showToast(DataControllers.to.regsiter.value.message!);

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

                ],
              ),
            ),
          ),
        ),
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

      setState(() {
        initialProfile = false;
      });

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
