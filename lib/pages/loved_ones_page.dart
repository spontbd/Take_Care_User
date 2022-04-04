import 'package:flutter/material.dart';

import '../public_variables/all_colors.dart';
import '../public_variables/size_config.dart';
import 'home_page.dart';
import 'loved_form_page.dart';

class LovedOnesPage extends StatefulWidget {
  const LovedOnesPage({Key? key}) : super(key: key);

  @override
  _LovedOnesPageState createState() => _LovedOnesPageState();
}

class _LovedOnesPageState extends State<LovedOnesPage> {

  bool editFather = false;


  late FocusNode name;



  @override
  void initState() {
    name = FocusNode();

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
            "Loved One's",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
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
                            Text(
                              "Father",
                              style: TextStyle(
                                  fontSize: dynamicSize(0.05),
                                  ),
                            ),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    editFather = true;
                                    name = FocusNode();
                                    name.requestFocus();
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
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex:1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Name ",
                                      style: TextStyle(fontSize: dynamicSize(0.05)),
                                    ),
                                    Text(
                                      ": ",
                                      style: TextStyle(fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  //height: dynamicSize(0.2),
                                    width: dynamicSize(.5),
                                    child: TextField (
                                      // controller: et_gallery,
                                      enabled: editFather,
                                      focusNode: name,
                                      cursorHeight: dynamicSize(0.06),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Rana Talukder',hintStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)

                                      ),
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Age ",
                                      style: TextStyle(fontSize: dynamicSize(0.05)),
                                    ),
                                    Text(
                                      ": ",
                                      style: TextStyle(fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),

                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  //height: dynamicSize(0.2),
                                    width: dynamicSize(.5),
                                    child: TextField (
                                      // controller: et_gallery,
                                      enabled: editFather,
                                      cursorHeight: dynamicSize(0.06),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '67',hintStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)

                                      ),
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex:1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        "Contact Number",style: TextStyle(fontSize: dynamicSize(0.05))
                                    ),
                                    Text(
                                        ": ",style: TextStyle(fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold)
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: SizedBox(
                                  //height: dynamicSize(0.2),
                                    width: dynamicSize(.5),
                                    child: TextField (
                                      //controller: et_gallery,
                                            enabled: editFather,

                                      cursorHeight: dynamicSize(0.06),
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '01758351395',hintStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)

                                      ),
                                    )
                                ),
                              )
                            ],
                          ),
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
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => LovedFormPage()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AllColor.themeColor,
                  borderRadius: BorderRadius.circular(10),
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
}
