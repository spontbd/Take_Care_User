import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:takecare_user/pages/Addresses.dart';
import 'package:takecare_user/pages/On%20Demand/on_demand_page.dart';
import 'package:takecare_user/pages/long_time_services/long_time_service_page.dart';
import 'package:takecare_user/pages/profile.dart';
import 'package:takecare_user/pages/sign_in_page.dart';

//import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/public_variables/size_config.dart';

import '../controllers/DataContollers.dart';
import '../controllers/language_controller.dart';
import '../public_variables/all_colors.dart';
import '../public_variables/notifications.dart';
import '../ui/common.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../widgets/loading_widget.dart';
import 'On Demand/caregiver_profile_page.dart';
import 'loved_ones_page.dart';
import 'order_history/order_history_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
var isLoading = false;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getAllService();
  }

  onProgressBar(bool progress) {
    setState(() {
      isLoading = progress;
    });
  }

  void getAllService() async {
    //DataControllers.to.profilePercentage.value.data.percentage = 0;

    onProgressBar(true);
    //await DataControllers.to.getAllLongService("long");
    //await DataControllers.to.getAllShortService("short");
    await DataControllers.to.getAllLongService("long");
    await DataControllers.to.getAllShortService("short");
    onProgressBar(false);

    //  await DataControllers.to.postUserServiceResponse(DataControllers.to.userLoginResponse.value.data!.user!.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            key: _scaffoldKey,
            // appBar: AppBar(title: Text('Goog Morning'),),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Image.asset("assets/images/baby.png"),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: CachedNetworkImage(
                          height: 55,
                          width: 55,
                          fit: BoxFit.cover,
                          imageUrl:
                              '${DataControllers.to.userLoginResponse.value.data!.user!.profilePhoto}',
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Image.asset('assets/images/baby.png'),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 10, top: 15),
                                child: Text(
                                  messageDisplay(),
                                  style: TextStyle(fontSize: dynamicSize(0.04)),
                                )),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 10, bottom: 10, top: 5),
                                child: Text(
                                    (DataControllers.to.userLoginResponse.value
                                            .data!.user!.fullName!.isEmpty
                                        ? " "
                                        : DataControllers.to.userLoginResponse
                                            .value.data!.user!.fullName
                                            .toString()),
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: AllColor
                                            .colorDashboardOnDemand_blue))),
                          ],
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {
                          _scaffoldKey.currentState!.openEndDrawer();
                        },
                        icon: Icon(Icons.menu),
                      )
                    ],
                  ), //appbar design
                  Flexible(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          SizedBox(height: dynamicSize(0.04)),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "On demand",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.08),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    ///Red Back
                                    Container(
                                      height: dynamicSize(0.5),
                                      decoration: const BoxDecoration(
                                        color:
                                            AllColor.colorDashboardProfileRed,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),

                                    ///Top Image
                                    Positioned(
                                      right: -size.width * .015,
                                      top: -size.width * .06,
                                      child: Image.asset(
                                        'assets/images/inject_1.png',
                                        height: size.width * .3,
                                        width: size.width * .3,
                                      ),
                                    ),
                                    Positioned(
                                      left: -size.width * .01,
                                      top: size.width * .12,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * .04),
                                        child: Text(
                                          "Right Now",
                                          style: TextStyle(
                                              fontSize: size.width * .05,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),

                                    Positioned(
                                      bottom: size.width * .04,
                                      left: size.width * .03,
                                      right: -5.0,
                                      child: Text('Book Service for\nRight now',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: size.width * .038,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Positioned(
                                      bottom: size.width * .008,
                                      right: -size.width * .02,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          //    Common.storeSharedPreferences.setString('userid', _mobileNumber.value.text.toString());
                                          var serviceValue = Common
                                              .storeSharedPreferences
                                              .getString("service");

                                          if (serviceValue == "short" ||
                                              serviceValue == null ||
                                              serviceValue.isEmpty) {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                                        builder: (_) =>
                                                            OnDemandPage()));
                                          } else {
                                            //  showToast("You already added the long time service");
                                            showAlertForAddCardDeleted(
                                                "On Demand",
                                                "You already added the long time service");
                                          }
                                        },
                                        child: Icon(Icons.chevron_right,
                                            size: size.width * .06,
                                            color: Colors.white),
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          padding:
                                              EdgeInsets.all(size.width * .005),
                                          primary: AllColor.colorArrow,
                                          onPrimary: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: dynamicSize(0.01)),
                              Expanded(
                                child: Stack(
                                  children: [
                                    ///Red Back
                                    Container(
                                      height: dynamicSize(0.5),
                                      decoration: const BoxDecoration(
                                        color: AllColor
                                            .colorDashboardOnDemand_blue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),

                                    ///Top Image
                                    Positioned(
                                      right: -size.width * .015,
                                      top: -size.width * .06,
                                      child: Image.asset(
                                        'assets/images/inject_1.png',
                                        height: size.width * .3,
                                        width: size.width * .3,
                                      ),
                                    ),
                                    Positioned(
                                      left: -size.width * .01,
                                      top: size.width * .12,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: size.width * .04),
                                        child: Text(
                                          "Schedule",
                                          style: TextStyle(
                                              fontSize: size.width * .05,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: size.width * .04,
                                      left: size.width * .03,
                                      right: -5.0,
                                      child: Text('Book Service for\nLater',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: size.width * .038,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Positioned(
                                      bottom: size.width * .008,
                                      right: -size.width * .02,
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Icon(Icons.chevron_right,
                                            size: size.width * .06,
                                            color: Colors.white),
                                        style: ElevatedButton.styleFrom(
                                          shape: const CircleBorder(),
                                          padding:
                                              EdgeInsets.all(size.width * .005),
                                          primary: AllColor.colorArrow,
                                          onPrimary: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: dynamicSize(0.03),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 8.0, top: 20),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Offers & News",
                                  style: TextStyle(
                                      fontSize: dynamicSize(0.08),
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  //color: Colors.pinkAccent,
                                  height: dynamicSize(0.5),
                                  // width: MediaQuery.of(context).size.width/2,
                                  decoration: BoxDecoration(
                                    // color: Colors.pinkAccent,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),

                                    image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/doc.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, bottom: 10),
                                          child: Text(
                                            "Dementia Patient" /*DataControllers.to.getCategoriesResponse.value.data[].*/,
                                            style: TextStyle(
                                                fontSize: dynamicSize(0.075),
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10.0, bottom: 15),
                                          child: Text(
                                            "Total take care for 12 hrs.or 24 hrs. ",
                                            style: TextStyle(
                                              fontSize: dynamicSize(0.045),
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: dynamicSize(0.05),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 8),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Long Time Service",
                                  style: TextStyle(
                                      fontSize: dynamicSize(0.08),
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          Container(
                            height: dynamicSize(.7),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: DataControllers
                                  .to.getCategoriesResponse.value.data!.length,
                              itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 15.0),
                                child: InkWell(
                                  onTap: () {
                                    var serviceValue = Common
                                        .storeSharedPreferences
                                        .getString("service");

                                    if (serviceValue == "long" ||
                                        serviceValue == null ||
                                        serviceValue.isEmpty) {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  LongTimeServicesPage()));
                                    } else {
                                      //  showToast("You already added the long time service");
                                      showAlertForAddCardDeleted("On Demand",
                                          "You already added the on-Demand service");
                                    }
                                  },
                                  child: Container(
                                    width: size.width / 2,
                                    height: dynamicSize(0.2),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 4,
                                          offset:
                                              Offset(4, 4), // Shadow position
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: dynamicSize(0.4),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          /*    decoration: BoxDecoration(
                                            // color: Colors.pinkAccent,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(3)),

                                            image: DecorationImage(
                                              image:   AssetImage(
                                                  "assets/images/pet.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),*/

                                          child: CachedNetworkImage(
                                            width: 120,
                                            imageUrl:
                                                "https://takecare.ltd/${DataControllers.to.getCategoriesResponse.value.data![index].serviceImage! /* == null ?   "https://cdn.vectorstock.com/i/1000x1000/21/73/old-people-in-hospital-vector-34042173.webp": DataControllers.to.shortServiceResponse.value.data![index]!.imagePath */}",
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                CircularProgressIndicator(),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                              "assets/images/pet.png",
                                            ),
                                          ),
                                        ),
                                        Container(
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.only(
                                                left: 10, top: 12),
                                            child: Text(
                                              DataControllers
                                                      .to
                                                      .getCategoriesResponse
                                                      .value
                                                      .data![index]
                                                      .categoryName!
                                                      .isNotEmpty
                                                  ? DataControllers
                                                      .to
                                                      .getCategoriesResponse
                                                      .value
                                                      .data![index]
                                                      .categoryName!
                                                  : "",
                                              style: TextStyle(
                                                  fontSize: dynamicSize(0.06),
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Container(
                                            alignment: Alignment.topLeft,
                                            margin: EdgeInsets.only(
                                                left: 10, bottom: 5, top: 5),
                                            child: Text(
                                              "Starts from ${DataControllers.to.getCategoriesResponse.value.data![index].startPrice!.isNaN ? "0.00" : DataControllers.to.getCategoriesResponse.value.data![index].startPrice!} Tk",
                                              style: TextStyle(
                                                  fontSize: dynamicSize(0.04)),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            endDrawer: _drawer(),
          ),
          isLoading ? LoadingWidget() : Container()
        ],
      ),
    );
  }

  Widget _drawer() => Drawer(
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AllColor.themeColor,
            appBar: AppBar(
//leadingWidth: 0,
                leading: Text(""),
                backgroundColor: Colors.pinkAccent,
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: Size(60, 60),
                  child: Container(
                    // height: dynamicSize(0.5),
                    color: Colors.pinkAccent,
                    child: Column(
                      children: [
                        SizedBox(
                          height: dynamicSize(0.02),
                        ),
                        Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
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
                                        Image.asset('assets/images/baby.png'),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    '${DataControllers.to.userLoginResponse.value.data!.user!.fullName}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: dynamicSize(0.06),
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.all(dynamicSize(.04)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                      onTap: () => Navigator.pop(context),
                                      child: Icon(Icons.arrow_forward,
                                          color: Colors.white)),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: dynamicSize(0.08),
                        ),
                        /*     Text(
                      DataControllers.to.userLoginResponse.value.data !=
                          null
                          ? "${DataControllers.to.userLoginResponse.value.data!.user!.fullName}"
                          : '',
                      style: TextStyle(
                          fontSize: dynamicSize(0.05),
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),*/
                        SizedBox(
                          height: dynamicSize(0.02),
                        ),
                      ],
                    ),
                  ),
                )),
            bottomNavigationBar: BottomAppBar(
              child: InkWell(
                onTap: () {
                  logOutMethod(context);
                },
                child: Container(
                  color: Colors.pinkAccent,
                  height: dynamicSize(0.15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 38.0,
                          ),
                          child: TextButton(
                            onPressed: () {
                              logOutMethod(context);
                            },
                            child: Text(
                              "LogOut",
                              style: TextStyle(
                                  fontSize: dynamicSize(0.03),
                                  color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            body: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(children: [
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 30),
                        child: Container(
                            child: Row(
                          children: [
                            Image.asset(
                              "assets/images/service_history.png",
                              fit: BoxFit.fill,
                              height: 25,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                OrderHistoryPage()));
                                  },
                                  child: Text(
                                    "Order History",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.035),
                                        color: Colors.black),
                                  ),
                                )),
                          ],
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 15),
                        child: Container(
                            child: Row(
                          children: [
                            Image.asset(
                              "assets/images/profile_setup.png",
                              fit: BoxFit.fill,
                              height: 30,
                              color: Colors.black,
                            ),
                            Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) => Profile()));
                                  },
                                  child: Text(
                                    "Profile",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.035),
                                        color: Colors.black),
                                  ),
                                )),
                          ],
                        )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: Container(
                          width: dynamicSize(1),
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/earning.png",
                                height: 25,
                                fit: BoxFit.fill,
                              ),
                              Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (_) => LovedOnesPage()));
                                    },
                                    child: Text(
                                      "Loved One's",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.035),
                                          color: Colors.black),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: Container(
                            width: dynamicSize(1),
                            child: Row(
                              children: [
                                Image.asset("assets/images/payment.png",
                                    height: 30, fit: BoxFit.fill),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    AddressesPage()));
                                      },
                                      child: Text(
                                        "Addresses",
                                        style: TextStyle(
                                            fontSize: dynamicSize(0.035),
                                            color: Colors.black),
                                      ),
                                    )),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: Container(
                            width: dynamicSize(1),
                            child: Row(
                              children: [
                                Image.asset("assets/images/leave.png",
                                    height: 30, fit: BoxFit.fill),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: TextButton(
                                      onPressed: () {
                                        /* Navigator.of(context)
                                        .pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                LeaveRequestPage()));*/
                                      },
                                      child: Text(
                                        "Coupons",
                                        style: TextStyle(
                                            fontSize: dynamicSize(0.035),
                                            color: Colors.black),
                                      ),
                                    )),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: Container(
                            width: dynamicSize(1),
                            child: Row(
                              children: [
                                Image.asset("assets/images/call_service.png",
                                    height: 25, fit: BoxFit.fill),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: TextButton(
                                      onPressed: () {
                                        /* Navigator.of(context)
                                        .pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                HelpPage()));*/
                                      },
                                      child: Text(
                                        "Help Center",
                                        style: TextStyle(
                                            fontSize: dynamicSize(0.035),
                                            color: Colors.black),
                                      ),
                                    )),
                              ],
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 15, left: 20, bottom: 30),
                        child: Container(
                            width: dynamicSize(1),
                            child: Row(
                              children: [
                                Image.asset("assets/images/setting.png",
                                    height: 25, fit: BoxFit.fill),
                                Padding(
                                    padding: const EdgeInsets.only(left: 10.0),
                                    child: TextButton(
                                      onPressed: () {
                                        /*Navigator.of(context)
                                        .pushReplacement(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                SettingsPage()));*/
                                      },
                                      child: Text(
                                        "Settings",
                                        style: TextStyle(
                                            fontSize: dynamicSize(0.035),
                                            color: Colors.black),
                                      ),
                                    )),
                              ],
                            )),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      );

  showAlertForAddCardDeleted(var title, var message) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: dynamicSize(1),
                  alignment: Alignment.topLeft,
                  // height: dynamicSize(0.003),

                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        message,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Are you want to delete Add Card Value ??",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: dynamicSize(0.08),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                                child: Text(
                              "No",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              deleteAllCardData();
                            },
                            child: Container(
                                child: Text(
                              "Yes",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: dynamicSize(0.05),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void deleteAllCardData() async {
    onProgressBar(true);
    await DataControllers.to.deleteAllCard(
        DataControllers.to.userLoginResponse.value.data!.user!.id.toString());
    onProgressBar(false);
    showToast(DataControllers.to.addCardResponse.value.message!);
    if (DataControllers.to.addCardResponse.value.success!) {
      Common.storeSharedPreferences.setString("service", "");
      getAllService();
    }
  }

  late String message;

  String messageDisplay()
  {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk').format(now);

    int check = int.parse(formattedDate);
    if (check > 4 && check < 12) {
      message = "Good Morning!";
    } else if (check > 12 && check < 15) {
      message = "Good Noon!";
    } else if (check > 15 && check < 18) {
      message = "Good Evening!";
    } else if (check > 20 && check < 4) {
      message = "Good Night!";
    }
    return message;
  }
}

void logOutMethod(BuildContext context) {
  Common.storeSharedPreferences.setString("userid", "");
  Common.storeSharedPreferences.setString("pass", "");

  Navigator.of(context)
      .pushReplacement(MaterialPageRoute(builder: (_) => SignInPage()));
}
