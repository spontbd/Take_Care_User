// import 'package:barikoi_maps_place_picker/barikoi_maps_place_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takecare_user/public_variables/notifications.dart';
import 'package:takecare_user/ui/common.dart';

import '../controllers/DataContollers.dart';
import '../public_variables/all_colors.dart';
import '../public_variables/size_config.dart';
import '../ui/variables.dart';
import 'home_page.dart';
import 'loved_ones_page.dart';

class LovedFormPage extends StatefulWidget {
  const LovedFormPage({Key? key}) : super(key: key);

  @override
  _LovedFormPageState createState() => _LovedFormPageState();
}

class _LovedFormPageState extends State<LovedFormPage> {
  TextEditingController _nameNumberController = new TextEditingController();
  TextEditingController _mobileNumberController = new TextEditingController();
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _genderController = new TextEditingController();

  // late PickResult selectedPlace = new PickResult();
  String city='';
  String area='';
  @override
  Widget build(BuildContext size) {
    final maxLines = 5;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LovedOnesPage()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.pink,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Loved One's",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Provide few Information to \n connect with you.",
                  style: TextStyle(fontSize: dynamicSize(0.06)),
                ),
                SizedBox(
                  height: dynamicSize(0.07),
                ),
                Container(
                  height: dynamicSize(0.12),
                  child: TextField(
                    controller: _nameNumberController,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AllColor.button_color, width: 1.2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AllColor.button_color, width: 1.2),
                      ),
                      hintText: ' Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.04),
                ),
                SizedBox(
                  height: dynamicSize(0.12),
                  child: TextField(
                    controller: _mobileNumberController,
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AllColor.button_color, width: 1.2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: AllColor.button_color, width: 1.2),
                      ),
                      hintText: 'Mobile Number*',
                    ),
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.04),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text("Patient's Age",style: TextStyle(fontSize: dynamicSize(0.04)),)),
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: dynamicSize(0.12),
                        child: TextField(
                          controller: _ageController,
                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: dynamicSize(0.1),
                ),
                Row(
                  children: Variables.FahilyList
                      .map((item) => Expanded(
                      child: InkWell(
                        onTap: () => setState(
                                () => DataControllers.to.gender.value = item),
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                              right: item == 'Male' || item == 'Female'
                                  ? size.width * .02
                                  : 0.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: AllColor.blue),
                              color: item == DataControllers.to.gender.value
                                  ? AllColor.blue
                                  : Colors.white,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(size.width * .01))),
                          padding: EdgeInsets.symmetric(
                              vertical: size.width * .025,
                              horizontal: size.width * .04),
                          child: Text(
                            item,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: size.width * .04,
                                color:
                                item == DataControllers.to.gender.value
                                    ? Colors.white
                                    : AllColor.textColor),
                          ),
                        ),
                      )))
                      .toList(),
                ),

                Text('Address :\n City  ${city}\n Area ${area}',),

              InkWell(
              onTap: (){
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return PlacePicker(
                //         apiKey: "MjY5MzpHMEVBUExBNVM5",
                //         initialPosition: Common.LatLngEdit(23.766333,90.422284),
                //         useCurrentLocation: true,
                //         selectInitialPosition: true,
                //         usePinPointingSearch: true,
                //         onPlacePicked: (result) {
                //           selectedPlace = result;
                //           //  Navigator.of(context).pop();
                //           setState(() {
                //             selectedPlace = result;
                //              city = selectedPlace.city.toString();
                //              area = selectedPlace.area.toString(  );
                //           });
                //         },
                //
                //         //forceSearchOnZoomChanged: true,
                //         automaticallyImplyAppBarLeading: false,
                //         //autocompleteLanguage: "ko",
                //         //region: 'au',
                //         selectedPlaceWidgetBuilder: (_, selectedPlace, state, isSearchBarFocused) {
                //           if (kDebugMode) {
                //             print("state: $state, isSearchBarFocused: $isSearchBarFocused");
                //           }
                //           return isSearchBarFocused
                //               ? Container()
                //               : FloatingCard(
                //             bottomPosition: 0.0, // MediaQuery.of(context) will cause rebuild. See MediaQuery document for the information.
                //             leftPosition: 0.0,
                //             rightPosition: 0.0,
                //             width: dynamicSize(1),
                //
                //             borderRadius: BorderRadius.circular(12.0),
                //             child: state == SearchingState.Searching
                //                 ? const Center(child: CircularProgressIndicator())
                //                 : RaisedButton(
                //               color: AllColor.pink_button,
                //               child: const Text("Location Select",style: TextStyle(color: Colors.white),),
                //               onPressed: () {
                //                 // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                //                 //            this will override default 'Select here' Button.
                //
                //                 Navigator.of(context).pop();
                //                 print("placeucode: "+selectedPlace.toString());
                //                 print("placeucode: "+selectedPlace!.latitude.toString());
                //                 print("placeucode: "+selectedPlace.longitude.toString());
                //                 print("placeucode: "+selectedPlace.area.toString());
                //
                //
                //               },
                //             ),
                //           );
                //         },
                //       );
                //     },
                //   ),
                // );
                },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            height: dynamicSize(0.1),
            child: Text(
              "Place Pic",
              style: TextStyle(fontSize: dynamicSize(0.05), color: Colors.black),
            ),
          ),
        ),


              ],
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
                addAddress();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AllColor.themeColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                height: dynamicSize(0.15),
                child: Text(
                  "Submit",
                  style: TextStyle(fontSize: dynamicSize(0.05), color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void addAddress() async{

    // await DataControllers.to.addFavAddress(_mobileNumberController.text, _nameNumberController.text, selectedPlace.city.toString(), selectedPlace.area.toString(), selectedPlace.postCode.toString(), selectedPlace.longitude.toString(), selectedPlace.latitude.toString());

        // showToast(DataControllers.to.addFavAddressResponse.value.message.toString());

    ///Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LovedOnesPage()));
  }
}
