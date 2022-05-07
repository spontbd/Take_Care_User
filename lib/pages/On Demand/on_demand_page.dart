import 'package:barikoi_maps_place_picker/barikoi_maps_place_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/pages/home_page.dart';
import 'package:takecare_user/widgets/check_box.dart';
import 'package:intl/intl.dart';
import '../../controllers/language_controller.dart';
import '../../public_variables/all_colors.dart';
import '../../public_variables/notifications.dart';
import '../../public_variables/size_config.dart';
import '../../ui/common.dart';
import '../../ui/variables.dart';
import '../sign_in_page.dart';
import 'feedback_page.dart';
import 'map_page.dart';

class OnDemandPage extends StatefulWidget {
  const OnDemandPage({Key? key}) : super(key: key);

  @override
  _OnDemandPageState createState() => _OnDemandPageState();
}

var addedservice = false;
var showBottom = false;
var addedlist = false;

class _OnDemandPageState extends State<OnDemandPage> {
  Icon cusIcon = const Icon(Icons.search, color: Colors.black);
  Widget cusSearchbar = Text(
    "On Demand",
    style: TextStyle(color: Colors.black, fontSize: dynamicSize(0.03)),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(builder: (lc) {
      return Scaffold(
          bottomNavigationBar: showBottom
              ? Container(
                  height: dynamicSize(0.2),
                  color: AllColor.button_color,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.red,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8.0, top: 5),
                                  child: Text(
                                    "On Demand",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.035),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              addedlist
                                  ? Container(
                                      alignment: Alignment.topLeft,
                                      child: InkWell(
                                        onTap: () {
                                          BottomSheetAddedListDialog(context);
                                        },
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0, top: 5),
                                              child: Text(
                                                DataControllers
                                                    .to
                                                    .getAddCardResponse
                                                    .value
                                                    .data!
                                                    .length
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: dynamicSize(0.04),
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Text(
                                                " Service Added",
                                                style: TextStyle(
                                                    fontSize: dynamicSize(0.04),
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8.0),
                                              child: Icon(
                                                Icons.keyboard_arrow_up,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      alignment: Alignment.topLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 5),
                                        child: Text(
                                          "Attendant for Hospital Visit",
                                          style: TextStyle(
                                              fontSize: dynamicSize(0.04),
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                    )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: InkWell(
                          onTap: () async{
                            await DataControllers.to.getProviderList("1", "1");
                            late PickResult selectedPlace;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return PlacePicker(
                                    apiKey: "MjY5MzpHMEVBUExBNVM5",
                                    initialPosition: SignInPage.initLatLng,
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
                                            ? const Center(child: CircularProgressIndicator())
                                            : RaisedButton(
                                          color: AllColor.pink_button,
                                          child: Text("Search Service Provider around You",style: const TextStyle(color: Colors.white),),
                                          onPressed: () {
                                            // IMPORTANT: You MUST manage selectedPlace data yourself as using this build will not invoke onPlacePicker as
                                            //            this will override default 'Select here' Button.
                                            Navigator.of(context).pop();
                                            if (kDebugMode) {
                                              print("placeucode: "+selectedPlace.toString());
                                              print("placeucode: "+selectedPlace!.latitude.toString());
                                              print("placeucode: "+selectedPlace.longitude.toString());
                                              print("placeucode: "+selectedPlace.area.toString());
                                            }
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => MapePage(result: selectedPlace!)),
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
                          },
                          child: Container(
                            color: AllColor.button_color,
                            alignment: Alignment.center,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Continue",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.04),
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: dynamicSize(0.02),
                                ),
                                const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Container(height: .01),
          appBar: AppBar(
            leading: InkWell(
              child: const Icon(
                Icons.arrow_back,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  if (cusIcon.icon == Icons.search) {
                    print("working");
                    setState(() {
                      cusIcon = const Icon(Icons.cancel, color: AllColor.cancel_icon_color);
                      cusSearchbar = SizedBox(
                        height: dynamicSize(0.09),
                        child: TextField(
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: AllColor.search_field_color,
                            hintText: "Search",
                            prefixIcon: Icon(Icons.search),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                              borderSide:
                                  BorderSide(color: Colors.white, width: 2),
                            ),
                          ),
                          style: TextStyle(
                              color: Colors.black, fontSize: dynamicSize(0.04)),
                        ),
                      );
                    });
                  } else {
                    print("working2");
                    setState(() {
                      cusIcon = const Icon(Icons.search, color: Colors.black);
                      cusSearchbar = Text(
                        "On Demand",
                        style: TextStyle(
                            color: Colors.black, fontSize: dynamicSize(0.03)),
                      );
                    });
                  }
                },
                icon: cusIcon,
              ),
            ],
            bottom: PreferredSize(
              preferredSize: const Size(25, 25),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          showButtonListDialog(context);
                        },
                        child: Container(
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 8.0, right: 4, top: 4, bottom: 4),
                                child: Icon(Icons.filter_alt_outlined),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4.0, right: 4, top: 4, bottom: 4),
                                child: Text('Categories'),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4.0, right: 8, top: 4, bottom: 4),
                                child: Icon(Icons.arrow_drop_down),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: AllColor.shado_color,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: dynamicSize(0.03)),
                      InkWell(
                        onTap: () {
                        /*  Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapePage()),
                          );*/
                        },
                        child: Container(
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 4, top: 4, bottom: 4),
                                child: Icon(Icons.verified_outlined),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4.0, right: 10, top: 4, bottom: 4),
                                child: Text('Popualar'),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: AllColor.shado_color,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: dynamicSize(0.03),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FeedBackPage()),
                          );
                        },
                        child: Container(
                          child: Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 4, top: 4, bottom: 4),
                                child: Icon(Icons.shopping_cart_outlined),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 4.0, right: 10, top: 4, bottom: 4),
                                child: Text('Token Before'),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: AllColor.shado_color,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            title: cusSearchbar,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: ListView(
            padding: const EdgeInsets.only(top: 8,bottom: 8),
            children: List.generate(
              DataControllers.to.shortServiceResponse.value.data!.data!.length,
              (index) => Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  decoration: const BoxDecoration(
                   /* borderRadius: BorderRadius.circular(8.0),*/
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 0, top: 10,bottom: 10),
                        child: Card(
                              margin: const EdgeInsets.only(left: 0),
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(15),
                                    topRight: Radius.circular(15)
                                    ),
                              ),
                              elevation: 10,
                              child: CachedNetworkImage(
                                fit: BoxFit.fill,
                                width: 120,
                                imageUrl:
                                "https://takecare.ltd/${DataControllers.to.shortServiceResponse.value.data!.data![index].imagePath /* == null ?   "https://cdn.vectorstock.com/i/1000x1000/21/73/old-people-in-hospital-vector-34042173.webp": DataControllers.to.shortServiceResponse.value.data![index]!.imagePath */}",
                                /*progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                    CircularProgressIndicator(),*/
                                errorWidget: (context, url, error) => Image.asset(
                                  "assets/images/image.png",
                                ),
                              ),
                            ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 5),
                              child: Text(
                                "${DataControllers.to.shortServiceResponse.value.data!.data![index].serviceName}",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.04),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: dynamicSize(0.06),
                            ),
                            TextButton(
                              onPressed: () {
                                showButtonDialog(context, index);
                              },
                              child: Text(
                                "Details",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.035),
                                    color: Colors.purple),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      InkWell(
                        onTap: () {
                          print("object");
                          addCard(index);
                        },
                        child: Container(
                          height: dynamicSize(0.10),
                          width: dynamicSize(0.12),
                          margin: const EdgeInsets.only(bottom: 20),
                          child: const Card(
                            color: AllColor.pink_button,
                            margin: EdgeInsets.only(left: 0,right: 0),
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  topLeft: Radius.circular(15)
                              ),
                            ),
                            elevation: 6,
                            child: Icon(Icons.add,color: Colors.white,),
                          ),
                        )

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

