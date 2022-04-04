import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takecare_user/pages/On%20Demand/image_page.dart';
import 'package:takecare_user/pages/On%20Demand/on_demand_page.dart';
import 'package:takecare_user/pages/home_page.dart';

import '../../controllers/DataContollers.dart';
import '../../controllers/language_controller.dart';
import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';
import 'document_page.dart';

class CaregiverProfile extends StatefulWidget {
  const CaregiverProfile({Key? key}) : super(key: key);

  @override
  _CaregiverProfileState createState() => _CaregiverProfileState();
}

class _CaregiverProfileState extends State<CaregiverProfile> {
   bool requestView = false;
   bool requestButton = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.white,
            title: Text("Caregiver Profile"),
            leading: InkWell(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomePage()));
              },
              child: Image.asset("assets/images/cross.png"),
            ),
            elevation: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  overflow: Overflow.visible,
                  children: [
                    Container(
                      height: dynamicSize(.4),
                      width: dynamicSize(1.4),
                      decoration: BoxDecoration(
                        color: AllColor.themeColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                        ),
                      ),
                    ),
                    Positioned(
                      top: dynamicSize(0.24),
                      left: MediaQuery.of(context).size.width / 2.5,
                      child: InkWell(
                        onTap: (){
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (_) => ImageViewPage()));
                        },
                        child: Container(
                          width: 110.0,
                          height: 110.0,
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                color: Colors.white,
                                width: 2.0,
                                style: BorderStyle.solid),
                            image: new DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/baby.png"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: dynamicSize(0.5),
                      left: MediaQuery.of(context).size.width / 2.25,
                      child: Container(
                          width: dynamicSize(0.18),
                          //color: Colors.red,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orangeAccent,
                              ),
                              Text(
                                "3.5",
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                "/5",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                    Positioned(
                      top: dynamicSize(0.6),
                      left: MediaQuery.of(context).size.width / 2.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Fahim",
                           // ("${DataControllers.to.userLoginResponse.value.data!.user!.fullName}"),
                            style: TextStyle(
                                fontSize: dynamicSize(0.05),
                                fontWeight: FontWeight.bold,
                                color: Colors.pinkAccent),
                          ),
                          Row(
                            children: [
                              Text("Nurse ."),
                              Text("232 patient served"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: dynamicSize(0.32),
                ),

                Container(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              color: AllColor.white_blue,
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Text(
                                      "Gender",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.03),
                                          color: Colors.grey),
                                    ),
                                    top: dynamicSize(0.05),
                                    left: dynamicSize(0.03),
                                  ),
                                  Positioned(
                                    child: Text(
                                      "Female",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.04),
                                          color: AllColor.button_color,fontWeight: FontWeight.bold),
                                    ),
                                    top: dynamicSize(0.09),
                                    left: dynamicSize(0.03),
                                  ),
                                  Positioned(
                                      top: dynamicSize(0.18),
                                      left: dynamicSize(0.15),
                                      child:
                                      Image.asset("assets/images/p1.png")),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              color: AllColor.white_yellow,
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Text(
                                      "Height",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.03),
                                          color: Colors.grey),
                                    ),
                                    top: dynamicSize(0.05),
                                    left: dynamicSize(0.03),
                                  ),
                                  Positioned(
                                    child: Text(
                                      "5ft- 7in",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.04),
                                          color: Colors.green),
                                    ),
                                    top: dynamicSize(0.09),
                                    left: dynamicSize(0.03),
                                  ),
                                  Positioned(
                                      top: dynamicSize(0.18),
                                      left: dynamicSize(0.15),
                                      child:
                                      Image.asset("assets/images/p2.png")),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              color: AllColor.white_pink,
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Text(
                                      "Weight",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.03),
                                          color: Colors.grey),
                                    ),
                                    top: dynamicSize(0.05),
                                    left: dynamicSize(0.03),
                                  ),
                                  Positioned(
                                    child: Text(
                                      "75 Kg",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.04),
                                          color: Colors.pink),
                                    ),
                                    top: dynamicSize(0.09),
                                    left: dynamicSize(0.03),
                                  ),
                                  Positioned(
                                      top: dynamicSize(0.18),
                                      left: dynamicSize(0.15),
                                      child:
                                      Image.asset("assets/images/p3.png")),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 100,
                              width: 100,
                              color: AllColor.white_orange,
                              child: Stack(
                                children: [
                                  Positioned(
                                    child: Text(
                                      "Experience",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.03),
                                          color: Colors.grey),
                                    ),
                                    top: dynamicSize(0.05),
                                    left: dynamicSize(0.03),
                                  ),
                                  Positioned(
                                    child: Text(
                                      "2 yrs",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.04),
                                          color: Colors.pink),
                                    ),
                                    top: dynamicSize(0.09),
                                    left: dynamicSize(0.03),
                                  ),
                                  Positioned(
                                      top: dynamicSize(0.18),
                                      left: dynamicSize(0.15),
                                      child:
                                      Image.asset("assets/images/p4.png")),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    )),

