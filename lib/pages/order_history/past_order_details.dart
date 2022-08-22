import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takecare_user/api_service/ApiService.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/pages/On%20Demand/feedback_page.dart';
import 'package:takecare_user/pages/On%20Demand/success_payment_page.dart';
import 'package:takecare_user/pages/home_page.dart';
import 'package:takecare_user/pages/provider/provider_profile_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';

class PastOrderDetailsScreen extends StatefulWidget {
  const PastOrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PastOrderDetailsScreen> createState() => _PastOrderDetailsScreenState();
}

class _PastOrderDetailsScreenState extends State<PastOrderDetailsScreen> {

  bool _visitHistory = false;
  bool _seeMore = false;
  bool review  = false;
  bool nullData = false;
  bool paid = false;


  @override
  void initState() {
    if(DataControllers.to.getAvailableProviderList.value.data == null)
      {
        nullData = true;
      }
    super.initState();
  }

  void reviewProvide(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bcs) {
          return Container(
            color: Colors.white,
            height: dynamicSize(0.92),
            child:

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('Select Provider',style: TextStyle(fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold),),
                ),
                Container(
                  height: dynamicSize(0.8),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount:  nullData ? 0 : DataControllers.to.getAvailableProviderList.value.data!.length,
                      itemBuilder: (cx,index)=>
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0 ,left: 8,bottom: 15,right: 8),
                            child: Container(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                  const BorderRadius.all(Radius.circular(30)),
                                                  child: CachedNetworkImage(
                                                    height: 60,
                                                    width: 60,
                                                    fit: BoxFit.cover,
                                                    imageUrl:
                                                    ApiService.MainURL + DataControllers.to.getAvailableProviderList.value.data![0].profilePhoto.toString(),
                                                    placeholder: (context, url) =>
                                                        Image.asset('assets/images/imam.png'),
                                                    errorWidget: (context, url, error) =>
                                                        Image.asset('assets/images/imam.png'),
                                                  ),
                                                ),
                                              ),

                                            ],
                                          ),
                                          InkWell(
                                            onTap: (){

                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => const FeedBackPage()),
                                              );

                                             // Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderProfilePage(providerdata: DataControllers.to.getAvailableProviderList.value.data![0])),);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 10.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("${DataControllers.to.getAvailableProviderList.value.data![0].fullName}",style: TextStyle(fontSize: dynamicSize(0.05),color:AllColor.black,fontWeight: FontWeight.bold),),
                                                  Padding(
                                                    padding: const EdgeInsets.all(3.0),
                                                    child: Row(children: const [
                                                      Text("Designation "),
                                                      Text(""),
                                                    ],),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Text('Monday, 1st Jan, 2021 - Monday, 1st Jan, 2021',textAlign: TextAlign.start),
                                  ),

                                ],
                              ),
                            ),
                          )
                  ),
                ),
              ],
            ),

          );
        });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Details",
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => HomePage()));
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: AllColor.shado_color,
      body: SingleChildScrollView(

        child: Column(

          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 15,right: 15,bottom: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Order Information",
                      style: TextStyle(
                          fontSize: dynamicSize(0.045),
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    color: AllColor.white,
                    child: Text("Package",
                        style: TextStyle(
                          fontSize: dynamicSize(0.045),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: dynamicSize(0.02),
            ),
            Stack(
              children: [
                Container(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            width: 110,
                            height: 100,
                            imageUrl:
                            "https://takecare.ltd/",
                            errorWidget: (context, url, error) => Image.asset(
                              "assets/images/image.png",fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only( top: 10,left: 10),
                                child: Text(
                                  "Attendant for Hospital Visit",
                                  style: TextStyle(
                                      fontSize: dynamicSize(0.04),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: dynamicSize(0.07),
                              ),
                              TextButton(
                                onPressed: () {
                                },
                                child: Text(
                                  "",
                                  style: TextStyle(
                                      fontSize: dynamicSize(0.035),
                                      color: Colors.purple),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                /*Positioned(
                  bottom: 20.0,
                  right: 20.0,
                  child: InkWell(
                      onTap: () {
                      },
                      child: Container(

                        child: const Card(
                          color: AllColor.pink_button,
                          margin: EdgeInsets.only(left: 0,right: 0),
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                                 Radius.circular(5)
                            ),
                          ),
                          elevation: 6,
                          child: Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Text('Order Again',style: TextStyle(color: AllColor.white),),
                          ),
                        ),
                      )
                  ),
                )*/
              ],
            ),
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 10.0, top: 10, right: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Order ID",
                          style: TextStyle(
                              fontSize: dynamicSize(
                                0.04,
                              )),
                        ),
                        Text(
                          "2145215",
                          style: TextStyle(
                              fontSize: dynamicSize(
                                0.04,
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: dynamicSize(0.02),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Text(
                      "Visit History",textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: dynamicSize(
                            0.04,
                          )),
                    ),
                  ),
                  SizedBox(
                    height: dynamicSize(0.02),
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only( top: 10.0),
              child: Container(
                padding: EdgeInsets.only(top: 10,left: 10,bottom: 10,right: 10),
                color: AllColor.white,
                child: Row(

                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(

                      children: [
                        Text('Provider'),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(left: dynamicSize(0.15)),
                      width: dynamicSize(.8),
                      height: dynamicSize((false) ? .32 : .55),
                      color:  Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 5,
                          itemBuilder: (cx,index)=>
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0 ,left: 8,bottom: 15,right: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                                    const BorderRadius.all(Radius.circular(30)),
                                                    child: CachedNetworkImage(
                                                      height: 60,
                                                      width: 60,
                                                      fit: BoxFit.cover,
                                                      imageUrl:
                                                      ApiService.MainURL + (nullData  ? "": DataControllers.to.getAvailableProviderList.value.data![0].profilePhoto.toString()),
                                                      placeholder: (context, url) =>
                                                          Image.asset('assets/images/imam.png'),
                                                      errorWidget: (context, url, error) =>
                                                          Image.asset('assets/images/imam.png'),
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                            InkWell(
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => ProviderProfilePage(providerdata: DataControllers.to.getAvailableProviderList.value.data![0])),);
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 10.0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("${ DataControllers.to.getAvailableProviderList.value.data![0].fullName}",style: TextStyle(fontSize: dynamicSize(0.05),color:AllColor.themeColor,fontWeight: FontWeight.bold),),
                                                    Padding(
                                                      padding: const EdgeInsets.all(3.0),
                                                      child: Row(children: const [
                                                        Text("Designation "),
                                                        Text(""),
                                                      ],),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: Text('Monday, 1st Jan, 2021 - Monday, 1st Jan, 2021',textAlign: TextAlign.start),
                                    ),

                                  ],
                                ),
                              )
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: dynamicSize(0.01),
            ),

            Visibility(visible: _visitHistory,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: dynamicSize(0.03),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "1st Visit",
                            style: TextStyle(fontSize: dynamicSize(0.03)),
                          ),
                          Text(
                            "25 Jan, 2020: 3:30 pm",
                            style: TextStyle(fontSize: dynamicSize(0.03)),
                          ),


                        ],
                      ),
                    ),


                    SizedBox(
                      height: dynamicSize(0.03),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Status",
                            style: TextStyle(fontSize: dynamicSize(0.03)),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Completed",
                              style: TextStyle(fontSize: dynamicSize(0.03),color: Colors.green),
                            ),
                          )
                        ],
                      ),
                    ),
                    _seeMore?Text(""):
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(

                        children: [
                          Spacer(),
                          Text(
                            "See More...",
                            style: TextStyle(fontSize: dynamicSize(0.03)),
                          ),
                          IconButton(onPressed: (){
                            setState(() => _seeMore = true);
                          },
                              icon:    _seeMore?
                              Icon(Icons.keyboard_arrow_up): Icon(Icons.keyboard_arrow_down)),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(visible: _seeMore,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 3.0),
                      child: Container(
                        alignment: Alignment.topLeft,
                        child:  Text(
                          "Upcoming Visit",
                          style: TextStyle(fontSize: dynamicSize(0.03),fontWeight: FontWeight.bold),
                        ),),
                    ),
                    SizedBox(
                      height: dynamicSize(0.04),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "2nd Visit",
                            style: TextStyle(fontSize: dynamicSize(0.03)),
                          ),
                          Text(
                            "25 Jan, 2020: 3:30 pm",
                            style: TextStyle(fontSize: dynamicSize(0.03)),
                          ),


                        ],
                      ),
                    ),


                    SizedBox(
                      height: dynamicSize(0.04),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "2nd Visit",
                            style: TextStyle(fontSize: dynamicSize(0.03)),
                          ),
                          Text(
                            "25 Jan, 2020: 3:30 pm",
                            style: TextStyle(fontSize: dynamicSize(0.03)),
                          ),


                        ],
                      ),
                    ),
                    SizedBox(
                      height: dynamicSize(0.04),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "2nd Visit",
                            style: TextStyle(fontSize: dynamicSize(0.03)),
                          ),
                          Text(
                            "25 Jan, 2020: 3:30 pm",
                            style: TextStyle(fontSize: dynamicSize(0.03)),
                          ),


                        ],
                      ),
                    ),
                    SizedBox(height: dynamicSize(0.03),),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Row(

                        children: [
                          Spacer(),
                          Text(
                            "See Less...",
                            style: TextStyle(fontSize: dynamicSize(0.03)),
                          ),
                          IconButton(onPressed: (){
                            setState(() => _seeMore = false);
                          },
                              icon:    _seeMore?
                              Icon(Icons.keyboard_arrow_up): Icon(Icons.keyboard_arrow_down)),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: dynamicSize(0.01),
            ),
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  //SizedBox(height: dynamicSize(0.03),),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, right: 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Review"),
                        Padding(
                          padding: const EdgeInsets.only(left: 180.0),
                          child:
                              review ?
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                              Text("3.5/5"),
                            ],
                          ) :  TextButton(onPressed: (){

                                reviewProvide(context);




                        /*    setState(() {
                              review = true;
                            });*/


                              }, child: Text("Submit Review",style: TextStyle(fontSize: dynamicSize(0.045),color: Colors.blue),)),

                        ),
                        review ? IconButton(
                            onPressed: () {
                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(builder: (_) => AllReviewPage()));
                            }, icon: Icon(Icons.arrow_forward_ios)) : Container()
                      ],
                    ),
                  ),
                  // SizedBox(height: dynamicSize(0.03),),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 15,right: 15,bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Payment Info and Receipt",
                      style: TextStyle(
                          fontSize: dynamicSize(0.045),
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Text("1,300/-",
                      style: TextStyle(
                        fontSize: dynamicSize(0.045),
                      )),
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.all(13),
              color: AllColor.white,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Status'),
                  Text(paid ? 'Paid' : 'Unpaid',style: TextStyle(color: paid ? Colors.green :Colors.redAccent),)

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(13),
              color: AllColor.white,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Base Price'),
                  Text('1,300/-')

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(13),
              color: AllColor.white,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Coupon'),
                  Text('- 250/-')

                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(13),
              color: AllColor.search_field_color,
              child: Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total'),
                  Text('950/-*',style: TextStyle(color: Colors.black),)

                ],
              ),
            ),


            SizedBox(
              height: dynamicSize(0.04),
            ),
            if(!paid)
              Text('Instead of Cash Payment , you can pay online.'),

            if(paid)
              Text('* Online Payment.\n* Received by TakeCare Health Services Ltd.',textAlign: TextAlign.left,),


            SizedBox(
              height: dynamicSize(0.04),
            ),

            if(!paid)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height:
                      dynamicSize(0.13),
                      width: MediaQuery.of(
                          context)
                          .size
                          .width,
                      child: Container(

                        child: RaisedButton(
                          color: AllColor.colorGreen,
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .only(
                              bottomLeft: Radius
                                  .circular(
                                  0.0),
                            ),
                          ),
                          onPressed:
                              () async {

                            setState((){
                              paid =true;
                            });

                            },
                          textColor:
                          Colors.black,
                          child: Text(
                            "Pay Online",
                            style: TextStyle(
                                fontSize: 18,color: AllColor.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: SizedBox(
                      height:
                      dynamicSize(0.13),
                      width: MediaQuery.of(
                          context)
                          .size
                          .width,
                      child: Container(
                        child: RaisedButton(
                          shape:
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius
                                .only(
                              bottomRight: Radius
                                  .circular(
                                  0.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) =>  SuccessPaymentPage()),
                            );
                          },
                          //color: AllColor.button_color,
                          textColor:
                          Colors.black,
                          child: Text(
                            "Pay Cash",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors
                                    .black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            
          ],
        ),
      ),
    );
  }
  }
