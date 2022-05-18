import 'dart:async';
import 'package:barikoi_maps_place_picker/barikoi_maps_place_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:takecare_user/controller/data_controller.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/public_variables/notifications.dart';
import 'package:takecare_user/ui/common.dart';
import '../../api_service/ApiService.dart';
import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class MapePage extends StatefulWidget {
   const MapePage( {Key? key,required this.result}) : super(key: key);

   final PickResult result;
   // final messageDao = MessageDao();
  @override
  _MapePageState createState() => _MapePageState();
}

class _MapePageState extends State<MapePage> {
  bool rqbutton =false;

  var id = "1";
  final Completer<GoogleMapController> _controller = Completer();
  bool _arrived = false;
  bool _startService = false;
  bool _finished = false;



  static CameraPosition _kLake = const CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(23.780426, 90.416615),
      tilt: 59.440717697143555,
      zoom: 15.151926040649414
      );

//  double get result => null;

  @override
  void initState()
  {
    super.initState();
    selected = DataControllers.to.getAvailableProviderList.value.data!.map<bool>((v) => false).toList();
  }
  List<Marker> markers = [];
  //var seats[];
  List<bool> selected = [];
  var requestIndex;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      builder: (dc) {
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text("Provider List"),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
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
                            ),
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
                                                      if (kDebugMode) {
                                                        print("state: $state, isSearchBarFocused: $isSearchBarFocused");
                                                      }
                                                      return isSearchBarFocused
                                                          ? Container()
                                                          : FloatingCard(
                                                        bottomPosition: 0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                                                        leftPosition: 0.0,
                                                        rightPosition: 0.0,
                                                        width: 500,

                                                        borderRadius: BorderRadius.circular(12.0),
                                                        child: state == SearchingState.Searching
                                                            ? const Center(child: CircularProgressIndicator())
                                                            : RaisedButton(
                                                          color: AllColor.pink_button,
                                                          child: const Text("Search Service Provider around You",style: TextStyle(color: Colors.white),),
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
                                            const Icon(Icons.location_on_outlined,color: Colors.green,),
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
                            physics: NeverScrollableScrollPhysics(),
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
                                            clipBehavior: Clip.none,
                                            children: [
                                              Positioned(
                                                child: ClipRRect(
                                                  borderRadius:
                                                  const BorderRadius.all(Radius.circular(30)),
                                                  child: CachedNetworkImage(
                                                    height: 55,
                                                    width: 55,
                                                    fit: BoxFit.cover,
                                                    imageUrl:
                                                    ApiService.MainURL + DataControllers.to.getAvailableProviderList.value.data![index].profilePhoto.toString(),
                                                    placeholder: (context, url) =>
                                                        const CircularProgressIndicator(),
                                                    errorWidget: (context, url, error) =>
                                                        Image.asset('assets/images/imam.png'),
                                                  ),
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
                                                      "${DataControllers.to.getAvailableProviderList.value.data![index].wight} ",
                                                      style: const TextStyle(color: Colors.green),
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
                                                  child: Row(children: const [
                                                    Text("Caregiver ."),
                                                    Text(" 50 patient served"),
                                                  ],),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(3.0),
                                                  child: Row(children: const [
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
                                        child: Container(
                                            margin: const EdgeInsets.only(right: 15),
                                            width: 20,
                                            height: 20,
                                            decoration: ShapeDecoration(
                                                color:  selected[index]  ? Colors.green : Colors.white ,
                                                shape: const CircleBorder (
                                                    side: BorderSide(
                                                        width: 2,
                                                        color: Colors.green
                                                    )
                                                )
                                            )
                                        ),
                                      )
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
                          await dc.createRequest(DataControllers.to.getAvailableProviderList.value.data![requestIndex],widget.result,requestIndex);
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
            ),
            if(dc.loading.value) loadingWidget()
          ],
        );
      }
    );
  }
}
