import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/pages/order_history/package_details/RequestAcceptDetails.dart';
import 'package:takecare_user/pages/order_history/runing_details/running_package_details.dart';

import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class CurrentPage extends StatefulWidget {
  const CurrentPage({Key? key}) : super(key: key);

  @override
  _CurrentPageState createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {

  var orderAcceped = false;
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
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    "Package",
                                    style: TextStyle(
                                        fontFamily: 'Muli',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black45,fontSize: dynamicSize(0.04)),
                          ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Text(
                                  "07 days service",
                                  style: TextStyle(color: Colors.black45,fontSize: dynamicSize(0.045),
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: dynamicSize(0.045),
                                      fontFamily: 'Muli',
                                      fontWeight: FontWeight.w600,
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
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    "Dementia Care for Adult",
                                    style: TextStyle(
                                        fontFamily: 'Muli',
                                        fontWeight: FontWeight.w700,
                                        fontSize: dynamicSize(0.05),
                                       ),
                                  ),
                                ),
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
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Text(
                                      "09 JAN, 2021",
                                      style: TextStyle(
                                          fontFamily: 'Muli',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black,
                                          fontSize: dynamicSize(0.035)),
                                    ),
                                  ),
                                  SizedBox(width: dynamicSize(0.09),),
                                  Visibility(
                                    visible: orderAcceped,
                                    child: Padding(
                                      padding: const EdgeInsets.all(7.0),
                                      child:   Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.orange,
                                          ),
                                          Text(
                                            "3.5/5 (avg.)",
                                            style: TextStyle(
                                                fontFamily: 'Muli',
                                                fontWeight: FontWeight.w600,
                                                fontSize: dynamicSize(0.03),
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            orderAcceped? MaterialButton(
                                color: Colors.green,
                                elevation: 0,
                                child: new Text('Renew',style: TextStyle(
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,fontSize: 18),),
                                onPressed: (){}

                            ):
                            Row(
                              children: [
                          /*    RaisedButton(
                                color: Colors.grey,
                                  elevation: 0,
                                  child: new Text('Reject',style: TextStyle(color: Colors.white,fontSize: 18),),
                                  onPressed: (){}

                              ),*/
                                // SizedBox(width: dynamicSize(0.05),),
                                MaterialButton(
                                  color: AllColor.button_color,
                                    elevation: 0,
                                    child: new Text('Details',style: TextStyle(
                                        fontFamily: 'Muli',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,fontSize: 18),),
                                    onPressed: (){
                                    setState(() async{
                                      orderAcceped = true;
                                      Navigator.of(context)
                                          .push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  RequestAcceptDetailsScreen()));


                                    });
                                    }

                                ),
                              ],
                            ),

                          ],
                        ),
                        Visibility(
                          visible: orderAcceped,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0,bottom: 8),
                            child: Container(
                             color: AllColor.white_orange,
                              child: Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.info_outline,color: AllColor.blackOrange,),
                                    SizedBox(width: dynamicSize(0.03),),
                                    Flexible(
                                      child: Text(
                                        "Reordering now will ensure continuation of this service with the same Provider.",
                                        style: TextStyle(
                                            fontFamily: 'Muli',
                                            fontWeight: FontWeight.w600,
                                            fontSize: dynamicSize(0.04),color: AllColor.blackOrange
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ), //height of inner container
                              width: double
                                  .infinity, //width to 100% match to parent container.
                            ),
                          ),
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
                    padding: const EdgeInsets.all(7.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                color: AllColor.shado_color,
                                child: Padding(
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    "Package",
                                    style: TextStyle(
                                        fontFamily: 'Muli',
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black45,fontSize: dynamicSize(0.04)),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "01/",
                                      style: TextStyle(color: Colors.blue,fontSize: dynamicSize(0.045),fontFamily: 'Muli',
                                        fontWeight: FontWeight.w700,),
                                    ),
                                    Text(
                                      "31 days service",
                                      style: TextStyle(color: Colors.black45,fontSize: dynamicSize(0.045),fontFamily: 'Muli',
                                        fontWeight: FontWeight.w700,),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(7.0),
                                child: Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: dynamicSize(0.045),
                                      fontFamily: 'Muli',
                                      fontWeight: FontWeight.w600,
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
                                  padding: const EdgeInsets.all(7.0),
                                  child: Text(
                                    "Dementia Care for Adult",
                                    style: TextStyle(
                                        fontFamily: 'Muli',
                                        fontWeight: FontWeight.w700,
                                        fontSize: dynamicSize(0.05),
                                       ),
                                  ),
                                ),
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
                                padding: const EdgeInsets.all(7.0),
                                child: Text(
                                  "09 JAN, 2021",
                                  style: TextStyle(
                                      fontFamily: 'Muli',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: dynamicSize(0.035)),
                                ),
                              ),
                            ),
                             Padding(
                                    padding: const EdgeInsets.all(7.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.orange,
                                        ),
                                        Text(
                                          "3.5/5",
                                          style: TextStyle(
                                              fontFamily: 'Muli',
                                              fontWeight: FontWeight.w600,
                                              fontSize: dynamicSize(0.03),
                                              color: Colors.black),
                                        ),
                                      ],
                                    )),
                            MaterialButton(
                                color: AllColor.button_color,
                                elevation: 0,
                                child: new Text('Details',style: TextStyle(
                                    fontFamily: 'Muli',
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,fontSize: 18),),
                                onPressed: (){
                                  setState(() async{
                                    orderAcceped = true;

                                    await DataControllers.to.getProviderList("1", "1","","");

                                    Navigator.of(context)
                                        .push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                RunningPackageDetailsScreen()));


                                  });
                                }

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
