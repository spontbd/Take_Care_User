// import 'package:barikoi_maps_place_picker/barikoi_maps_place_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takecare_user/model/LovedOnesResponse.dart';
import 'package:takecare_user/public_variables/notifications.dart';
import 'package:takecare_user/ui/common.dart';

import '../controllers/DataContollers.dart';
import '../public_variables/all_colors.dart';
import '../public_variables/size_config.dart';
import '../ui/variables.dart';
import 'home_page.dart';
import 'loved_ones_page.dart';

class LovedFormPage extends StatefulWidget {

  bool edit;
  LovedOnes? editValue;
  String? activity;
   LovedFormPage({Key? key,this.edit = false,this.editValue,this.activity}) : super(key: key);

  @override
  _LovedFormPageState createState() => _LovedFormPageState();
}

class _LovedFormPageState extends State<LovedFormPage> {
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _mobileNumberController = new TextEditingController();
  TextEditingController _ageController = new TextEditingController();
  TextEditingController _relationController = new TextEditingController();

  // late PickResult selectedPlace = new PickResult();
  String city='';
  String area='';


  @override
  void initState() {

    if(widget.edit)
      {
        _nameController.text = widget.editValue!.name!;
        _mobileNumberController.text = widget.editValue!.contactNo!;
        _ageController.text = widget.editValue!.age!.toString();
        _relationController.text = widget.editValue!.relationship!.toString();
        DataControllers.to.gender.value = widget.editValue!.gender!.replaceFirst(widget.editValue!.gender![0], widget.editValue!.gender![0].toUpperCase());

      }
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
            padding: const EdgeInsets.only(left: 20.0, top: 40, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Provide few Information to \nconnect with you.",
                  style: TextStyle(fontSize: dynamicSize(0.06)),
                ),
                SizedBox(
                  height: dynamicSize(0.12),
                ),

                Container(
                  height: dynamicSize(0.12),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name*',
                        hintStyle:
                        TextStyle(fontSize: dynamicSize(0.04))),
                  ),
                ),

                SizedBox(
                  height: dynamicSize(0.04),
                ),
                Container(
                  height: dynamicSize(0.12),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _mobileNumberController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Mobile Number*',
                        hintStyle:
                        TextStyle(fontSize: dynamicSize(0.04))),
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.04),
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Text("Seeker's Age",style: TextStyle(fontSize: dynamicSize(0.04)),)),
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: dynamicSize(0.12),
                        child: TextField(
                          controller: _ageController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Age*',
                                hintStyle:
                                TextStyle(fontSize: dynamicSize(0.04))),
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

                SizedBox(
                  height: dynamicSize(0.1),
                ),
                Container(
                  height: dynamicSize(0.12),
                  child: TextField(
                    controller: _relationController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Relation*',
                        hintStyle:
                        TextStyle(fontSize: dynamicSize(0.04))),
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
                widget.edit ? editFavAddress() : addAddress();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AllColor.themeColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                height: dynamicSize(0.15),
                child: Text(
                  widget.edit ? 'Edit': "Add",
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

     await DataControllers.to.addFavAddress(_nameController.text,_ageController.text, _mobileNumberController.text,_relationController.text, DataControllers.to.gender.value);

         showToast(DataControllers.to.addFavAddressResponse.value.message.toString());

    ///Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LovedOnesPage()));
  }
  editFavAddress()
  async{
    await DataControllers.to.editFavAddress(widget.editValue!.id!.toString(),_nameController.text,_ageController.text, _mobileNumberController.text,_relationController.text, DataControllers.to.gender.value);

    showToast(DataControllers.to.addFavAddressResponse.value.message.toString());

    ///Navigator.of(context).pop();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => LovedOnesPage()));
  }
}


