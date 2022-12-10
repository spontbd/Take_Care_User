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
import 'package:takecare_user/widgets/loading_widget.dart';

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


  var isLoading = false;
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
  void dispose() {
    print('dispose sign up');
    DataControllers.to.name.value.text = "";
    DataControllers.to.gender.value = "";
    DataControllers.to.phoneNumber.value.text = "";
    DataControllers.to.password.value.text = "";
    // DataControllers.to.name.refresh();
    // DataControllers.to.gender.refresh();
    // DataControllers.to.phoneNumber.refresh();
    // DataControllers.to.password.refresh();
    super.dispose();
  }

  @override
  Widget build(BuildContext size) {
    return WillPopScope(
      onWillPop: null,
      child: SafeArea(
        child: Stack(
          children: [
            Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  // padding: EdgeInsets.all(dynamicSize(.04)),
                 height: MediaQuery.of(context).size.height * 1.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
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
                          Positioned(
                            top: dynamicSize(0.15),
                            left: 20,
                            child:Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w600,
                                    color: AllColor.textColor, fontSize: dynamicSize(.05)),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Account\n',
                                      style: TextStyle(
                                          fontFamily: 'Muli',
                                          fontWeight: FontWeight.w600,
                                          fontSize: dynamicSize(.09))),
                                  const TextSpan(text: 'Information'),
                                ],
                              ),
                            ),
                          ),),
                          Positioned(
                            bottom: 0.0,
                            left: dynamicSize(.5),
                            child:  Center(
                            child: InkWell(
                              onTap: () => _getImage(),
                              child: Container(
                                alignment: Alignment.center,
                                height: dynamicSize(0.2),
                                width: dynamicSize(0.2),
                                decoration: const BoxDecoration(
                                    color: AllColor.blue_light, shape: BoxShape.circle),
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
                          ),),

                        ],
                      ),
                      ///Heading

                      SizedBox(height: dynamicSize(.2)),
                      ///Name and Image Field
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                        TextStyle(
                                            fontFamily: 'Muli',
                                            fontWeight: FontWeight.w600,
                                            fontSize: dynamicSize(0.04))),
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
                      SizedBox(height: dynamicSize(.1)),

                      ///Gender
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                            fontFamily: 'Muli',
                                            fontWeight: FontWeight.w600,
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
                      SizedBox(height: dynamicSize(.1)),

                      /// Number
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: dynamicSize(0.12),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  enabled: false,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(bottom: 0.0),
                                      border: OutlineInputBorder(),
                                      hintText: '+88',
                                      hintStyle:
                                          TextStyle(
                                              fontFamily: 'Muli',
                                              fontWeight: FontWeight.w600,
                                              fontSize: dynamicSize(0.05))),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  height: dynamicSize(0.12),
                                  child: TextField(
                                    style: TextStyle(fontFamily: 'Muli',
                                      fontWeight: FontWeight.w600,),
                                    keyboardType: TextInputType.phone,
                                    controller:  DataControllers.to.phoneNumber.value,
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Enter Your Mobile Number',
                                        hintText: '01XXXXXXXXX',
                                        hintStyle: TextStyle(fontFamily: 'Muli',
                                          fontWeight: FontWeight.w600, ) ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: dynamicSize(0.1),
                      ),
                      ///Password
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          height: dynamicSize(0.14),
                          child: BorderTextField(

                              labelText: "Password*",
                              controller: DataControllers.to.password.value,
                              obscure: true),
                        ),
                      ),

                      SizedBox(height: dynamicSize(0.02),),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),

                        child: Row(
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
                                  style: TextStyle(
                                      fontFamily: 'Muli',
                                      fontWeight: FontWeight.w600,
                                      fontSize: dynamicSize(0.035), color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Terms & Condition',
                                        recognizer: new TapGestureRecognizer()
                                          ..onTap = () => print('Tap Here onTap'),
                                        style: TextStyle(
                                            fontFamily: 'Muli',
                                            fontWeight: FontWeight.w600,
                                            color: Colors.red,
                                            decoration: TextDecoration.underline)),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(height: dynamicSize(0.02),),
                      Container(
                        margin: EdgeInsets.all( 10),
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.04)),
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

                                  if(DataControllers.to.password.value.text.length > 5) {
                                    setState(() => isLoading = true);
                                    final signature = await SmsAutoFill()
                                        .getAppSignature;


                                    await DataControllers.to.postRegister(
                                        DataControllers.to.name.value.text,
                                        DataControllers.to.phoneNumber.value
                                            .text,
                                        DataControllers.to.password.value.text,
                                        DataControllers.to.gender.value,
                                        "4",
                                        Variables.base64Image,
                                        signature
                                    );

                                    if (DataControllers.to.regsiter.value
                                        .success == true) {
                                      Get.to(OtpVerificationPage());
                                    }
                                    else {
                                      showToast(
                                          DataControllers.to.regsiter.value
                                              .message!);
                                    }

                                    setState(() => isLoading = false);
                                  }else
                                    {

                                      snackBar(context, 'Minimum Password 6 character');
                                    }

                                }else
                                {
                                  snackBar(context, 'Fil up the filed!!');
                                }
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text('Sign Up',
                                        style: TextStyle(
                                            fontFamily: 'Muli',
                                            fontWeight: FontWeight.w600,
                                            fontSize: dynamicSize(0.045))),
                                  )
                                ],
                              ),
                            )
                        ),
                      )

                    ],
                  ),
                ),
              ),
             /* bottomNavigationBar:   Container(
                margin: EdgeInsets.only(bottom: 30),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.04)),
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

                          setState(() => isLoading = true);

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

                          if(DataControllers.to.regsiter.value.success == true)
                          {
                            Get.to(OtpVerificationPage());
                          }
                          else{
                            showToast(DataControllers.to.regsiter.value.message!);
                          }

                          setState(() => isLoading = false);


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
                            padding: const EdgeInsets.all(15.0),
                            child: Text('Sign Up',
                                style: TextStyle(
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w600,
                                    fontSize: dynamicSize(0.045))),
                          )
                        ],
                      ),
                    )
                ),
              ),*/
            ),

            isLoading ? const LoadingWidget() : Container()
          ],
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
