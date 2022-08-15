import 'dart:convert';
import 'dart:developer';
import 'dart:io';
// import 'package:barikoi_maps_place_picker/barikoi_maps_place_picker.dart';
// import 'package:maplibre_gl/mapbox_gl.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/controllers/language_controller.dart';
import 'package:takecare_user/model/RegisterResponse.dart';
import 'package:takecare_user/pages/forgate_pass_page.dart';
import 'package:takecare_user/pages/home_page.dart';
import 'package:takecare_user/pages/sign_up_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/notifications.dart';
import 'package:takecare_user/public_variables/size_config.dart';
import 'package:takecare_user/public_variables/variables.dart';
import 'package:takecare_user/widgets/AnimatedToggleButton.dart';
import 'package:takecare_user/widgets/loading_widget.dart';
import 'package:takecare_user/widgets/text_field_tile.dart';

import '../ui/common.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  // static final initLatLng = LatLng(23.8567844, 90.213108);

  @override
  _SignInPageState createState() => _SignInPageState();
}

bool signIn = true;

class _SignInPageState extends State<SignInPage> {
  bool english = true;
  // late PickResult selectedPlace;
  bool language = true;

  final TextEditingController _mobileNumber = TextEditingController(text: '');
  final TextEditingController _signInPass = TextEditingController(text: '');

  /// Loading
  bool isLoading = false;

  onProgressBar(bool progress) {
    setState(() {
      isLoading = progress;
    });
  }

