import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/pages/sign_in_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/notifications.dart';
import 'package:takecare_user/public_variables/size_config.dart';

TextEditingController newPassword = TextEditingController();
TextEditingController otpValue = TextEditingController();
//TextEditingController otp = TextEditingController();



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
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: dynamicSize(0.47),
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
                                    fontSize: dynamicSize(.08))),
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
                    SizedBox(height: dynamicSize(.02)),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 10),
                      child: PinFieldAutoFill(
                        autoFocus: false,
                        // controller: _recoveryData,
                        decoration: UnderlineDecoration(
                          textStyle: TextStyle(fontSize: 20, color: Colors.black),
                          colorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
                        ),
                        onCodeSubmitted: (code) {},
                        onCodeChanged: (code) {
                          DataControllers.to.otp_forget.value.text = code.toString();
                          //  completedPin = code.toString();
                        },
                      ),
                    ),

                    SizedBox(height: dynamicSize(.05)),
                    SizedBox(height: dynamicSize(.06)),

                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.08)),
                        child: ElevatedButton(
                          onPressed: () async {

                            await DataControllers.to.forgetPassConfirmMethod(DataControllers.to.forgetPasswordMobile.value.text.toString(),DataControllers.to.otp_forget.value.text,newPassword.value.text.toString());
                            showToast(DataControllers.to.forgetPassConfirm.value.message!);
                            if(DataControllers.to.forgetPassConfirm.value.success!) {

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const SignInPage()));
                            }

                          },
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
          ),
        ));
  }
}
