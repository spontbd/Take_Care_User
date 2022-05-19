import 'package:flutter/material.dart';
import 'package:takecare_user/controller/data_controller.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/pages/recover_pass_page.dart';
import 'package:takecare_user/public_variables/notifications.dart';

import '../public_variables/all_colors.dart';
import '../public_variables/size_config.dart';


class ForgatePassPage extends StatefulWidget {
  const ForgatePassPage({Key? key}) : super(key: key);

  @override
  State<ForgatePassPage> createState() => _ForgatePassPageState();
}

class _ForgatePassPageState extends State<ForgatePassPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                        text: 'Forgot Your\n',
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
            SizedBox(height: dynamicSize(.03)),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8),
              child: Expanded(
                child: Container(
                  height: dynamicSize(0.12),
                  child: TextField(
                    controller: DataControllers.to.forgetPasswordMobile.value,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter Your Mobile Number*',
                        hintStyle: TextStyle(fontSize: dynamicSize(0.04))),
                  ),
                ),
              ),
            ),
            SizedBox(height: dynamicSize(.06)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.08)),
                    child: ElevatedButton(
                      onPressed: () async {

                        print("number : "+DataControllers.to.forgetPasswordMobile.value.text.toString());

                        await DataControllers.to.forgetPassMobileValidation(DataControllers.to.forgetPasswordMobile.value.text.toString());

                        if(DataControllers.to.forgetPassMobileOtpResponse.value.success!)
                          {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const RecoverPassPage()));
                          }
                        else
                          {
                            showToast(DataControllers.to.forgetPassMobileOtpResponse.value.message!);
                          }






                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Next',
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
