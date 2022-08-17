import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class PastPage extends StatefulWidget {
  const PastPage({Key? key}) : super(key: key);

  @override
  _PastPageState createState() => _PastPageState();
}

class _PastPageState extends State<PastPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColor.shado_color,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: dynamicSize(0.04),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: InkWell(
                onTap: (){
                  /* Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const ServiceDetailsPage()),
                );*/
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.white),

                  //height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: AllColor.shado_color,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "On Demnad",
                                    style: TextStyle(color: Colors.black45,fontSize: dynamicSize(0.04)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "BDT 500",
                                  style: TextStyle(
                                      fontSize: dynamicSize(0.05),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ),
                        DottedBorder(
                          color: Colors.grey,
                          strokeWidth: 0.5,
                          dashPattern: [4, 4],
                          //dash patterns, 10 is dash width, 6 is space width
                          child: Container(
                            //inner container
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Attendant for Hospital Visit",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.06),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          "3.5/5",
                                          style: TextStyle(
                                              fontSize: dynamicSize(0.03),
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                              ],
                            ), //height of inner container
                            width: double
                                .infinity, //width to 100% match to parent container.
                          ),
                        ),
                        SizedBox(
                          height: dynamicSize(0.02),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "09 JAN, 2021",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: dynamicSize(0.035)),
                                ),
                              ),
                            ),
                            RaisedButton(
                                color: AllColor.themeColor,
                                elevation: 0,
                                child: new Text('Order Again',style: TextStyle(color: Colors.white,fontSize: 18),),
                                onPressed: (){}

                            ),
                          ],
                        ),
                        SizedBox(height: dynamicSize(0.01),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: dynamicSize(0.04),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: InkWell(
                onTap: (){
                  /* Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const ServiceDetailsPage()),
                );*/
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.white),

                  //height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: AllColor.shado_color,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "On Demnad",
                                    style: TextStyle(color: Colors.black45,fontSize: dynamicSize(0.04)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "BDT 500",
                                  style: TextStyle(
                                      fontSize: dynamicSize(0.05),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ),
                        DottedBorder(
                          color: Colors.grey,
                          strokeWidth: 0.5,
                          dashPattern: [4, 4],
                          //dash patterns, 10 is dash width, 6 is space width
                          child: Container(
                            //inner container
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "Attendant for Hospital Visit",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.06),
                                    fontWeight: FontWeight.bold),
                              ),
                            ), //height of inner container
                            width: double
                                .infinity, //width to 100% match to parent container.
                          ),
                        ),
                        SizedBox(
                          height: dynamicSize(0.02),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "09 JAN, 2021",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: dynamicSize(0.035)),
                                ),
                              ),
                            ),
                            TextButton(onPressed: (){}, child: Text("Submit Review",style: TextStyle(fontSize: dynamicSize(0.05),color: Colors.blue),)),
                            RaisedButton(
                                color:AllColor.themeColor,
                                elevation: 0,
                                child: new Text('Order Again',style: TextStyle(color: Colors.white,fontSize: 18),),
                                onPressed: (){}

                            ),
                          ],
                        ),
                        SizedBox(height: dynamicSize(0.01),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: dynamicSize(0.04),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: InkWell(
                onTap: (){
                  /* Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const ServiceDetailsPage()),
                );*/
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.white),

                  //height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: AllColor.shado_color,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "On Demnad",
                                    style: TextStyle(color: Colors.black45,fontSize: dynamicSize(0.04)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "BDT 500",
                                  style: TextStyle(
                                      fontSize: dynamicSize(0.05),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ),
                        DottedBorder(
                          color: Colors.grey,
                          strokeWidth: 0.5,
                          dashPattern: [4, 4],
                          //dash patterns, 10 is dash width, 6 is space width
                          child: Container(
                            //inner container
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Attendant for Hospital Visit",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.06),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          "3.5/5",
                                          style: TextStyle(
                                              fontSize: dynamicSize(0.03),
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                              ],
                            ), //height of inner container
                            width: double
                                .infinity, //width to 100% match to parent container.
                          ),
                        ),
                        SizedBox(
                          height: dynamicSize(0.02),
                        ),
                        DottedBorder(
                          color: Colors.grey,
                          strokeWidth: 0.5,
                          dashPattern: [4, 4],
                          //dash patterns, 10 is dash width, 6 is space width
                          child: Container(
                            //inner container
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Attendant for Hospital Visit",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.06),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          "3.5/5",
                                          style: TextStyle(
                                              fontSize: dynamicSize(0.03),
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                              ],
                            ), //height of inner container
                            width: double
                                .infinity, //width to 100% match to parent container.
                          ),
                        ),
                        SizedBox(
                          height: dynamicSize(0.02),
                        ),
                        DottedBorder(
                          color: Colors.grey,
                          strokeWidth: 0.5,
                          dashPattern: [4, 4],
                          //dash patterns, 10 is dash width, 6 is space width
                          child: Container(
                            //inner container
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Attendant for Hospital Visit",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.06),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          "3.5/5",
                                          style: TextStyle(
                                              fontSize: dynamicSize(0.03),
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                              ],
                            ), //height of inner container
                            width: double
                                .infinity, //width to 100% match to parent container.
                          ),
                        ),
                        SizedBox(
                          height: dynamicSize(0.02),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "09 JAN, 2021",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: dynamicSize(0.035)),
                                ),
                              ),
                            ),
                            RaisedButton(
                                color: AllColor.themeColor,
                                elevation: 0,
                                child: new Text('Order Again',style: TextStyle(color: Colors.white,fontSize: 18),),
                                onPressed: (){}

                            ),
                          ],
                        ),
                        SizedBox(height: dynamicSize(0.01),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: dynamicSize(0.04),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: InkWell(
                onTap: (){
                  /* Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const ServiceDetailsPage()),
                );*/
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color: Colors.white),

                  //height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: AllColor.shado_color,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "On Demnad",
                                    style: TextStyle(color: Colors.black45,fontSize: dynamicSize(0.04)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "31/",
                                      style: TextStyle(color: Colors.blue,fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "31 days service",
                                      style: TextStyle(color: Colors.black45,fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "BDT 500",
                                  style: TextStyle(
                                      fontSize: dynamicSize(0.05),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green),
                                ),
                              ),
                            ],
                          ),
                        ),
                        DottedBorder(
                          color: Colors.grey,
                          strokeWidth: 0.5,
                          dashPattern: [4, 4],
                          //dash patterns, 10 is dash width, 6 is space width
                          child: Container(
                            //inner container
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Dementia Care for Adult",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.06),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                /* Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          "3.5/5",
                                          style: TextStyle(
                                              fontSize: dynamicSize(0.03),
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),*/
                              ],
                            ), //height of inner container
                            width: double
                                .infinity, //width to 100% match to parent container.
                          ),
                        ),
                        SizedBox(
                          height: dynamicSize(0.02),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "09 JAN, 2021",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: dynamicSize(0.035)),
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                    ),
                                    Text(
                                      "3.5/5",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.03),
                                          color: Colors.black),
                                    ),
                                  ],
                                )),
                            RaisedButton(
                                color: AllColor.themeColor,
                                elevation: 0,
                                child: new Text('Order Again',style: TextStyle(color: Colors.white,fontSize: 18),),
                                onPressed: (){}

                            ),
                          ],
                        ),
                        SizedBox(height: dynamicSize(0.01),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: dynamicSize(0.04),
            ),
          ],
        ),
      ),
    );
  }
}
