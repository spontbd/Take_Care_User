import 'dart:async';

import 'package:barikoi_maps_place_picker/barikoi_maps_place_picker.dart';
import 'package:barikoi_maps_place_picker/src/models/pick_result.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/pages/On%20Demand/request_page.dart';
import 'package:takecare_user/pages/sign_in_page.dart';
import 'package:takecare_user/ui/common.dart';
import 'package:takecare_user/ui/variables.dart';

import '../../api_service/ApiService.dart';
import '../../firebase/Message.dart';
import '../../firebase/MessageDao.dart';
import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class MapePage extends StatefulWidget {
   MapePage( {Key? key,required this.result}) : super(key: key);

   final PickResult result;
   final messageDao = MessageDao();
  @override
  _MapePageState createState() => _MapePageState();
}

class _MapePageState extends State<MapePage> {
  bool rqbutton =false;

  var id = "1";
  Completer<GoogleMapController> _controller = Completer();
  bool _arrived = false;
  bool _startService = false;
  bool _finished = false;



  static CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(23.780426, 90.416615),
      tilt: 59.440717697143555,
      zoom: 15.151926040649414
      );

//  double get result => null;

  void initState() {
    super.initState();

    selected = DataControllers.to.getAvailableProviderList.value.data!.map<bool>((v) => false).toList();

/*    latitute = widget.result.latitude;
    longitute = widget.result.latitude;*/
   // getProviderList();

    /*    Timer(Duration(seconds: 5), () {
      setState(() {
        _arrived = true;
      });
    });*/
  }
  List<Marker> markers =[];
  //var seats[];

  List<bool> selected = [];

  var requestIndex;


  //= new boolean[10];
  //Arrays.fill(seats, true);


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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: dynamicSize(1.5),
              child: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition:

                    _kLake = CameraPosition(
                        bearing: 192.8334901395799,
                        target: LatLng(widget.result.latitude!.toDouble(), widget.result.longitude!.toDouble()),
                        tilt: 59.440717697143555,
                        zoom: 15.151926040649414
                    )

                    ,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                  Positioned(
                      bottom: 10,
                      child: Container(
                        color: Colors.white,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Caregiver will visit",style: TextStyle(color: Colors.black54,fontSize: dynamicSize(0.05)),),
                                  TextButton(onPressed: (){


                                    late PickResult selectedPlace;


                                    //var initLatLng = LatLng(23.8567844, 90.213108);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return PlacePicker(
                                            apiKey: "MjY5MzpHMEVBUExBNVM5",
                                            initialPosition: Common.LatLngEdit(widget.result.latitude!.toDouble(),widget.result.longitude!.toDouble()),
                                            useCurrentLocation: true,
                                            selectInitialPosition: true,
                                            usePinPointingSearch: true,
                                            onPlacePicked: (result) {
                                              selectedPlace = result;



                                              //  Navigator.of(context).pop();
                                              setState(() {
                                                selectedPlace = result;

                                              });




                                            },

                                            //forceSearchOnZoomChanged: true,
                                            automaticallyImplyAppBarLeading: false,
                                            //autocompleteLanguage: "ko",
                                            //region: 'au',
                                            selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
                                              print("state: $state, isSearchBarFocused: $isSearchBarFocused");
                                              return isSearchBarFocused
                                                  ? Container()
                                                  : FloatingCard(
                                                bottomPosition: 0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                                                leftPosition: 0.0,
                                                rightPosition: 0.0,
                                                width: 500,

                                                borderRadius: BorderRadius.circular(12.0),
                                                child: state == SearchingState.Searching
                                                    ? Center(child: CircularProgressIndicator())
                                                    : RaisedButton(
                                                  color: AllColor.pink_button,
                                                  child: Text("Search Service Provider around You",style: TextStyle(color: Colors.white),),
                                                  onPressed: () {
                                                    // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                                                    //            this will override default 'Select here' Button.

                                                    Navigator.of(context).pop();
                                                    print("placeucode: "+selectedPlace.toString());
                                                    print("placeucode: "+selectedPlace!.latitude.toString());
                                                    print("placeucode: "+selectedPlace.longitude.toString());
                                                    print("placeucode: "+selectedPlace.area.toString());

                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(builder: (context) => MapePage(result: selectedPlace)),
                                                    );

                                                  },
                                                ),
                                              );
                                            },
                                            // pinBuilder: (context, state) {
                                            //   if (state == PinState.Idle) {
                                            //     return Icon(Icons.favorite_border);
                                            //   } else {
                                            //     return Icon(Icons.favorite);
                                            //   }
                                            // },
                                          );
                                        },
                                      ),
                                    );



                                  }, child: Text("Edit",style: TextStyle(color: Colors.purple,fontSize: dynamicSize(0.05)),))
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.location_on_outlined,color: Colors.green,),
                                  Expanded(child: Text(widget.result.formattedAddress.toString()+","+widget.result.area.toString()

                                      +","+widget.result.city.toString()

                                    ,
                                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: dynamicSize(0.05)),)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ],

              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Choose One...",style: TextStyle(fontSize: dynamicSize(0.07))),
                ),
                Container(
                  alignment: Alignment.center,
                  height: dynamicSize(1),
                  child: ListView(
                    children: List.generate(
                      DataControllers.to.getAvailableProviderList.value.data!.length,
                          (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: (){
                            rqbutton =true;
                            setState(() {
                              selected = DataControllers.to.getAvailableProviderList.value.data!.map<bool>((v) => false).toList();
                              selected[index] = !selected[index];
                              requestIndex = index;

                              // Get.offAll(()=>const RequestPage());
                            });
                          },
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
                                            '${ ApiService.MainURL + DataControllers.to.getAvailableProviderList.value.data![index].profilePhoto.toString()}',
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
                                            Text(" 50 patient served"),
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


                              InkWell(
                              /*  onTap: (){
                                  rqbutton =true;
                                  setState(() {
                                    selected = DataControllers.to.getAvailableProviderList.value.data!.map<bool>((v) => false).toList();
                                    selected[index] = !selected[index];
                                    // Get.offAll(()=>const RequestPage());
                                  });
                                },*/
                                child: Container(
                                    margin: EdgeInsets.only(right: 15),
                                    width: 20,
                                    height: 20,
                                    decoration: ShapeDecoration(
                                        color:  selected[index]  ? Colors.green : Colors.white ,
                                        shape: CircleBorder (
                                            side: BorderSide(
                                                width: 2,
                                                color: Colors.green
                                            )
                                        )
                                    )
                                ),
                              )


/*
                      Radio(
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
                ),


              ],
            ),
          ],
        ),
      ),


      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        //color: AllColor.themeColor,
        child:  Visibility(
          visible: rqbutton,
          child: SizedBox(
            height: dynamicSize(0.15),
            width: MediaQuery.of(context).size.width,
            child: Container(
              //margin: EdgeInsets.only(bottom: 5),
              padding: const EdgeInsets.only(left: 5, right: 5, bottom:10),
              child: RaisedButton(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onPressed: () async{



                  FirebaseApp firebaseApp = await Firebase.initializeApp();
                  Variables.dbref = FirebaseDatabase.instance.reference();
                  _createDB();
                 // _readdb_onechild();
                  //ageChange();
                  //dataChange();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  RequestPage(requestIndex)),
                  );


                },
                //padding: EdgeInsets.all(10.0),
                color: AllColor.pink_button,
                textColor: Colors.white,
                child: Text(
                  "Request this GP Doctor",
                  style: TextStyle(fontSize: dynamicSize(0.05)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

/*  void _sendMessage() {

      var message = Message("Sabbir khan", DateTime.now());
      widget.messageDao.saveMessage(message);
      setState(() {});
    }
  }

  Widget _getMessageList() {
    return Expanded(
      child: FirebaseAnimatedList(

        query: messageDao.getMessageQuery(),
        itemBuilder: (context, snapshot, animation, index) {
          final json = snapshot.value as Map<dynamic, dynamic>;
          final message = Message.fromJson(json);
          return MessageWidget(message.text, message.date);
        },
      ),
    );
  }*/



/*
  void showButtonListDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          List<bool> selected = [];
          selected = selected.map<bool>((v) => false).toList();


          //var selected[] = new Bool false;
       *//*  var selected =  new boolean[DataControllers.to.getAvailableProviderList.value.data!.length];
          selected.fill(selected, Boolean.FALSE);


         *//*
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

                                  *//*CircleAvatar(
                                    radius: 35,
                                    child: ClipOval(
                                        child: Image.asset(
                                            "assets/images/imam.png")),
                                  ),*//*
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

                        InkWell(
                          onTap: (){
                            setState(() {
                              selected[index] = !selected[index];
                            });
                        },
                          child: Container(
                              width: 200,
                              height: 200,
                           *//*   child: Center(
                                  child: Image.network("https://s3.o7planning.com/images/boy-128.png")
                              ),*//*
                              decoration: ShapeDecoration(
                                  color:  selected[index]  ? Colors.green : Colors.white ,
                                  shape: CircleBorder (
                                      side: BorderSide(
                                          width: 10,
                                          color: Colors.blue
                                      )
                                  )
                              )
                          ),
                        )

                    *//*    Radio(
                          value:  DataControllers.to.getAvailableProviderList.value.data!.length.toString(),
                          groupValue: id,
                          onChanged: (var a) {
                            setState(()
                            {
                              id = a.toString();
                            });
                          },
                        ),*//*
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }*/

  void getProviderList()async {

    await DataControllers.to.getProviderList("1", "1");

  }









  
  String databasejson = '';
  var newAge;
  var newAge2;
  var status;

  _createDB() {

    String fileID = Variables.dbref.push().key;

    // Variables.dbref.child("Request").set(" my profile");

    Variables.dbref.child("Request").child( DataControllers.to.getAvailableProviderList.value.data![requestIndex].phone!.toString())
        .child(fileID).set({
      'provider_token': DataControllers.to.getAvailableProviderList.value.data![requestIndex].fullName,
      'user_id': DataControllers.to.userLoginResponse.value.data!.user!.phone,
      'user_name': DataControllers.to.userLoginResponse.value.data!.user!.fullName,
      'user_token': DataControllers.to.userLoginResponse.value.data!.token,
      'request_type': "request",
      'id': fileID
        });



    Variables.dbref.child("User").child(DataControllers.to.userLoginResponse.value.data!.user!.phone.toString())
    .child(fileID).set({
      'provider_token': DataControllers.to.getAvailableProviderList.value.data![requestIndex].fullName,
      'user_id': DataControllers.to.userLoginResponse.value.data!.user!.phone,
      'user_name':  DataControllers.to.getAvailableProviderList.value.data![requestIndex].fullName!.toString(),
      'user_token': DataControllers.to.userLoginResponse.value.data!.token,
      'request_type': "request",
      'id': fileID
    });

  }

  _readdb_onechild() {
    Variables.dbref
        .child("Request")
        .child(DataControllers.to.getAvailableProviderList.value.data![requestIndex].phone!.toString())
        .child("request_type")
        .once()
        .then((DataSnapshot dataSnapshot) {
        print(" read once - " + dataSnapshot.value.toString());
        setState(()
        {
          databasejson = dataSnapshot.value.toString();
        });

      });
  }

  _realdb_once() {
    Variables.dbref.once().then((DataSnapshot dataSnapshot) {
      print(" read once - " + dataSnapshot.value.toString());
      setState(() {
        databasejson = dataSnapshot.value.toString();
      });
    });
  }

  _updatevalue() {
    Variables.dbref.child("carprofile").update({"car2": "big company car"});
  }

  _delete() {
    Variables.dbref.child("profile").remove();
  }


  void ageChange() {
  Variables.dbref.child("Request")
      .child(DataControllers.to.getAvailableProviderList.value.data![requestIndex].phone!.toString())
      .child("request_type")
      .onValue.listen((Event event) {
  String data = event.snapshot.value;
  print('weight data: $data');
  setState(() {
  newAge = data;
  });
  });
}

void dataChange() {
  Variables.dbref.child("Request")
      .child(DataControllers.to.getAvailableProviderList.value.data![requestIndex].phone!.toString())
      .onValue.listen((event) {
    print(event.snapshot.value.toString());
    Map data = event.snapshot.value;
    data.forEach((key, value) {
      setState(() {
        newAge2 = data['request_type'];
        status = data['user_id'];
      });
    });
  });
}



/*  getkLake() {
    _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(result, 90.416615),
        tilt: 59.440717697143555,
        zoom: 15.151926040649414
    );
  }*/
}