  @override
  void initState() {
    sharePreferences(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GetBuilder<DataControllers>(builder: (dataControllers) {
      return Stack(
        children: [
          Scaffold(
            /*resizeToAvoidBottomInset: false,*/
            body: _bodyUI(size, dataControllers),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.08)),
              child: Container(height: 0),
            ),
          ),
          isLoading ? const LoadingWidget() : Container()
        ],
      );
    });
  }

  Widget _bodyUI(Size size, DataControllers dataControllers) => SafeArea(
        child: GetBuilder<LanguageController>(builder: (lg) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.center,
                  children: [
                    ///Nurse Image
                    Positioned(
                        top: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Image.asset('assets/images/home_header.png',
                            fit: BoxFit.fill)),

                    ///Bottom
                    Positioned(
                        bottom: 0.0,
                        left: 0.0,
                        right: 0.0,
                        child: Image.asset('assets/images/image_below.png',
                            fit: BoxFit.fill)),

                    ///English Bangla toggle button
                    language
                        ? GetBuilder<LanguageController>(
                            builder: (languageController) {
                            return Positioned(
                              right: dynamicSize(0.05),
                              top: dynamicSize(0.04),
                              child: AnimatedToggleButton(
                                values: const ['English', 'বাংলা'],
                                toggleValue: languageController.isEnglish.value,
                                width: dynamicSize(.4),
                                height: dynamicSize(0.08),
                                fontSize: dynamicSize(0.035),
                                onToggleCallback: (v) async {
                                  setState(() => english = !english);
                                },
                              ),
                            );
                          })
                        : Container(),

                    ///Main Content
                    Positioned(
                      top: /*signIn ?*/ dynamicSize(.6) /*: dynamicSize(.75)*/,
                      child: /*signIn ?*/ _loginWidget(
                          size, lg) /*: _signUpWidget(size)*/,
                    ),

                    ///Signin Signup Button
                    GetBuilder<LanguageController>(
                        builder: (languageController) {
                      return Positioned(
                        top: dynamicSize(.6),
                        child: AnimatedToggleButton(
                          values: [
                            (languageController.sigIn.value),
                            (languageController.signUp.value)
                          ],
                          toggleValue: true,
                          width: dynamicSize(0.9),
                          height: dynamicSize(0.12),
                          fontSize: dynamicSize(0.045),
                          onToggleCallback: (v) async {
                            if (signIn) {
                              Get.to(SignUpPage());
                              setState(() {
                                signIn = true;
                              });
                            } else {
                              setState(() {
                                signIn = true;
                              });
                            }

                            /*  setState(() => );*/
                          },
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          );
        }),
      );

  Widget _loginWidget(Size size, LanguageController lng) => Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          ///White Background
          Container(
            width: dynamicSize(.9),
            height: dynamicSize(0.7),
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 5),
                      color: Colors.grey.shade400,
                      blurRadius: 10)
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(dynamicSize(.06)),
                  topRight: Radius.circular(dynamicSize(.06)),
                  bottomLeft: Radius.circular(dynamicSize(.02)),
                  bottomRight: Radius.circular(dynamicSize(.02)),
                )),
          ),

          ///Text Field
          SizedBox(
              width: dynamicSize(.9),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: dynamicSize(0.1)),
                  TextFieldBuilder(
                      controller: _mobileNumber,
                      hintText: lng.mobileNumber.value),
                  SizedBox(height: dynamicSize(0.02)),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: dynamicSize(0.04)),
                    child: Divider(
                        height: 0.0, color: Colors.grey.shade400, thickness: 5),
                  ),
                  TextFieldBuilder(
                      controller: _signInPass,
                      hintText: lng.password.value,
                      obscure: true),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => const ForgotPassPage()));
                    },
                    child: Text(lng.forgotPassword.value,
                        style: TextStyle(
                            color: Colors.pink, fontSize: dynamicSize(0.035))),
                  )
                ],
              )),

          Positioned(
            bottom: -dynamicSize(0.065),
            child: ElevatedButton(
              onPressed: () async {
                //isLoading = true;

                if (_mobileNumber.value.text.isNotEmpty &&
                    _signInPass.value.text.isNotEmpty) {
                  loginClass(_mobileNumber.value.text.toString(),
                      _signInPass.value.text.toString());
                } else {
                  Fluttertoast.showToast(
                      msg: "Fil up the filed!!",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);

                  onProgressBar(false);
                  // isLoading = false;
                }

                // onProgressBar(false);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: dynamicSize(0.04), vertical: dynamicSize(0.04)),
                child: Text('Sign In',
                    style: TextStyle(
                        fontSize: dynamicSize(0.045),
                        fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
      );

  Widget _signUpWidget(Size size) => Container(
        width: dynamicSize(1),
        //height: dynamicSize(0.65),
        padding: EdgeInsets.all(dynamicSize(.04)),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 5),
                  color: Colors.grey.shade400,
                  blurRadius: 10)
            ],
            borderRadius: BorderRadius.all(Radius.circular(dynamicSize(.02)))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: dynamicSize(.1)),

            ///Heading
            RichText(
              text: TextSpan(
                style: TextStyle(
                    color: AllColor.textColor, fontSize: dynamicSize(.05)),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Account\n',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: dynamicSize(.07))),
                  const TextSpan(text: 'Information'),
                ],
              ),
            ),
            SizedBox(height: dynamicSize(.06)),

            ///Name and Image Field
            Row(
              children: [
                Expanded(
                    child: BorderTextField(
                        controller: DataControllers.to.name.value,
                        hintText: 'Name*')),
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
                            color: Colors.white, size: dynamicSize(.1))
                        : ClipRRect(
                            borderRadius: BorderRadius.all(
                                Radius.circular(dynamicSize(0.1))),
                            child: Image.file(Variables.imageFile,
                                height: dynamicSize(0.15),
                                width: dynamicSize(0.15),
                                fit: BoxFit.cover)),
                  ),
                ),
              ],
            ),
            SizedBox(height: dynamicSize(.08)),

            ///Gender
            Row(
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
                                color: item == DataControllers.to.gender.value
                                    ? Colors.white
                                    : AllColor.textColor),
                          ),
                        ),
                      )))
                  .toList(),
            ),
            SizedBox(height: dynamicSize(.08)),

            BorderTextField(
                controller: DataControllers.to.password.value,
                hintText: 'Password*',
                obscure: true),
            SizedBox(height: dynamicSize(.02)),
          ],
        ),
      );

  void _getImage() async {
    final ImagePicker _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);
    // var choosedimage = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() => Variables.imageFile = File(image.path));

      List<int> imageBytes = Variables.imageFile.readAsBytesSync();
      Variables.base64Image = base64Encode(imageBytes);

      print("image : " + Variables.base64Image);
    } else {
      showToast('Image not selected');
    }
  }

  var userId;

  var pass;

  void sharePreferences(BuildContext context) async {
    await Common.init();

    try {
      // storeSharedPreferences = await SharedPreferences.getInstance();

      userId = Common.storeSharedPreferences.getString("userid");
      pass = Common.storeSharedPreferences.getString("pass");

      print("user Id : " + userId);
      print("Pass : " + pass);

      if (userId != "" && userId != null && pass != "" && pass != null) {
        loginClass(userId, pass);
      }
    } catch (e) {}
  }

  void loginClass(String user, String pass) async {
    onProgressBar(true);

    try {
      await DataControllers.to.postLogin(user, pass);
    } catch (e) {
      onProgressBar(false);
      //  isLoading = false;
    }
    if (DataControllers.to.userLoginResponse.value.success == true)
    {
      onProgressBar(false);
      // isLoading = false;
      // Get.offAll(HomePage());

      bearerToken = "Bearer " +
          DataControllers.to.userLoginResponse.value.data!.token.toString();


      await DataControllers.to.getSlider();
      await DataControllers.to.getAllCategories();
      Common.storeSharedPreferences.setString('userid', user);
      Common.storeSharedPreferences.setString('pass', pass);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    }else
      {
        onProgressBar(false);
        showToast(DataControllers.to.userLoginResponse.value.message!);
      }
  }
}
