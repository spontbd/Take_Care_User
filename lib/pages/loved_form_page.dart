import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/DataContollers.dart';
import '../public_variables/all_colors.dart';
import '../public_variables/size_config.dart';
import '../ui/variables.dart';
import 'home_page.dart';
import 'loved_ones_page.dart';

class LovedFormPage extends StatefulWidget {
  const LovedFormPage({Key? key}) : super(key: key);

  @override
  _LovedFormPageState createState() => _LovedFormPageState();
}

class _LovedFormPageState extends State<LovedFormPage> {
  @override
  Widget build(BuildContext size) {
    final maxLines = 5;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LovedOnesPage()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.pink,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Loved One's",
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
                    hintText: ' Name',
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
                  height: dynamicSize(0.08),
                ),
                Row(
                  children: Variables.FahilyList
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