//Personal Details
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "BNMC Number",
                            style: TextStyle(
                                fontSize: dynamicSize(0.04), color: Colors.blue),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "01758351395",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.03),
                        ),
                        Container(
                          child: Text(
                            "Language",
                            style: TextStyle(
                                fontSize: dynamicSize(0.04), color: Colors.blue),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "Bangla, English",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.06),
                ),
                Container(
                  color: AllColor.shado_color,
                  height: dynamicSize(0.015),
                ),
             /*   Container(
                  color: AllColor.shado_color,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Academic Details",
                          style: TextStyle(
                            fontSize: dynamicSize(0.04),
                          ),
                        ),
                      ),
                      TextButton(
                        child: Text(
                          "Edit",
                          style: TextStyle(
                              fontSize: dynamicSize(0.04), color: Colors.black),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),*/
//Academic Details
                SizedBox(
                  height: dynamicSize(0.05),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Specialty within Domain:",
                            style: TextStyle(
                                fontSize: dynamicSize(0.04), color: Colors.blue),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "- Specialty 01",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "- Specialty 02",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "- Specialty 03",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.05),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Other Specility",
                            style: TextStyle(
                                fontSize: dynamicSize(0.04), color: Colors.black45),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "- Specialty 01",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "- Specialty 02",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "- Specialty 03",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.05),
                ),
                Container(
                  color: AllColor.shado_color,
                  height: dynamicSize(0.015),
                ),

                SizedBox(
                  height: dynamicSize(0.02),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Personal Commitment",
                            style: TextStyle(
                                fontSize: dynamicSize(0.04), color: Colors.blue),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "I will do my best to make you comfortable. I strongly believe in ethics; as a health provider being ethical is not just a remembered value, but a strongly observed one.",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.05),
                ),
                Container(
                  color: AllColor.shado_color,
                  height: dynamicSize(0.015),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Education",
                            style: TextStyle(
                                fontSize: dynamicSize(0.04), color: Colors.blue),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "Diploma in Nursing from SPKS Medical Institute",
                            style: TextStyle(
                                fontSize: dynamicSize(0.04), color: Colors.black),
                          ),
                          alignment: Alignment.topLeft,
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.06),
                ),

//Professional Details


                SizedBox(
                  height: dynamicSize(0.06),
                ),
                Container(
                  color: AllColor.shado_color,
                  height: dynamicSize(0.015),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Past experience",
                            style: TextStyle(
                                fontSize: dynamicSize(0.04), color: Colors.blue),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "Square Hospital Limited",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "Designatio",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Text(
                                "Duration:",
                                style: TextStyle(fontSize: dynamicSize(0.04)),
                              ),
                              SizedBox(
                                width: dynamicSize(0.01),
                              ),
                              Text(
                                "5 years",
                                style: TextStyle(fontSize: dynamicSize(0.04)),
                              ),
                            ],
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.04),
                ),
                Container(
                  color: AllColor.shado_color,
                  height: dynamicSize(0.015),
                ),
                SizedBox(
                  height: dynamicSize(0.04),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Award",
                            style: TextStyle(
                                fontSize: dynamicSize(0.04), color: Colors.blue),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "- Award title 01",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "- Award title 01",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: dynamicSize(0.05),
                ),
                Container(
                  color: AllColor.shado_color,
                  height: dynamicSize(0.015),
                ),
                SizedBox(
                  height: dynamicSize(0.04),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "Document",
                            style: TextStyle(
                                fontSize: dynamicSize(0.04), color: Colors.blue),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(height: dynamicSize(.03),),
                        Text("If you need to see the document of this caregiver, please request us to get the view. We will give you access after some while."),
                        SizedBox(height: dynamicSize(.03),),
                        InkWell(
                          onTap: (){
                            setState(() {
                              requestView = true;
                              requestButton = false;
                            });
                          },
                          child: Visibility(
                            visible: requestButton,
                            child: Container(
                              width: dynamicSize(0.4),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(18),
                                child: Text('Sent Request',style: TextStyle(fontSize: dynamicSize(0.05)),),
                              ),
                              decoration: BoxDecoration(
                                color: AllColor.shado_color,
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                          ),
                        ),
                       SizedBox(height: dynamicSize(0.02),),
                       Visibility(
                         visible: requestView,
                         child: Container(
                           child: Row(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text(
                                 "All Documents",
                                 style: TextStyle(fontSize: dynamicSize(0.04)),
                               ),
                               TextButton(
                                 onPressed: () {
                                   Navigator.of(context).pushReplacement(
                                       MaterialPageRoute(builder: (_) => DocumentPage()));

                                 },
                                 child: Text(
                                   "VIEW",
                                   style: TextStyle(
                                       fontSize: dynamicSize(0.04),
                                       color: Colors.pink),
                                 ),
                               )
                             ],
                           ),
                           alignment: Alignment.topLeft,
                         ),
                       ),
                        SizedBox(
                          height: dynamicSize(0.06),
                        ),
                        SizedBox(
                          height: dynamicSize(0.04),
                        ),
                        SizedBox(
                          height: dynamicSize(0.05),
                        ),
                        Container(
                          color: AllColor.shado_color,
                          height: dynamicSize(0.015),
                        ),
                        SizedBox(
                          height: dynamicSize(0.05),
                        ),
                        Container(
                          child: Text(
                            "Moments",
                            style: TextStyle(
                                fontSize: dynamicSize(0.04), color: Colors.blue),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                            child: Wrap(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/images/image.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/images/image.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/images/image.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/images/image.png"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset("assets/images/image.png"),
                                ),
                              ],
                            )
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ));
  }
}
