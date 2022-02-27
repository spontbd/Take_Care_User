import 'package:flutter/material.dart';
import 'package:takecare_user/pages/home_page.dart';

import '../../controllers/DataContollers.dart';
import '../../controllers/language_controller.dart';
import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class CaregiverProfile extends StatefulWidget {
  const CaregiverProfile({Key? key}) : super(key: key);

  @override
  _CaregiverProfileState createState() => _CaregiverProfileState();
}

class _CaregiverProfileState extends State<CaregiverProfile> {
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
                      height: dynamicSize(.3),
                      width: dynamicSize(1.4),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30.0),
                          bottomLeft: Radius.circular(30.0),
                        ),
                      ),
                    ),
                    Positioned(
                      top: dynamicSize(0.15),
                      left: MediaQuery.of(context).size.width / 2.5,
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
                    Positioned(
                      top: dynamicSize(0.38),
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
                      top: dynamicSize(0.45),
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
                  color: AllColor.shado_color,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                         "Personal Details",
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
                ),
                Container(
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
                                  top: dynamicSize(0.03),
                                  left: dynamicSize(0.01),
                                ),
                                Positioned(
                                  child: Text(
                                    "Female",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.04),
                                        color: AllColor.button_color),
                                  ),
                                  top: dynamicSize(0.07),
                                  left: dynamicSize(0.01),
                                ),
                                Positioned(
                                    top: dynamicSize(0.13),
                                    left: dynamicSize(0.11),
                                    child:
                                    Image.asset("assets/images/gender_icon.png")),
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
                                  top: dynamicSize(0.03),
                                  left: dynamicSize(0.01),
                                ),
                                Positioned(
                                  child: Text(
                                    "5ft- 7in",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.04),
                                        color: Colors.green),
                                  ),
                                  top: dynamicSize(0.07),
                                  left: dynamicSize(0.01),
                                ),
                                Positioned(
                                    top: dynamicSize(0.14),
                                    left: dynamicSize(0.11),
                                    child:
                                    Image.asset("assets/images/height_icon.png")),
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
                                  top: dynamicSize(0.03),
                                  left: dynamicSize(0.01),
                                ),
                                Positioned(
                                  child: Text(
                                    "75 Kg",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.04),
                                        color: Colors.pink),
                                  ),
                                  top: dynamicSize(0.07),
                                  left: dynamicSize(0.01),
                                ),
                                Positioned(
                                    top: dynamicSize(0.14),
                                    left: dynamicSize(0.11),
                                    child:
                                    Image.asset("assets/images/weight_icon.png")),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),

//Personal Details
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, top: 10),
                    child: Column(
                      children: [
                        Container(
                          child: Text(
                            "Mobile Number",
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
                            "Email address",
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
                            "nazmulbd534@gmail.com",
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
                ),
//Academic Details
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
                        SizedBox(
                          height: dynamicSize(0.01),
                        ),
                        Container(
                          child: Text(
                            "Completion year: 2014",
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
                            "Hamida Nursing Institute",
                            style: TextStyle(
                                fontSize: dynamicSize(0.04), color: Colors.black45),
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
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Professional Details",
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
                ),
//Professional Details
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
                            "0125458696",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: dynamicSize(0.03),
                        ),
                        Container(
                          child: Text(
                            "Experience",
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
                            "6 Years",
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
                  height: dynamicSize(0.06),
                ),
                Container(
                  color: AllColor.shado_color,
                  height: dynamicSize(0.03),
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
                  height: dynamicSize(0.06),
                ),
                Container(
                  color: AllColor.shado_color,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Professional Details",
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
                  height: dynamicSize(0.01),
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
                            "Document",
                            style: TextStyle(
                                fontSize: dynamicSize(0.04), color: Colors.blue),
                          ),
                          alignment: Alignment.topLeft,
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "NID",
                                style: TextStyle(fontSize: dynamicSize(0.04)),
                              ),
                              TextButton(
                                onPressed: () {},
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
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "License",
                                style: TextStyle(fontSize: dynamicSize(0.04)),
                              ),
                              TextButton(
                                onPressed: () {},
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
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Chairman Certificate",
                                style: TextStyle(fontSize: dynamicSize(0.04)),
                              ),
                              TextButton(
                                onPressed: () {},
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
                        SizedBox(
                          height: dynamicSize(0.06),
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
