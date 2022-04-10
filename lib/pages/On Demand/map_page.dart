import 'dart:async';

import 'package:barikoi_maps_place_picker/src/models/pick_result.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/pages/On%20Demand/request_page.dart';

import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class MapePage extends StatefulWidget {
  MapePage( {Key? key,required this.result}) : super(key: key);

  final PickResult result;

  @override
  _MapePageState createState() => _MapePageState();
}

class _MapePageState extends State<MapePage> {

  var id = "1";
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


    // getProviderList();

    /*    Timer(Duration(seconds: 5), () {
      setState(() {
        _arrived = true;
      });
    });*/
  }
  List<Marker> markers =[];
  @override
  Widget build(BuildContext context) {


/*

    markers.add(Marker(markerId: MarkerId("Marker Test"),
      position:    LatLng(23.794862086697574, 90.41426405389653),
      infoWindow: InfoWindow(
        title: "Map",
        //snippet: 'address',
      ),

    ));
*/


    return Scaffold(
      appBar: AppBar(
        title: Text("Provider List"),
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
        child:




        ListView(
          children: List.generate(

            DataControllers.to.getAvailableProviderList.value.data!.length,
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
                            child:


                            ClipRRect(
                              borderRadius:
                              BorderRadius.all(Radius.circular(30)),
                              child: CachedNetworkImage(
                                height: 55,
                                width: 55,
                                fit: BoxFit.cover,
                                imageUrl:
                                '${DataControllers.to.userLoginResponse.value.data!.user!.profilePhoto}',
                                placeholder: (context, url) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    Image.asset('assets/images/imam.png'),
                              ),
                            ),
                            /*
                            CachedNetworkImage(
                              height: 55,
                              width: 55,
                              fit: BoxFit.cover,
                              imageUrl:
                              '${DataControllers.to.getAvailableProviderList.value.data![index].profilePhoto}',
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Image.asset('assets/images/imam.png'),
                            ),*/

                            /*CircleAvatar(
                                    radius: 35,
                                    child: ClipOval(
                                        child: Image.asset(
                                            "assets/images/imam.png")),
                                  ),*/
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
                                  "${DataControllers.to.getAvailableProviderList.value.data![index].wight} ",
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
                            Text("${DataControllers.to.getAvailableProviderList.value.data![index].fullName}",style: TextStyle(fontSize: dynamicSize(0.05),color:AllColor.themeColor,fontWeight: FontWeight.bold),),

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
                    value:  DataControllers.to.getAvailableProviderList.value.data!.length.toString(),
                    groupValue: id,
                    onChanged: (var a) {
                      setState(()
                      {
                        id = a.toString();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),




        /*InkWell(
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
        ),*/
      ),
      /*  bottomNavigationBar: BottomAppBar(
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
      ),*/
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

                  DataControllers.to.getAvailableProviderList.value.data!.length,
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
                                  child:

                                  CachedNetworkImage(
                                    height: 55,
                                    width: 55,
                                    fit: BoxFit.cover,
                                    imageUrl:
                                    '${DataControllers.to.getAvailableProviderList.value.data![index].profilePhoto}',
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Image.asset('assets/images/imam.png'),
                                  ),

                                  /*CircleAvatar(
                                    radius: 35,
                                    child: ClipOval(
                                        child: Image.asset(
                                            "assets/images/imam.png")),
                                  ),*/
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
                                        "${DataControllers.to.getAvailableProviderList.value.data![index].wight} ",
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
                                  Text("${DataControllers.to.getAvailableProviderList.value.data![index].fullName}",style: TextStyle(fontSize: dynamicSize(0.05),color:AllColor.themeColor,fontWeight: FontWeight.bold),),

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


                        /*    Radio(
                          value:  DataControllers.to.getAvailableProviderList.value.data!.length.toString(),
                          groupValue: id,
                          onChanged: (var a) {
                            setState(()
                            {
                              id = a.toString();
                            });
                          },
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

  void getProviderList()async {

    await DataControllers.to.getProviderList("1", "1");

  }
}
