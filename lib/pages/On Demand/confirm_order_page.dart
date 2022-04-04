import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:takecare_user/pages/On%20Demand/success_order_page.dart';

import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class ConfirmOrderPage extends StatefulWidget {
  const ConfirmOrderPage({Key? key}) : super(key: key);

  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset("assets/images/baby.png"),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10, top: 15),
                          child: Text(
                            "Good Evening!",
                            style: TextStyle(fontSize: dynamicSize(0.04)),
                          )),
                      Container(
                          margin: EdgeInsets.only(left: 10, bottom: 10, top: 5),
                          child: Text(
                            "Fahim",
                            /* (
                                        DataControllers.to.userLoginResponse.value.data!
                                        .user!.fullName!.isEmpty
                                        ? " "
                                        : DataControllers.to.userLoginResponse.value
                                        .data!.user!.fullName
                                        .toString()),*/
                            style: TextStyle(fontSize: 25, color: Colors.pink),
                          )),
                    ],
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu),
                )
              ],
            ),

            Container(
              color: AllColor.shado_color,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  SizedBox(height: dynamicSize(0.03),),
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Positioned(
                        child: ClipOval(
                            child: Image.asset(
                          "assets/images/imam.png",
                          height: 80,
                          width: 80,
                        )),
                      ),
                      Positioned(
                        top: dynamicSize(0.17),
                        left: dynamicSize(0.015),
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Leya Ajanta Mondol",
                      style: TextStyle(
                          fontSize: dynamicSize(0.06),
                          color: AllColor.themeColor),
                    ),
                  ),
                  Text(
                    "is waiting to visit your place. ",
                    style: TextStyle(
                      fontSize: dynamicSize(0.05),
                    ),
                  ),
                  SizedBox(height: dynamicSize(0.1),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: AllColor.white_orange,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.info_outline,color:Colors.orange,
                                size: 35,
                              ),
                            ),
                            Expanded(
                                child: Text(
                              " After 10 mins the  order request will cancel automatically.. ",
                              style: TextStyle(
                                fontSize: dynamicSize(0.05),
                              ),
                            ))
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
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                 Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => SuccessOrderPage()));
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
