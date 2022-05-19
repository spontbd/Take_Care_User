import 'package:flutter/material.dart';

import '../public_variables/all_colors.dart';
import '../public_variables/size_config.dart';
import 'home_page.dart';


class AddressesPage extends StatefulWidget {
  const AddressesPage({Key? key}) : super(key: key);

  @override
  _AddressesPageState createState() => _AddressesPageState();
}

class _AddressesPageState extends State<AddressesPage> {

  bool editAddress = false;

  late FocusNode address;

  @override
  void initState() {
    address = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: AllColor.shado_color,
      appBar:  AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
          },
          child: Icon(
            Icons.arrow_back,
            color: AllColor.themeColor,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Addresses",
          style: TextStyle(color: Colors.black),
        ),
      ),

      body:SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0,right: 8,top: 10,bottom: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25.0),
                            child: Text(
                              "Home",
                              style: TextStyle(
                                fontSize: dynamicSize(0.05),
                              ),
                            ),
                          ),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  editAddress = true;
                                  address = FocusNode();
                                  address.requestFocus();
                                });
                              },
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    color: AllColor.themeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: dynamicSize(0.05)),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: dynamicSize(0.03),
                      ),
                     Row(
                       children: [
                         Icon(Icons.location_on_outlined,color: Colors.green,),
                         SizedBox(
                           width: MediaQuery.of(context).size.width/1.4,
                           child: TextField (
                             // controller: et_gallery,
                             enabled: editAddress,
                             focusNode: address,
                             cursorHeight: dynamicSize(0.05),
                             decoration: InputDecoration(
                                 border: InputBorder.none,
                                 hintText: 'Heaven Palace, Uttara, Dhaka',hintStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)

                             ),
                           ),
                         ),
                       ],
                     ),

                    ],
                  ),
                ),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        //color: AllColor.themeColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: (){
             /* Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => LovedFormPage()));*/
            },
            child: Container(
              decoration: BoxDecoration(
                color: AllColor.themeColor,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              height: dynamicSize(0.15),
              child: Text(
                "Add New Address ",
                style: TextStyle(fontSize: dynamicSize(0.05), color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}

