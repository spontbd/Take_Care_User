import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takecare_user/pages/On%20Demand/confirm_order_page.dart';

import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class OrderInformationPage extends StatefulWidget {
  const OrderInformationPage({Key? key}) : super(key: key);

  @override
  _OrderInformationPageState createState() => _OrderInformationPageState();
}

class _OrderInformationPageState extends State<OrderInformationPage> {
  bool orderList = false;
  bool editInformation = false;


  late FocusNode name;



  @override
  void initState() {
    name = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AllColor.shado_color,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Order Information ",
            style: TextStyle(color: Colors.black),
          ),
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
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: dynamicSize(0.03),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Services (02)",
                        style: TextStyle(fontSize: dynamicSize(0.05)),
                      ),
                      Row(
                        children: [
                          Text(
                            "Total:",
                            style: TextStyle(fontSize: dynamicSize(0.05)),
                          ),
                          Text(
                            "1300/-",
                            style: TextStyle(fontSize: dynamicSize(0.05)),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  orderList =true;
                                });
                              },
                              icon: orderList?Icon(
                                Icons.keyboard_arrow_up,
                                color: AllColor.themeColor,
                              ):Icon(
                                Icons.keyboard_arrow_down,
                                color: AllColor.themeColor,
                              ))
                        ],
                      )
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              SizedBox(
                height: dynamicSize(0.02),
              ),
              Visibility(
                visible: orderList,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Base Price",
                              style: TextStyle(fontSize: dynamicSize(0.05)),
                            ),
                            Text(
                              "1,300/-",
                              style: TextStyle(fontSize: dynamicSize(0.05)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: dynamicSize(0.06),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Coupon",
                              style: TextStyle(fontSize: dynamicSize(0.05)),
                            ),
                            Text(
                              "- 250/-",
                              style: TextStyle(fontSize: dynamicSize(0.05)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: dynamicSize(0.06),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontSize: dynamicSize(0.05),
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "950/-*",
                              style: TextStyle(
                                  fontSize: dynamicSize(0.05),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: dynamicSize(0.03),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 15, bottom: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Visiting Address",
                        style: TextStyle(fontSize: dynamicSize(0.05)),
                      ),
                      SizedBox(
                        height: dynamicSize(0.02),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.green,
                          ),
                          Text("Mirpur Shopping Complex, Mirpur 01",
                              style: TextStyle(
                                  fontSize: dynamicSize(0.05),
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, top: 15, bottom: 15),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Booking Information",
                      style: TextStyle(
                          fontSize: dynamicSize(0.06),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,top: 10,bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Service for Whom",
                            style: TextStyle(
                                fontSize: dynamicSize(0.05),
                                color: AllColor.themeColor),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  editInformation = true;

                                  name = FocusNode();
                                  name.requestFocus();
                                });
                              },
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    color: AllColor.themeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: dynamicSize(0.05)),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: dynamicSize(0.03),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex:1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Name ",
                                  style: TextStyle(fontSize: dynamicSize(0.05)),
                                ),
                                Text(
                                  ": ",
                                  style: TextStyle(fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              //height: dynamicSize(0.2),
                                width: dynamicSize(.5),
                                child: TextField (
                                 // controller: et_gallery,
                                enabled: editInformation,
                                focusNode: name,
                                  cursorHeight: dynamicSize(0.06),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Rana Talukder',hintStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)

                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Age ",
                                  style: TextStyle(fontSize: dynamicSize(0.05)),
                                ),
                                Text(
                                  ": ",
                                  style: TextStyle(fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),

                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              //height: dynamicSize(0.2),
                              width: dynamicSize(.5),
                              child: TextField (
                               // controller: et_gallery,
                                enabled: editInformation,
                                cursorHeight: dynamicSize(0.06),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: '67',hintStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)

                                ),
                              )
                            ),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex:1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Contact Number",style: TextStyle(fontSize: dynamicSize(0.05))
                                ),
                                Text(
                                  ": ",style: TextStyle(fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold)
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              //height: dynamicSize(0.2),
                                width: dynamicSize(.5),
                                child: TextField (
                                 // controller: et_gallery,
                                enabled: editInformation,

                                  cursorHeight: dynamicSize(0.06),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: '01758351395',hintStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)

                                  ),
                                )
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8, top: 15, bottom: 15),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Additional Note",
                      style: TextStyle(
                          fontSize: dynamicSize(0.06),
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Container(
                height: dynamicSize(0.25),
                child:    Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField (
                    cursorHeight: dynamicSize(0.06),
                    decoration: InputDecoration(
                      
                        border: InputBorder.none,
                        hintText: '(ex. Bring a syringe of 5ml..……..)',hintStyle: TextStyle(fontSize: dynamicSize(0.035))
                    ),
                  ),
                ),
                color: Colors.white,
              ),
              SizedBox(
                height: dynamicSize(0.03),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Coupon Code",
                        style: TextStyle(fontSize: dynamicSize(0.05)),
                      ),
                     TextButton(onPressed: (){}, child: Text("+ Add Coupon Code",style: TextStyle(fontSize: dynamicSize(0.06),color: Colors.blue),))
                    ],
                  ),
                ),
                color: Colors.white,
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          //color: AllColor.themeColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                 Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => ConfirmOrderPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AllColor.themeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                height: dynamicSize(0.15),
                child: Text(
                  "Confirm this Order",
                  style: TextStyle(
                      fontSize: dynamicSize(0.05), color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
