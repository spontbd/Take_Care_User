import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:takecare_user/controllers/language_controller.dart';
import 'package:takecare_user/pages/home_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool isSwitched1 = false;
  bool isSwitched2 = false;



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<LanguageController>(builder: (languageControler)  {
        bool lan = languageControler.isEnglish.value;
          return Scaffold(
            backgroundColor: AllColor.shado_color,
            appBar: AppBar(
              leading: InkWell(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.red,
                ),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(
                      MaterialPageRoute(
                          builder: (_) =>
                              HomePage()));
                },
              ),

              title: Text(
                languageControler.setting.value,
                style: TextStyle(color: Colors.black, fontSize: dynamicSize(0.03)),
              ),

              backgroundColor: Colors.white,
              elevation: 1,
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10,top: 15 ),
                  child: Card(
                    elevation: 4,
                    shadowColor: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20,
                              left: 10.0, right: 5),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                height: dynamicSize(0.13),
                                color: Colors.white,
                                child: DottedBorder(
                                  color: Colors.grey,
                                  strokeWidth: 0.5,
                                  dashPattern: [2, 2],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          languageControler.language.value,
                                          style: TextStyle(
                                              fontSize: dynamicSize(0.04),
                                              fontWeight: FontWeight.bold),
                                        ),

                                        InkWell(
                                          onTap: ()
                                          {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  Object? _site = languageControler.isEnglish.value ? 'English':'বাংলা';

                                                  return StatefulBuilder(
                                                  builder: (context,setState) {
                                                      return AlertDialog(
                                                        actions: [
                                                          Column(
                                                            children: [
                                                              ListTile(
                                                                title: const Text('English'),
                                                                leading: Radio(
                                                                  value: "English",
                                                                  groupValue: _site,
                                                                  onChanged: (var value)
                                                                  {
                                                                    setState(() {
                                                                      _site = value;
                                                                      lan = true;

                                                                    });
                                                                  },
                                                                ),
                                                              ),
                                                              ListTile(
                                                                title: const Text('বাংলা'),
                                                                leading: Radio(
                                                                  value: "বাংলা",
                                                                  groupValue: _site,
                                                                  onChanged: (var value)
                                                                  {

                                                                    setState(() {
                                                                      _site = value;
                                                                      lan = false;

                                                                    });
                                                                  },
                                                                ),
                                                              )
                                                              ,

                                                              Center(
                                                                child: SizedBox(
                                                                  height: dynamicSize(0.10),
                                                                  width: MediaQuery.of(context).size.width,
                                                                  child: Container(
                                                                    //margin: EdgeInsets.only(bottom: 5),
                                                                    /*padding: const EdgeInsets.only(left: 0, right: 5, bottom: 10),*/
                                                                    child: RaisedButton(
                                                                      shape: RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.circular(5),
                                                                      ),
                                                                      onPressed: () {
                                                                        Navigator.pop(context);

                                                                        languageControler.changeLanguage(lan);
                                                                      },
                                                                      //color: AllColor.button_color,
                                                                      textColor: Colors.black,
                                                                      child: Text(
                                                                        languageControler.change.value,
                                                                        style: TextStyle(fontSize: 18),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )

                                                            ],
                                                          ),


                                                        ],
                                                      );
                                                    }
                                                  );
                                                });

                                          },

                                          child: Text(
                                            languageControler.languageType.value,
                                            style: TextStyle(
                                                fontSize: dynamicSize(0.04),
                                                fontWeight: FontWeight.bold, color: Colors.red),
                                          ),
                                        ),                                  //ChkBox(checkValue: _value)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10,
                              left: 10.0, right: 5),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                height: dynamicSize(0.13),
                                color: Colors.white,
                                child: DottedBorder(
                                  color: Colors.grey,
                                  strokeWidth: 0.5,
                                  dashPattern: [2, 2],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          languageControler.receive_by_push_notification.value,
                                          style: TextStyle(
                                              fontSize: dynamicSize(0.04),
                                              fontWeight: FontWeight.bold),
                                        ),


                                        Flexible(
                                          child: Transform.scale(
                                              scale: 1.2,
                                              child: Switch(
                                                onChanged:(value){
                                                  setState(() {
                                                    isSwitched1 = !isSwitched1;
                                                  });
                                                },
                                                value: isSwitched1,
                                                activeColor: Colors.white,
                                                activeTrackColor: Colors.green,
                                                inactiveThumbColor: Colors.white,
                                                inactiveTrackColor: Colors.blueGrey,
                                              )
                                          ),
                                        ),
                                        //Icon(Icons.arrow_forward,color: Colors.red,)
                                        //ChkBox(checkValue: _value)
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),



                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10,
                              left: 10.0, right: 5),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                height: dynamicSize(0.13),
                                color: Colors.white,
                                child: DottedBorder(
                                  color: Colors.grey,
                                  strokeWidth: 0.5,
                                  dashPattern: [2, 2],
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text( languageControler.receive_by_mail.value ,
                                          style: TextStyle(
                                              fontSize: dynamicSize(0.04),
                                              fontWeight: FontWeight.bold),),

                                        Flexible(
                                          child: Transform.scale(
                                              scale: 1.2,
                                              child: Switch(
                                                onChanged:(value){
                                                  setState(() {
                                                    isSwitched2 = !isSwitched2;
                                                  });
                                                },
                                                value: isSwitched2,
                                                activeColor: Colors.white,
                                                activeTrackColor: Colors.green,
                                                inactiveThumbColor: Colors.white,
                                                inactiveTrackColor: Colors.blueGrey,
                                              )
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