  void showButtonDialog(BuildContext context, int index) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: dynamicSize(1),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.cancel,
                          color: Colors.white,
                          size: 35,
                        ))),
                Container(
                  height: dynamicSize(0.86),
                  decoration: const BoxDecoration(
                    color: AllColor.buttomdialog,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left: 10.0, top: 20),
                            child:  Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15
                                ),
                              ),
                              child: CachedNetworkImage(
                                width: 120,
                                imageUrl:
                                "https://takecare.ltd/${DataControllers.to.shortServiceResponse.value.data!.data![index].imagePath /* == null ?   "https://cdn.vectorstock.com/i/1000x1000/21/73/old-people-in-hospital-vector-34042173.webp": DataControllers.to.shortServiceResponse.value.data![index]!.imagePath */}",
                                errorWidget: (context, url, error) => Image.asset(
                                  "assets/images/image.png",
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0, top: 30),
                                  child: Text(
                                    DataControllers.to.shortServiceResponse.value.data!
                                        .data![index].serviceName!,
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.05),
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          ),
                       
                          InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                              addCard(index);
                            },
                            child: Container(
                              height: dynamicSize(0.10),

                              margin: EdgeInsets.only(top: 66),
                              child: Card(
                                color: AllColor.pink_button,
                                margin: EdgeInsets.only(left: 0,right: 0),
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      topLeft: Radius.circular(15)
                                  ),
                                ),
                                elevation: 6,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 2.0,),
                                  child: Row(
                                    children: [
                                      Icon(Icons.add,color: Colors.white,),
                                      Text("Order Now ",style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),

                                /*CachedNetworkImage(
                              fit: BoxFit.fill,
                              width: 120,
                              imageUrl:
                              "https://takecare.ltd/${DataControllers.to.shortServiceResponse.value.data!.data![index].imagePath *//* == null ?   "https://cdn.vectorstock.com/i/1000x1000/21/73/old-people-in-hospital-vector-34042173.webp": DataControllers.to.shortServiceResponse.value.data![index]!.imagePath *//*}",
                              progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                              CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Image.asset(
                            "assets/images/image.png",
                              ),
                            ),*/
                              ),
                            ),
                          ),

                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 15),
                        child: SingleChildScrollView(
                          child: Text(
                            DataControllers.to.shortServiceResponse.value.data!
                                .data![index].description!,
                            style: TextStyle(
                              fontSize: dynamicSize(0.04),
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  void BottomSheetAddedListDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bcs) {
          return Container(
            color: Colors.transparent,
            height: dynamicSize(0.9),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_drop_down_circle_outlined,
                          color: Colors.white,
                          size: 35,
                        ))),
                Container(

                  color: AllColor.card_bg,
                  height: dynamicSize(0.55),
                  child: ListView(
                    padding: const EdgeInsets.all(8),
                    children: new List.generate(
                      DataControllers.to.getAddCardResponse.value.data!.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(


                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: Offset(
                                    2.0, 2.0), // shadow direction: bottom right
                              )
                            ],
                          ),
                          child: Row(
                            children: [
                              Card(
                                margin: EdgeInsets.only(left: 0,top: 10,bottom: 10),
                                semanticContainer: true,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15),
                                      topRight: Radius.circular(15)
                                  ),
                                ),
                                elevation: 10,
                                child: CachedNetworkImage(
                                  fit: BoxFit.fill,
                                  width: 120,
                                  imageUrl:
                                  "https://takecare.ltd/${DataControllers.to.shortServiceResponse.value.data!.data![index].imagePath /* == null ?   "https://cdn.vectorstock.com/i/1000x1000/21/73/old-people-in-hospital-vector-34042173.webp": DataControllers.to.shortServiceResponse.value.data![index]!.imagePath */}",

                                  errorWidget: (context, url, error) => Image.asset(
                                    "assets/images/image.png",
                                  ),
                                ),
                              ),


                              /*

                              CachedNetworkImage(
                                width: 120,
                                imageUrl:
                                "https://takecare.ltd/${DataControllers.to.getAddCardResponse.value.data![index].imagePath *//* == null ?   "https://cdn.vectorstock.com/i/1000x1000/21/73/old-people-in-hospital-vector-34042173.webp": DataControllers.to.shortServiceResponse.value.data![index]!.imagePath *//*}",
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) =>
                                    CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Image.asset(
                                  "assets/images/image.png",
                                ),
                              ),

                              */





                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 8.0, left: 5),
                                    child: Text(
                                      "${DataControllers.to.getAddCardResponse.value.data![index].service!.serviceName == null ? "Service Name" : DataControllers.to.getAddCardResponse.value.data![index].service!.serviceName}",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.04),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: dynamicSize(0.02),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.035),
                                          color: Colors.purple),
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                height: 40,
                                width: 40,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    deleteAddCardData(index);
                                  },
                                  child: Image.asset(
                                    "assets/images/demand_service_cross_button.png",
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void showButtonListDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc)
        {
          return Container(
            color: Colors.white,
            /*margin: EdgeInsets.only(left: 10,right: 10),*/
            height: dynamicSize(2),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Select Category",style: TextStyle(fontSize: dynamicSize(0.08),fontWeight: FontWeight.bold),),
                      InkWell(
                          onTap: (){
                            setState(() {
                            //  showToast("Check");
                              Navigator.pop(context);
                              showButtonListDialog(context);
                              DataControllers.to.getCategoriesResponse.value.data!.length  =  DataControllers.to.getCategoriesResponse.value.data!.length  ;
                            });
                          },
                          child: Text("Deselect All",style: TextStyle(fontSize: dynamicSize(0.05),color: Colors.purple),)),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child:
                            ListView(
                          children: List.generate(
                            DataControllers.to.getCategoriesResponse.value.data!.length,
                            (index) => Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "${DataControllers.to.getCategoriesResponse.value.data![index].categoryName}",
                                  style: TextStyle(fontSize: dynamicSize(0.05)),
                                ),
                                CheckBox(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Variables.categoryCheckBoxValue   ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: dynamicSize(0.08)),
                      child: ElevatedButton(
                        onPressed: () async
                        {

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text('Show Listing',
                                  style: TextStyle(fontSize: dynamicSize(0.045))),
                            )
                          ],
                        ),
                      )
                  )  : Container(),


                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    showBottom = false;
    getAddCardData();
    /* if(DataControllers.to.userServiceResponse.value.data!.isNotEmpty)
      {
        showBottom = false;
      }*/
  }

  void getAddCardData() async {
    await DataControllers.to.getCard();


    if (
        DataControllers.to.getAddCardResponse.value.data == null
    )
      {
        setState(() {
          showBottom = false;
          addedlist = false;
          DataControllers.to.getAddCardResponse;
        });
      } else if (DataControllers.to.getAddCardResponse.value.data!.length > 0) {
      setState(() {
        DataControllers.to.getAddCardResponse;
        showBottom = true;
        addedlist = true;
      });
    } else {

      setState(() {
        DataControllers.to.getAddCardResponse;
        showBottom = false;
        addedlist = false;
      });

    }
  }

  void deleteAddCardData(int index) async {
    await DataControllers.to.deleteCard(
        DataControllers.to.userLoginResponse.value.data!.user!.id.toString(),
        DataControllers.to.getAddCardResponse.value.data![index].id.toString());
        showToast(DataControllers.to.addCardResponse.value.message!);

    if (DataControllers.to.addCardResponse.value.success!) {
      getAddCardData();
    }
  }

  void addCard(int index) async{

    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);

    await DataControllers.to.addCard(
      /*  DataControllers.to.userLoginResponse.value
            .data!.user!.id
            .toString(),*/
        DataControllers.to.shortServiceResponse
            .value.data!.data![index].id
            .toString(),
        formattedDate);

    showToast(DataControllers.to.addCardResponse.value.message!, AllColor.blue);


    if (DataControllers
        .to.addCardResponse.value.success!) {
      Common.storeSharedPreferences.setString("service", "short");

      getAddCardData();
    }
  }
}
