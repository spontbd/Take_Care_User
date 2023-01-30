import 'dart:async';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:takecare_user/controller/data_controller.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/model/provider/provider_data.dart';
import 'package:takecare_user/pages/On%20Demand/on_demand_page.dart';
import 'package:takecare_user/pages/provider/provider_profile_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/notifications.dart';
import 'package:takecare_user/public_variables/size_config.dart';
import 'package:takecare_user/public_variables/string_constant.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key, required this.result}) : super(key: key);

  final GeocodingResult result;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool rqbutton = false;
  List<Marker> markers = [];
  List<bool> selected = [];
  var requestIndex;
  bool isDeactivated = false;

  var id = "1";
  final Completer<GoogleMapController> _controller = Completer();

  static CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(23.780426, 90.416615),
      tilt: 59.440717697143555,
      zoom: 15.151926040649414);

  List<ProviderData> providerList = [];

  @override
  void initState() {
    super.initState();
    filter();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(builder: (dc) {
      return Stack(
        children: [
          WillPopScope(
            onWillPop: () async {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => OnDemandPage()));
              return true;
            },
            child: Scaffold(
              appBar: AppBar(
                title: const Text("Available Providers"),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: dynamicSize(0.9),
                      child: Stack(
                        children: [
                          GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: _kLake = CameraPosition(
                                bearing: 192.8334901395799,
                                target:
                                    LatLng(192.83349013957, 192.83349013957),
                                tilt: 59.440717697143555,
                                zoom: 15.151926040649414),
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
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8, bottom: 8),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Service provider will visit",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: dynamicSize(0.05)),
                                          ),
                                          TextButton(
                                              onPressed: () async {
                                                /*
                                                late GeocodingResult resultGeo;
                                                resultGeo = (await Navigator.push(
                                                  context,
                                                  MaterialPageRoute<
                                                      GeocodingResult>(
                                                    builder: (cx) {
                                                      return MapLocationPicker(
                                                          location: Location(
                                                              lat: Variables
                                                                  .currentPostion
                                                                  .latitude,
                                                              lng: Variables
                                                                  .currentPostion
                                                                  .longitude),
                                                          apiKey:
                                                              "AIzaSyB5x56y_2IlWhARk8ivDevq-srAkHYr9HY",
                                                          canPopOnNextButtonTaped:
                                                              true,
                                                          onNext:
                                                              (GeocodingResult?
                                                                  result) {
                                                            if (result !=
                                                                null) {
                                                              setState(() {
                                                                resultGeo =
                                                                    result;
                                                                // var  address = result.formattedAddress ?? "";
                                                                Navigator.pop(
                                                                    cx,
                                                                    resultGeo);
                                                              });
                                                              // Navigator.push(context, MaterialPageRoute(builder: (context) => MapPage()),);
                                                            }
                                                          });
                                                    },
                                                  ),
                                                ))!;
                                                if (resultGeo != null) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (cp) =>
                                                            MapPage(
                                                              result: resultGeo,
                                                            )),
                                                  );
                                                }
                                                */

                                              },
                                              child: Text(
                                                "Edit",
                                                style: TextStyle(
                                                    color: Colors.purple,
                                                    fontSize:
                                                        dynamicSize(0.05)),
                                              ))
                                        ],
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 4.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              color: Colors.green,
                                            ),
                                            Expanded(
                                                child: Text(
                                              widget.result.formattedAddress
                                                  .toString(),
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: dynamicSize(0.05)),
                                            )),
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
                          padding: const EdgeInsets.all(15.0),
                          child: Text(providerList.isEmpty ? "No provider is available in your area at this moment. Please try again after some time  Or call at 01827370397 . Thank You." :"Choose One...",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: dynamicSize(0.07))),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: dynamicSize(rqbutton ? 0.96 : 1.17),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 18.0),
                            child: ListView(
                              children: List.generate(providerList.isEmpty ? 0 :
                                 providerList.length,
                                (index) => Container(
                                  color: selected[index]
                                      ? AllColor.selected_color
                                      : Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0,
                                        left: 8,
                                        bottom: 15,
                                        right: 8),
                                    child: InkWell(
                                      onTap: () {
                                        rqbutton = true;
                                        setState(() {
                                          selected = providerList
                                              .map<bool>((v) => false)
                                              .toList();
                                          selected[index] = !selected[index];
                                          requestIndex = index;

                                          // Get.offAll(()=> RequestPage());
                                        });
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Stack(
                                                alignment: Alignment.center,
                                                clipBehavior: Clip.none,
                                                children: [
                                                  Positioned(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          const BorderRadius
                                                                  .all(
                                                              Radius.circular(
                                                                  30)),
                                                      child: CachedNetworkImage(
                                                        height: 55,
                                                        width: 55,
                                                        fit: BoxFit.cover,
                                                        imageUrl: providerList[index].profilePhoto == null ?  'https://thumbs.dreamstime.com/b/man-profile-cartoon-smiling-round-icon-vector-illustration-graphic-design-135443422.jpg' : providerList[index].profilePhoto!.toString(),
                                                        placeholder: (context,
                                                                url) =>
                                                            Image.asset(
                                                                'assets/images/baby.png'),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                                'assets/images/baby.png'),
                                                      ),
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: -8.0,
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height:
                                                            dynamicSize(.06),
                                                        width:
                                                            dynamicSize(0.15),
                                                        //color: Colors.red,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: AllColor
                                                              .white_yeo,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(30),
                                                        ),
                                                        child: Text(
                                                          "${providerList[index].latitude == null ? (0).toString() : (Geolocator.distanceBetween(double.parse(providerList[index].latitude), double.parse(providerList[index].longitude), widget.result.geometry.location.lat, widget.result.geometry.location.lng) / 1000).toStringAsFixed(1)} km",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .green),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ProviderProfilePage(
                                                                providerdata:
                                                                    providerList[
                                                                        index])),
                                                  );
                                                  // showToast("Provider Profile");
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "${providerList[index].fullName ?? ''}",
                                                        style: TextStyle(
                                                            fontSize:
                                                                dynamicSize(
                                                                    0.05),
                                                            color: AllColor
                                                                .themeColor,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: Row(
                                                          children: [
                                                            /*●*/
                                                            Text(
                                                                "${providerList[index].speciality!.specialityName}"),
                                                            Text(
                                                                " • ${providerList[index].providerNumberOfGivenServiceCount ?? 0} Patient Served"),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                                "Service Cost: "),
                                                            Text(
                                                              "${providerList[index].provider_service_total_price!.toString()}/-",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .green),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          InkWell(
                                            child: Container(
                                              decoration: ShapeDecoration(
                                                  shape: CircleBorder(
                                                      side: BorderSide(
                                                          width: 2,
                                                          color: selected[index]
                                                              ? AllColor
                                                                  .blue_light
                                                              : Colors
                                                                  .black38))),
                                              child: Container(
                                                  margin:
                                                      const EdgeInsets.all(3),
                                                  width: 15,
                                                  height: 15,
                                                  decoration: ShapeDecoration(
                                                      color: selected[index]
                                                          ? AllColor.blue_light
                                                          : Colors.white,
                                                      shape:
                                                          const CircleBorder())),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
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
              bottomNavigationBar: rqbutton
                  ? BottomAppBar(
                      elevation: 0,
                      //color: AllColor.themeColor,
                      child: Visibility(
/*
                    visible: rqbutton,
*/
                        child: BlurryContainer(
                          blur: 30,
                          // color: Colors.white.withOpacity(0.15)
                          elevation: 0,
                          color: Colors.transparent.withOpacity(0.001),
                          padding: const EdgeInsets.all(12),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: Container(
                            height: dynamicSize(0.15),
                            //margin: EdgeInsets.only(bottom: 5),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              onPressed: isDeactivated
                                  ? null
                                  : () async {
                                      setState(() {
                                        isDeactivated = true;
                                      });

                                      await DataControllers.to.newRequest(
                                          providerList[requestIndex],
                                          widget.result);

                                      (DataControllers.to.newRequestResponse.value.success!)
                                          ? await dc.createRequest(
                                          DataControllers.to.newRequestResponse.value.data!.request_number,
                                              providerList[requestIndex],
                                              widget.result,
                                              requestIndex,
                                              '',
                                              '')
                                          : snackBar(context,
                                              StringConstant.systemError);
                                      /*   {
                                        await DataControllers.to.pleaceOrder(
                                            DataControllers.to.newRequestResponse
                                                .value.data!.request_number
                                                .toString(),
                                            providerList[requestIndex],
                                            widget.result);

                                    //    (DataControllers.to.appResponse.value.success!)

                                      } else {
                                        snackBar(
                                            context, StringConstant.systemError);
                                      }
                                      */

                                    },
                              color: AllColor.pink_button,
                              textColor: Colors.white,
                              child: Text(
                                "Book now",
                                style: TextStyle(fontSize: dynamicSize(0.05)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 1,
                    ),
            ),
          ),
          if (dc.loading.value) loadingWidget()
        ],
      );
    });
  }

  void filter() {
    DataControllers.to.getAvailableProviderList.value.data!.provider_data!.forEach((element) {
      if (element.latitude != null && element.longitude != null && (Geolocator.distanceBetween(
                      double.parse(element.latitude),
                      double.parse(element.longitude),
                      widget.result.geometry.location.lat,
                      widget.result.geometry.location.lng) /
                  1000)
              .toInt() <
          3) providerList.add(element);
    });

    // providerList.add()
    selected = providerList.map<bool>((v) => false).toList();
  }
}
