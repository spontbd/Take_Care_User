import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takecare_user/pages/home_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';

import '../../controllers/DataContollers.dart';
import '../../ui/variables.dart';

class ServiceRequestFormPage extends StatefulWidget {
  const ServiceRequestFormPage({Key? key}) : super(key: key);

  @override
  _ServiceRequestFormPageState createState() => _ServiceRequestFormPageState();
}

class _ServiceRequestFormPageState extends State<ServiceRequestFormPage> {
  @override
  Widget build(BuildContext size) {
    final maxLines = 5;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              /*Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => CaregiverProfile()));*/
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Services Request Form",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Provide few Information to \n connect with you.",
                  style: TextStyle(fontSize: dynamicSize(0.06)),
                ),
                SizedBox(
                  height: dynamicSize(0.07),
                ),
                TextField(
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                    ),
                    hintText: 'Your Name',
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.07),
                ),
                TextField(
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                    ),
                    hintText: 'Mobile Number*',
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.07),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text("Patient's Age",style: TextStyle(fontSize: dynamicSize(0.06)),)),
                    Expanded(
                      flex: 4,
                      child: TextField(
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: dynamicSize(0.1),
                ),
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
                                color:
                                item == DataControllers.to.gender.value
                                    ? Colors.white
                                    : AllColor.textColor),
                          ),
                        ),
                      )))
                      .toList(),
                ),
                SizedBox(
                  height: dynamicSize(0.07),
                ),
                TextField(
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                    ),
                    hintText: "Patient's Address",
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.07),
                ),
            Container(
              //margin: EdgeInsets.all(12),
              height: maxLines * 45.0,
              child: TextField(
                maxLines: maxLines,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                  ),
                  hintText: "Remarks:\n\n(ex. I need this service within 3 days...……..)",
                ),
              ),
            ),
              ],
            ),

          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          //color: AllColor.themeColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AllColor.themeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                height: dynamicSize(0.15),
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: dynamicSize(0.05), color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
