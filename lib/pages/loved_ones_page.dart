import 'package:flutter/material.dart';
import 'package:takecare_user/controller/data_controller.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/model/LovedOnesResponse.dart';
import 'package:takecare_user/model/SaveAddressResponse.dart';
import 'package:takecare_user/pages/On%20Demand/on_demand_page.dart';
import 'package:takecare_user/pages/On%20Demand/order_information_page.dart';
import 'package:takecare_user/public_variables/variables.dart';

import '../public_variables/all_colors.dart';
import '../public_variables/size_config.dart';
import 'home_page.dart';
import 'loved_form_page.dart';

class LovedOnesPage extends StatefulWidget {
  String? activity;
  String? serviceTime;
  String? serviceAddress;
  LovedOnesPage({Key? key,this.activity,  this.serviceTime, this.serviceAddress}) : super(key: key);

  @override
  _LovedOnesPageState createState() => _LovedOnesPageState();
}

class _LovedOnesPageState extends State<LovedOnesPage> {

  //bool editFather = false;


  //late FocusNode name;

  LovedOnesResponse addressResponse = new LovedOnesResponse();

  int length = 0;


  @override
  void initState() {
    getFavAddressList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AllColor.shado_color,
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
            },
            child: Icon(
              Icons.arrow_back,
              color: AllColor.themeColor,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Loved One's",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: ListView.builder(
          itemCount: length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                print(widget.activity);
                if(widget.activity == Variables.onDemandServiceActivity)
                  {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => OnDemandPage( )));

                  }
                else if(widget.activity == Variables.longTimeServiceActivity || widget.activity == Variables.orderInformationActivity)
                    {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => OrderInformationPage( activity: Variables.lovedOnesActivity, serviceHolderInfo: addressResponse.data![index],
                          serviceAddress: widget.serviceAddress,serviceTime: widget.serviceTime)));

                    }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,

                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,top: 10,bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${addressResponse.data![index].relationship}',
                            style: TextStyle(
                              fontSize: dynamicSize(0.05)
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(builder: (_) => LovedFormPage(edit: true,editValue: addressResponse.data![index],activity: widget.activity,)));
                                });
                              },
                              child:
                              (widget.activity == Variables.homeActivity ) ? Text(
                                "Edit",
                                style: TextStyle(
                                    color: AllColor.themeColor,
                                    fontSize: dynamicSize(0.05)),
                              )   : Container()

                          )
                        ],
                      ),
                      Container(
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40),
                          child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Name ",
                                    style: TextStyle(fontSize: dynamicSize(0.04)),
                                  ),
                                  Text(
                                    ": ",
                                    style: TextStyle(fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child:
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Text(
                                  '${addressResponse.data![index].name}',
                                  style: TextStyle(fontSize: dynamicSize(0.04),fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        ),
                        ),
                      ),
                      Container(
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Age ",
                                      style: TextStyle(fontSize: dynamicSize(0.04)),
                                    ),
                                    Text(
                                      ": ",
                                      style: TextStyle(fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child:
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    '${addressResponse.data![index].age} Year(s)',
                                    style: TextStyle(fontSize: dynamicSize(0.04),fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [

                              Expanded(
                                flex:2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Contact Number",style: TextStyle(fontSize: dynamicSize(0.04))
                                    ),
                                    Text(
                                        ": ",style: TextStyle(fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold)
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Text(
                                    '${addressResponse.data![index].contactNo}',
                                    style: TextStyle(fontSize: dynamicSize(0.04),fontWeight: FontWeight.bold),
                                  ),
                                ),

                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),

        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          //color: AllColor.themeColor,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8,bottom: 8,top: 20),
            child: InkWell(
              onTap: (){
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => LovedFormPage(activity: widget.activity,)));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AllColor.themeColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                height: dynamicSize(0.15),
                child: Text(
                  "Add New ",
                  style: TextStyle(fontSize: dynamicSize(0.05), color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void getFavAddressList()async {

    addressResponse = await DataControllers.to.getFavAddress();

    if(addressResponse.success!)
      {
        setState(()  {
          length = addressResponse.data!.length ;
       //   addressResponse;
        });
      }
  }
}
