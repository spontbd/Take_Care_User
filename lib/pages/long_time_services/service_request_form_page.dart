import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takecare_user/model/LovedOnesResponse.dart';
import 'package:takecare_user/model/SaveAddressResponse.dart';
import 'package:takecare_user/pages/On%20Demand/order_information_page.dart';
import 'package:takecare_user/pages/home_page.dart';
import 'package:takecare_user/pages/loved_ones_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/notifications.dart';
import 'package:takecare_user/public_variables/size_config.dart';
import 'package:takecare_user/widgets/text_field_tile.dart';

import '../../controllers/DataContollers.dart';
import '../../public_variables/variables.dart';

class ServiceRequestFormPage extends StatefulWidget {

  String? mySelf;
  String? activity;


   ServiceRequestFormPage({Key? key, this.mySelf = '',this.activity}) : super(key: key);

  @override
  _ServiceRequestFormPageState createState() => _ServiceRequestFormPageState();
}

class _ServiceRequestFormPageState extends State<ServiceRequestFormPage> {

  TextEditingController _seekerAddress = new TextEditingController();
  TextEditingController _seekerName = new TextEditingController();
  TextEditingController _seekerAgeYear = new TextEditingController();
  TextEditingController _seekerAgeMonth = new TextEditingController();
  // TextEditingController _seekerGender = new TextEditingController();
  TextEditingController _seekerMobileNumber = new TextEditingController();
  TextEditingController _serviceDuration = new TextEditingController();


  @override
  void initState() {
    initData();
    super.initState();
  }


  @override
  Widget build(BuildContext size) {
    final maxLines = 5;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
              /*Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => CaregiverProfile()));*/
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 2,
          title: Text(
            "Services Request Form",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 40, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Provide few Information to \nconnect with you.",
                  style: TextStyle(fontSize: dynamicSize(0.05)),
                ),
                SizedBox(
                  height: dynamicSize(0.1),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: dynamicSize(.14),
                        child: TextField(
                          controller: _seekerAddress,

                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                            ),
                            labelText: 'Seeker\'s Address',
                          ),),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Icon(Icons.my_location_sharp,
                          size: size.width * .06,
                          color: Colors.white),
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding:
                        EdgeInsets.all(size.width * .005),
                        primary: AllColor.colorArrow,
                        onPrimary: Colors.black,
                      ),
                    )
                  ],
                ),
               /* SizedBox(
                  height: dynamicSize(0.05),
                ),
                Text(
                  "Service Duration (Daily)",
                  style: TextStyle(fontSize: dynamicSize(0.05),color: Colors.black),
                ),*/
                SizedBox(
                  height: dynamicSize(0.05),
                ),
                TextField(
                  controller: _serviceDuration,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                    ),
                    labelText: 'Service Duration (Daily ex. 12hrs, 24hrs)'

                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.05),
                ),
                Text(
                  "Service For Whom",
                  style: TextStyle(fontSize: dynamicSize(0.05),color: Colors.black),
                ),
                SizedBox(
                  height: dynamicSize(0.05),
                ),
                TextField(
                  controller: _seekerName,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                    ),
                    labelText: 'Seeker\'s Name',
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.05),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 3,
                        child: Text("Seeker's Age",style: TextStyle(fontSize: dynamicSize(0.05)),)),
                    Expanded(
                      flex: 2,
                      child:

                      Padding(
                        padding: const EdgeInsets.only(right: 3.0),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _seekerAgeYear,
                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                            ),
                            labelText: 'Years',
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child:

                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: _seekerAgeMonth,
                          decoration: new InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                            ),
                            labelText: 'Months',
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
                  children: Variables.genderList
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
                SizedBox(
                  height: dynamicSize(0.05),
                ),
                TextField(
                  controller: _seekerMobileNumber,
                  decoration: new InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AllColor.button_color, width: 1.5),
                    ),
                    labelText: 'Mobile Number*',
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.05),
                ),
                InkWell(
                  onTap: (){
                    if(_serviceValidation())
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => LovedOnesPage(activity: Variables.longTimeServiceActivity
                          ,  serviceAddress: _seekerAddress.text,serviceTime: _serviceDuration.text
                        )));
                  },
                  child: RichText(
              text: TextSpan(
                  text: 'Or, Select from the list of ',
                  style: TextStyle(fontSize: dynamicSize(0.04),color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(text: 'Beloved one\'s ',
                      style: TextStyle(fontSize: dynamicSize(0.04),color: AllColor.pink_button,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
              ),
            ),
                ),
                SizedBox(
                  height: dynamicSize(0.05),
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

                if(_validation() && _serviceValidation())
                  {
                    LovedOnes lovedOnes =   LovedOnes();
                     lovedOnes.age = "${_seekerAgeYear.text}.${_seekerAgeMonth.text}";
                     lovedOnes.gender = DataControllers.to.gender.value;
                     lovedOnes.relationship = 'Self';
                     lovedOnes.contactNo = _seekerMobileNumber.text;
                     lovedOnes.name = _seekerName.text;


                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => OrderInformationPage(activity: Variables.longTimeServiceActivity,
                          serviceHolderInfo : lovedOnes,
                        serviceAddress: _seekerAddress.text, serviceTime: _serviceDuration.text,
                        )));
                  }

              },
              child: Container(
                decoration: BoxDecoration(
                  color: AllColor.themeColor,
                  borderRadius: BorderRadius.circular(5),
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

  void initData() {
    if(widget.mySelf == 'mySelf')
    {
     _seekerName.text =  DataControllers.to.userLoginResponse.value.data!.user!.fullName.toString();

     _seekerMobileNumber.text =  DataControllers.to.userLoginResponse.value.data!.user!.phone.toString();
     print(DataControllers.to.userLoginResponse.value.data!.user!.gender);
     String gender = DataControllers.to.userLoginResponse.value.data!.user!.gender.toString();
     DataControllers.to.gender.value = gender.replaceFirst(gender[0], gender[0].toUpperCase());

      setState(() {
      });
    }
  }

  bool _validation() {
    if(_seekerMobileNumber.text.isEmpty || _seekerAgeYear.text.isEmpty ||  _seekerName.text.isEmpty  || DataControllers.to.gender.value.isEmpty
    )
      {
        showToast('Mandatory field are required');
        return false;
      }
    return true;
  }

  bool _serviceValidation() {
    if(_seekerAddress.text.isEmpty
        || _serviceDuration.text.isEmpty)
      {
        showToast('Service Address and Duration field are required');
        return false;
      }
    return true;
  }
}
