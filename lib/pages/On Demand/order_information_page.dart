
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:takecare_user/controller/data_controller.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/model/LovedOnesResponse.dart';
import 'package:takecare_user/model/provider/provider_data.dart';
import 'package:takecare_user/pages/loved_ones_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/notifications.dart';
import 'package:takecare_user/public_variables/size_config.dart';
import 'package:takecare_user/public_variables/variables.dart';

class OrderInformationPage extends StatefulWidget {
  String? activity;
  String? serviceTime;
  String? serviceAddress;
  LovedOnes? serviceHolderInfo;

  OrderInformationPage(
      {Key? key,
      this.reqDocId,
      this.receiverId,
      this.activity,
      this.serviceTime,
      this.serviceAddress,
      this.serviceHolderInfo,
      this.providerData})
      : super(key: key);
  String? reqDocId;
  String? receiverId;
  ProviderData? providerData;

  @override
  _OrderInformationPageState createState() => _OrderInformationPageState();
}

class _OrderInformationPageState extends State<OrderInformationPage> {
  bool orderList = false;
  bool editInformation = false;
  late FocusNode name;
  bool addCoupon = false;
  double discountAmount = 0;
  TextEditingController _couponController = TextEditingController();
  TextEditingController _orderNoteController = TextEditingController();

