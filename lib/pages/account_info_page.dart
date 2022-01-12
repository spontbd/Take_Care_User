import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';
import 'package:takecare_user/widgets/check_box.dart';
import 'package:takecare_user/widgets/radio_button.dart';

class AccountInfoPage extends StatefulWidget {
  const AccountInfoPage({Key? key}) : super(key: key);

  @override
  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  @override
  Widget build(BuildContext context) {
    //Get.put(DataControllers());
    // return Obx(()
    // {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: dynamicSize(0.16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/clip_path_shape.png"),
                      //fit:BoxFit.cover
                      alignment: Alignment.topRight),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Account',
                    style: TextStyle(
                        fontSize: dynamicSize(0.05),
                        color: AllColor.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Information',
                    style: TextStyle(
                        fontSize: dynamicSize(0.03), color: AllColor.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: TextFormField(
                          // controller: DataControllers.to.name.value,
                          keyboardType: TextInputType.name,
                          obscureText: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Name*",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Image.asset("assets/images/person_icon.png")),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: dynamicSize(0.08),
                      width: MediaQuery.of(context).size.width,
                      alignment: Alignment.center,
                      child: RadioButton(),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                      height: dynamicSize(0.057),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: const Center(
                        child: Text(
                          '+88',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize:18,
                          ),
                        ),
                      ),
                    )),
                    SizedBox(
                      width: dynamicSize(0.01),
                    ),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: TextFormField(
                            //controller: DataControllers.to.phoneNumber.value,
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Mobile Number*",
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                    //flex: 3,
                    child: Container(
                  child: TextFormField(
                    //controller: DataControllers.to.password.value,
                    //keyboardType: TextInputType.name,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password*",
                    ),
                  ),
                )),
              ),
              SizedBox(
                height: dynamicSize(0.08),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CheckBox(),
                  RichText(
                    text: TextSpan(
                      text: 'By singing up I agree to the all ',
                      style: TextStyle(fontSize: dynamicSize(0.01), color: Colors.black),
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
                  )
                ],
              ),
              SizedBox(
                height: dynamicSize(0.14),
              ),
              SizedBox(
                height: dynamicSize(0.06),
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
                      /*           Fluttertoast.showToast(
                              msg: "Click",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );*/

                      /* if(
                          DataControllers.to.phoneNumber.value.text.isNotEmpty  &&
                              DataControllers.to.password.value.text.isNotEmpty &&
                              DataControllers.to.name.value.text.isNotEmpty
                          )
                          {

                            await DataControllers.to.postRegister(
                                DataControllers.to.name.value.text,
                                DataControllers.to.phoneNumber.value.text,
                                DataControllers.to.password.value.text,
                                "4"
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
                              // Get.to(OtpVerificationPage());
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const OtpVerificationPage()),
                              );
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
*/

                           Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OtpVerificationPage()),
                      );
                    },
                    color: Colors.redAccent,
                    textColor: Colors.white,
                    child: const Text(
                      "Verify",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // }
    //  );
  }
}
