import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:takecare_user/pages/On%20Demand/categories_page.dart';
import 'package:takecare_user/pages/On%20Demand/popular_page.dart';
import 'package:takecare_user/pages/On%20Demand/taken_before_page.dart';
import 'package:takecare_user/pages/home_page.dart';

import '../../controllers/language_controller.dart';
import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class OnDemandPage extends StatefulWidget {
  const OnDemandPage({Key? key}) : super(key: key);

  @override
  _OnDemandPageState createState() => _OnDemandPageState();
}
var addedservice = false;
var showBottom = false;
var addedlist = false ;
class _OnDemandPageState extends State<OnDemandPage> {
  Icon cusIcon = Icon(Icons.search, color: Colors.black);
  Widget cusSearchbar = Text(
   "On Demand",
    style: TextStyle(color: Colors.black,fontSize: dynamicSize(0.03)),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
        builder: (lc) {
          return Scaffold(
            bottomNavigationBar: showBottom
                ? Container(
              height: dynamicSize(0.2),
              color: AllColor.button_color,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 5),
                              child: Text(
                                "On Demand",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.035),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                         addedlist? Container(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, top: 5),
                                  child: Text(
                                    "02",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.04),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only( top: 5),
                                  child: Text(
                                    " Service Added",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.04),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Icon(Icons.keyboard_arrow_up,color: Colors.white,),
                                ),
                              ],
                            ),
                          ):Container(
                           alignment: Alignment.topLeft,
                           child: Padding(
                             padding: const EdgeInsets.only(left: 8.0, top: 5),
                             child: Text(
                               "Attendant for Hospital Visit",
                               style: TextStyle(
                                   fontSize: dynamicSize(0.04),
                                   fontWeight: FontWeight.bold,
                                   color: Colors.white),
                             ),
                           ),
                         )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      color: AllColor.button_color,
                      alignment: Alignment.center,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding: EdgeInsets.only(left: 8.0),
                            child: Text(
                              "Continue",
                              style: TextStyle(
                                  fontSize: dynamicSize(0.04),
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(width: dynamicSize(0.02),),
                          Icon(Icons.arrow_forward,color: Colors.white,),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )
                : Container(height: .01),
            appBar: AppBar(
              leading: InkWell(
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.red,
                ),
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () {
                    if (cusIcon.icon == Icons.search) {
                      print("working");
                      setState(() {
                        cusIcon =
                            Icon(Icons.cancel, color: AllColor.cancel_icon_color);
                        cusSearchbar = SizedBox(
                          height: dynamicSize(0.09),
                          child: TextField(
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AllColor.search_field_color,
                              hintText: "Search",
                              prefixIcon: Icon(Icons.search),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                                borderSide: BorderSide(color: Colors.white, width: 2),
                              ),
                            ),
                            style: TextStyle(
                                color: Colors.black, fontSize: dynamicSize(0.04)),
                          ),
                        );
                      });
                    } else {
                      print("working2");
                      setState(() {
                        cusIcon = Icon(Icons.search, color: Colors.black);
                        cusSearchbar = Text(
                        "On Demand"
                          ,
                          style: TextStyle(color: Colors.black,fontSize: dynamicSize(0.03)),
                        );
                      });
                    }
                  },
                  icon: cusIcon,
                ),
              ],

             /* bottom: PreferredSize(

                preferredSize: Size(25,25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [


                    showBottom  ?
                    Text(""):
                    // Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(LanguageController.lc.selectOneOr.value,style: TextStyle(color: Colors.black,fontSize: dynamicSize(0.037)),),
                    ),
                    showBottom  ?
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(lc.done.value,style: TextStyle(color: Colors.blue,fontSize: dynamicSize(0.037)),),
                    ):
                    // Spacer(),
                    Text(""),
                  ],
                ),
              ),*/
              title: cusSearchbar,
              backgroundColor: Colors.white,
              elevation: 0,
            ),
            body: ListView(
              padding: const EdgeInsets.all(8),
              children: List.generate(
                10,
                    (index) => Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/image.png",
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 5),
                              child: Text(
                                "Injection Push",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.04),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: dynamicSize(0.02),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Details",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.035),
                                    color: Colors.purple),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            print("object");
                            // Navigator.pop(context);
                            showButtonDialog(context);
                          },
                          child: Image.asset(
                            "assets/images/add.png",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
    );
  }
  void showButtonDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: dynamicSize(0.84),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.cancel,
                          color: Colors.white,
                          size: 35,
                        ))),
                Container(
                  height: dynamicSize(0.7),
                  decoration: BoxDecoration(
                    color:AllColor.buttomdialog,
                    border: Border.all(
                      width: 3,
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0, top: 5),
                            child: Image.asset(
                              "assets/images/image.png",
                              height: 100,
                              width: 100,
                            ),
                          ),
                          Spacer(),
                          Column(
                            children: [


                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  setState(() {
                                    showBottom = true;
                                    addedlist = true;
                                  });

                                 /* Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            LanguageController.lc.youCanEditPrice.value,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: dynamicSize(0.03),
                                                color: Colors.red),
                                          ),
                                          content: Row(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 60,
                                                child: TextField(),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 40.0),
                                                child: Text(
                                                  LanguageController.lc.tk.value,
                                                  style: TextStyle(
                                                      fontSize: dynamicSize(0.03)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: dynamicSize(0.003),
                                                  width: dynamicSize(1),
                                                  color: Colors.grey,
                                                ),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      flex: 1,
                                                      child: SizedBox(
                                                        height: dynamicSize(0.10),
                                                        width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                        child: Container(

                                                          child: RaisedButton(
                                                            shape:
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                bottomLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                               Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
                                                            },
                                                            //color: AllColor.button_color,
                                                            textColor: Colors.black,
                                                            child:  Text(
                                                              LanguageController.lc.cancel.value,
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: dynamicSize(0.1),
                                                      width: dynamicSize(0.003),
                                                      color: Colors.grey,
                                                    ),
                                                    Flexible(
                                                      flex: 1,
                                                      child: SizedBox(
                                                        height: dynamicSize(0.10),
                                                        width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                        child: Container(
                                                            decoration: BoxDecoration(
                                                          border: Border.all(
                                                            width: 1,
                                                            color: Colors.black,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius.circular(5.0),
                                                        ),
                                                          //margin: EdgeInsets.only(bottom: 5),
                                                          padding: const EdgeInsets.only(left: 0, right: 5, bottom: 10),
                                                          child: RaisedButton(
                                                            shape:
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius.only(
                                                                bottomRight:
                                                                Radius.circular(
                                                                    10.0),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(context);
                                                              setState(() => showBottom = true);
                                                              //showBottomSheetAddedDialog(context);
                                                            },
                                                            //color: AllColor.button_color,
                                                            textColor: Colors.black,
                                                            child:  Text(
                                                              LanguageController.lc.add.value,
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .lightBlue),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      });*/
                                },
                                child: Image.asset(
                                  "assets/images/added_now_button.png",
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 5),
                        child: Text(
                          "Attendant for Hospital Visit",
                          style: TextStyle(
                              fontSize: dynamicSize(0.05),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 5),
                        child: Text(
                          "Caregiver/ Nurse will go with patient when he/she needs to go hospital/Clinic for diagnosis or any major treatment like Dialysisor anything else. Caregiver/Nurse will stay with patient totaltime & get back with patient's premises.",
                          style: TextStyle(
                            fontSize: dynamicSize(0.03),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

 /* void BottomSheetAddedListDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bcs) {
          return Container(
            height: dynamicSize(0.6),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: Colors.white,
                          size: 35,
                        ))),
                Container(
                  height: dynamicSize(0.45),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: new List.generate(
                      8,
                          (index) => Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/treatment.png",
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 5),
                                    child: Text(
                                      "Injection Push",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.04),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: dynamicSize(0.02),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Details",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.035),
                                          color: Colors.purple),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            LanguageController.lc.doYouWantToRemove.value,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: dynamicSize(0.03),
                                                color: Colors.red),
                                          ),
                                          actions: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: dynamicSize(0.07),
                                                ),
                                                Container(
                                                  height: dynamicSize(0.003),
                                                  width: dynamicSize(1),
                                                  color: Colors.grey,
                                                ),
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      flex: 1,
                                                      child: SizedBox(
                                                        height:
                                                        dynamicSize(0.10),
                                                        width: MediaQuery.of(
                                                            context)
                                                            .size
                                                            .width,
                                                        child: Container(
                                                          *//*decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 1,
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(0.0),
                                                    ),*//*
                                                          //margin: EdgeInsets.only(bottom: 5),
                                                          *//*padding: const EdgeInsets.only(left: 0, right: 5, bottom: 10),*//*
                                                          child: RaisedButton(
                                                            shape:
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                    10.0),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              *//* Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );*//*
                                                            },
                                                            //color: AllColor.button_color,
                                                            textColor:
                                                            Colors.black,
                                                            child:  Text(
                                                              LanguageController.lc.yes.value,
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: dynamicSize(0.1),
                                                      width: dynamicSize(0.003),
                                                      color: Colors.grey,
                                                    ),
                                                    Flexible(
                                                      flex: 1,
                                                      child: SizedBox(
                                                        height:
                                                        dynamicSize(0.10),
                                                        width: MediaQuery.of(
                                                            context)
                                                            .size
                                                            .width,
                                                        child: Container(
                                                          *//*  decoration: BoxDecoration(
                                                      border: Border.all(
                                                        width: 1,
                                                        color: Colors.black,
                                                      ),
                                                      borderRadius:
                                                      BorderRadius.circular(5.0),
                                                    ),*//*
                                                          //margin: EdgeInsets.only(bottom: 5),
                                                          *//*padding: const EdgeInsets.only(left: 0, right: 5, bottom: 10),*//*
                                                          child: RaisedButton(
                                                            shape:
                                                            RoundedRectangleBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .only(
                                                                bottomRight: Radius
                                                                    .circular(
                                                                    10.0),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                              *//* Navigator.pop(
                                                                  context);
                                                                setState(()=>addedservice=true);*//*
                                                              Navigator
                                                                  .pushReplacement(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>

                                                                    const ServiceSetup()),
                                                              );
                                                              //showBottomSheetAddedDialog(context);
                                                            },
                                                            //color: AllColor.button_color,
                                                            textColor:
                                                            Colors.black,
                                                            child:  Text(
                                                              LanguageController.lc.no.value,
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .lightBlue),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      });
                                },
                                child: Image.asset(
                                  "assets/images/demand_service_cross_button.png",
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }*/
}