  @override
  void initState() {
    name = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _couponController.dispose();
    _orderNoteController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(builder: (dc) {
      return SafeArea(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('request')
                .doc(widget.reqDocId)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Stack(
                  children: [
                    Scaffold(
                      backgroundColor: AllColor.shado_color,
                      appBar: AppBar(
                        backgroundColor: Colors.white,
                        title: const Text(
                          "Order Information ",
                          style: TextStyle(
                              fontFamily: 'Muli',
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                        ),
                        leading: InkWell(
                          onTap: () {
                            // Navigator.of(context).pushReplacement(
                            //   MaterialPageRoute(builder: (_) => CaregiverProfile()));
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                        elevation: 0,
                      ),
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: dynamicSize(0.03),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Total Added Service",
                                          style: TextStyle(
                                              fontFamily: 'Muli',
                                              fontWeight: FontWeight.w600,
                                              fontSize: dynamicSize(0.05)),
                                        ),
                                        Row(
                                          children: [
                                            if (widget.activity != null)
                                              Text(
                                                (widget.activity ==
                                                        Variables
                                                            .onDemandServiceActivity)
                                                    ? "Total: "
                                                    : '(${DataControllers.to.getAddCardLongServiceResponse.value.data!.length.toString()})',
                                                style: TextStyle(
                                                    fontFamily: 'Muli',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        dynamicSize(0.05)),
                                              ),
                                            if (widget.activity ==
                                                Variables
                                                    .onDemandServiceActivity)
                                              Text(
                                                "",
                                                style: TextStyle(
                                                    fontFamily: 'Muli',
                                                    fontWeight: FontWeight.w600,
                                                    fontSize:
                                                        dynamicSize(0.05)),
                                              ),
                                            if (widget.activity ==
                                                Variables
                                                    .onDemandServiceActivity)
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      orderList = !orderList;
                                                    });
                                                  },
                                                  icon: orderList
                                                      ? const Icon(
                                                          Icons
                                                              .keyboard_arrow_up,
                                                          color: AllColor
                                                              .themeColor,
                                                        )
                                                      : const Icon(
                                                          Icons
                                                              .keyboard_arrow_down,
                                                          color: AllColor
                                                              .themeColor,
                                                        ))
                                          ],
                                        )
                                      ],
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.only(top: 8.0),
                                    //   child: Row(
                                    //     mainAxisAlignment:
                                    //         MainAxisAlignment.spaceBetween,
                                    //     children: [
                                    //       Text(
                                    //         ' Service Duration',
                                    //         style: TextStyle(
                                    //             fontFamily: 'Muli',
                                    //             fontWeight: FontWeight.w600,
                                    //             fontSize: dynamicSize(0.05)),
                                    //       ),
                                    //       Text(
                                    //         '${Variables.serviceTime} Hrs',
                                    //         style: TextStyle(
                                    //             fontFamily: 'Muli',
                                    //             fontWeight: FontWeight.w600,
                                    //             fontSize: dynamicSize(0.05)),
                                    //       ),
                                    //     ],
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                              color: Colors.white,
                            ),
                            if (widget.activity ==
                                Variables.onDemandServiceActivity)
                              Visibility(
                                visible: orderList,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 8),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Total Price",
                                              style: TextStyle(
                                                  fontFamily: 'Muli',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: dynamicSize(0.05)),
                                            ),
                                            Text(
                                              '${widget.providerData!.provider_service_total_price.toString()}/-',
                                              style: TextStyle(
                                                  fontFamily: 'Muli',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: dynamicSize(0.05)),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: dynamicSize(0.06),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Promo Applied",
                                              style: TextStyle(
                                                  fontFamily: 'Muli',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: dynamicSize(0.05)),
                                            ),
                                            Text(
                                              "- ${ discountAmount != 0 ? widget.providerData!.provider_service_total_price! - discountAmount : 0.0}/-",
                                              style: TextStyle(
                                                  fontFamily: 'Muli',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: dynamicSize(0.05)),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: dynamicSize(0.06),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Sub Total",
                                              style: TextStyle(
                                                fontSize: dynamicSize(0.05),
                                                fontFamily: 'Muli',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                            Text(
                                              "${(discountAmount == 0 ? widget.providerData!.provider_service_total_price.toString() : discountAmount)}/-",
                                              style: TextStyle(
                                                fontSize: dynamicSize(0.05),
                                                fontFamily: 'Muli',
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            SizedBox(
                              height: dynamicSize(0.03),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, top: 15, bottom: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Visiting Address",
                                      style: TextStyle(
                                          fontFamily: 'Muli',
                                          fontWeight: FontWeight.w600,
                                          fontSize: dynamicSize(0.05)),
                                    ),
                                    SizedBox(
                                      height: dynamicSize(0.02),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on_outlined,
                                          color: Colors.green,
                                        ),
                                        Expanded(
                                          child:
                                              Text("${widget.serviceAddress}",
                                                  style: TextStyle(
                                                    fontSize: dynamicSize(0.05),
                                                    fontFamily: 'Muli',
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              color: Colors.white,
                            ),
                            if (widget.serviceHolderInfo != null)
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20.0, right: 20, top: 15, bottom: 15),
                                child: Row(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Service For -",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.05),
                                          fontFamily: 'Muli',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                              ),
                            if (widget.serviceHolderInfo != null)
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 20, bottom: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            widget.serviceHolderInfo!
                                                    .relationship ??
                                                '',
                                            style: TextStyle(
                                                fontFamily: 'Muli',
                                                fontWeight: FontWeight.w600,
                                                fontSize: dynamicSize(0.05),
                                                color: AllColor.black),
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  LovedOnesPage(
                                                                    activity:
                                                                        Variables
                                                                            .orderInformationActivity,
                                                                    serviceAddress:
                                                                        widget
                                                                            .serviceAddress,
                                                                    serviceTime:
                                                                        Variables
                                                                            .serviceTime,
                                                                  )));
                                                });
                                              },
                                              child: Text(
                                                "Change",
                                                style: TextStyle(
                                                    fontFamily: 'Muli',
                                                    fontWeight: FontWeight.w600,
                                                    color: AllColor.themeColor,
                                                    fontSize:
                                                        dynamicSize(0.05)),
                                              ))
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Name ",
                                                        style: TextStyle(
                                                            fontFamily: 'Muli',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                dynamicSize(
                                                                    0.05)),
                                                      ),
                                                      Text(
                                                        ": ",
                                                        style: TextStyle(
                                                          fontSize:
                                                              dynamicSize(0.05),
                                                          fontFamily: 'Muli',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 3.0),
                                                    child: SizedBox(
                                                        //height: dynamicSize(0.2),
                                                        width: dynamicSize(.5),
                                                        child: TextField(
                                                          // controller: et_gallery,
                                                          enabled:
                                                              editInformation,
                                                          focusNode: name,
                                                          cursorHeight:
                                                              dynamicSize(0.06),
                                                          decoration:
                                                              InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  hintText: widget
                                                                      .serviceHolderInfo!
                                                                      .name,
                                                                  hintStyle:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontFamily:
                                                                        'Muli',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  )),
                                                        )),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        "Age ",
                                                        style: TextStyle(
                                                            fontFamily: 'Muli',
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontSize:
                                                                dynamicSize(
                                                                    0.05)),
                                                      ),
                                                      Text(
                                                        ": ",
                                                        style: TextStyle(
                                                          fontFamily: 'Muli',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize:
                                                              dynamicSize(0.05),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "${widget.serviceHolderInfo!.age!} Year(s)",
                                                    style: TextStyle(
                                                        fontFamily: 'Muli',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize:
                                                            dynamicSize(0.05)),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 12),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Gender ",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Muli',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize:
                                                                  dynamicSize(
                                                                      0.05)),
                                                        ),
                                                        Text(
                                                          ": ",
                                                          style: TextStyle(
                                                            fontSize:
                                                                dynamicSize(
                                                                    0.05),
                                                            fontFamily: 'Muli',
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 1,
                                                    child: Text(
                                                      "${widget.serviceHolderInfo!.gender!}",
                                                      style: TextStyle(
                                                          fontFamily: 'Muli',
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: dynamicSize(
                                                              0.05)),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text("Contact Number",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  dynamicSize(
                                                                      0.05))),
                                                      Text(": ",
                                                          style: TextStyle(
                                                              fontSize:
                                                                  dynamicSize(
                                                                      0.05),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: SizedBox(
                                                      //height: dynamicSize(0.2),
                                                      width: dynamicSize(.5),
                                                      child: TextField(
                                                        // controller: et_gallery,
                                                        enabled:
                                                            editInformation,

                                                        cursorHeight:
                                                            dynamicSize(0.06),
                                                        decoration: InputDecoration(
                                                            border: InputBorder
                                                                .none,
                                                            hintText: widget
                                                                .serviceHolderInfo!
                                                                .contactNo!,
                                                            hintStyle: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      )),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                color: Colors.white,
                              ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20, top: 15, bottom: 15),
                              child: Row(
                                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Additional Note",
                                    style: TextStyle(
                                        fontSize: dynamicSize(0.05),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: dynamicSize(0.25),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 8),
                                child: TextField(
                                  controller: _orderNoteController,
                                  cursorHeight: dynamicSize(0.06),
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText:
                                          '(ex. Bring a syringe of 5ml..……..)',
                                      hintStyle: TextStyle(
                                          fontSize: dynamicSize(0.035))),
                                ),
                              ),
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: dynamicSize(0.03),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Promo Code",
                                          style: TextStyle(
                                              fontSize: dynamicSize(0.05)),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Container(
                                            height: dynamicSize(0.18),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.0,
                                                  vertical: 10),
                                              child: TextField(
                                                controller: _couponController,
                                                cursorHeight: dynamicSize(0.06),
                                                decoration: InputDecoration(
                                                    border:
                                                        OutlineInputBorder(),
                                                    labelText:
                                                        'Write your Promo code',
                                                    hintStyle: TextStyle(
                                                        fontSize: dynamicSize(
                                                            0.035))),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () async {
                                          await DataControllers.to
                                              .checkoutDiscount(
                                                  _couponController.text,
                                                  widget.providerData!
                                                      .provider_service_total_price
                                                      .toString());
                                          if (DataControllers
                                              .to.couponPrize.value.success!) {
                                            setState(() {
                                              discountAmount = DataControllers
                                                  .to
                                                  .couponPrize
                                                  .value
                                                  .data!
                                                  .discount!
                                                  .toDouble();
                                            });
                                          }
                                        },
                                        child: Text(
                                          "+ Apply",
                                          style: TextStyle(
                                              fontSize: dynamicSize(0.05),
                                              color: Colors.blue),
                                        ))
                                  ],
                                ),
                              ),
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      bottomNavigationBar: BottomAppBar(
                        elevation: 0,
                        //color: AllColor.themeColor,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8, bottom: 8, top: 15),
                          child: InkWell(
                            onTap: () async {
                              dc.loading(true);
                              GeocodingResult result = GeocodingResult(
                                  formattedAddress:
                                      snapshot.data!.get('booking_address'),
                                  geometry: Geometry(
                                      location: Location(
                                          lng: snapshot.data!.get('lng'),
                                          lat: snapshot.data!.get('lat'))),
                                  placeId: '');

                              // lng
                              await DataControllers.to.pleaceOrder(
                                  snapshot.data!
                                      .get('request_number')
                                      .toString(),
                                  widget.providerData,
                                  result,
                                  _couponController.text,
                                  _orderNoteController.text);

                              await dc.confirmOrder(widget.reqDocId!, widget.receiverId!,widget.providerData);

                              dc.loading(true);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: AllColor.themeColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              alignment: Alignment.center,
                              height: dynamicSize(0.15),
                              child: Text(
                                "Confirm this Order",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.05),
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (dc.loading.value) loadingWidget()
                  ],
                );
              } else if (snapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              } else if (!snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                return const Text('No Data');
              } else {
                return Container();
              }
            }),
      );
    });
  }
}
