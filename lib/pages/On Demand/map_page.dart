import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takecare_user/pages/On%20Demand/request_page.dart';

import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class MapePage extends StatefulWidget {
  const MapePage({Key? key}) : super(key: key);

  @override
  _MapePageState createState() => _MapePageState();
}

class _MapePageState extends State<MapePage> {

  int id = 1;
  Completer<GoogleMapController> _controller = Completer();
  bool _arrived = false;
  bool _startService = false;
  bool _finished = false;

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      setState(() {
        _arrived = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Map Page"),
      ),
      body: /*GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kLake,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),*/

          Container(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () {
            setState(() {
              //requestView = true;
              showButtonListDialog(context);
            });
          },
          child: Container(
            width: dynamicSize(0.6),
            height: dynamicSize(0.2),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18, right: 18, top: 15, bottom: 15),
              child: Text(
                'Show Bottom Sheet',
                style: TextStyle(fontSize: dynamicSize(0.05)),
              ),
            ),
            decoration: BoxDecoration(
              color: AllColor.shado_color,
              borderRadius: BorderRadius.circular(30.0),
            ),
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
                  MaterialPageRoute(builder: (_) => RequestPage()));
            },
            child: Container(
              decoration: BoxDecoration(
                color: AllColor.themeColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              height: dynamicSize(0.15),
              child: Text(
                "Request this GP Doctor",
                style: TextStyle(fontSize: dynamicSize(0.05), color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showButtonListDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child:
                  ListView(
                children: List.generate(
                  5,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              overflow: Overflow.visible,
                              children: [
                                Positioned(
                                  child: CircleAvatar(
                                    radius: 35,
                                    child: ClipOval(
                                        child: Image.asset(
                                            "assets/images/imam.png")),
                                  ),
                                ),
                                Positioned(
                                  top: dynamicSize(0.17),
                                  left: dynamicSize(0.04),
                                  child: Container(
                                      alignment: Alignment.center,
                                      width: dynamicSize(0.12),
                                      //color: Colors.red,
                                      decoration: BoxDecoration(
                                        color: AllColor.white_yeo,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Text(
                                        "2 km",
                                        style: TextStyle(color: Colors.green),
                                      )),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Leya Ajanta Mondol",style: TextStyle(fontSize: dynamicSize(0.05),color:AllColor.themeColor,fontWeight: FontWeight.bold),),

                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Row(children: [
                                      Text("Caregiver ."),
                                      Text(" 232 patient served"),
                                    ],),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Row(children: [
                                      Text("Service Cost: "),
                                      Text(" 3000/-"),
                                    ],),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),


                        Radio(
                          value: 1,
                          groupValue: id,
                          onChanged: (val) {
                            setState(() {
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
