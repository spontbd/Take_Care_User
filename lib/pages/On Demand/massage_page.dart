import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:takecare_user/pages/On%20Demand/on_demand_page.dart';

import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class MassagePage extends StatefulWidget {
  const MassagePage({Key? key}) : super(key: key);

  @override
  _MassagePageState createState() => _MassagePageState();
}

class _MassagePageState extends State<MassagePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///Appbar
            Material(
              color: Colors.white,
              elevation: 2,
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => OnDemandPage()));
                  }, icon: Icon(Icons.arrow_back)),
                  CircleAvatar(
                    backgroundColor: AllColor.button_color,
                    radius: 19,
                    child: Icon(Icons.person,color: Colors.white,size: dynamicSize(.09)),
                  ),
                  SizedBox(width: dynamicSize(.03)),
                  Text('Mr. Ashik',style: TextStyle(color: AllColor.black,fontSize: dynamicSize(.045)),)
                ],
              ),
            ),
            SizedBox(height: 3),

            Expanded(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context,index)=>Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 15.0),
                  child: Row(
                    mainAxisAlignment: index%2==0
                        ?MainAxisAlignment.start
                        :MainAxisAlignment.end,
                    crossAxisAlignment:CrossAxisAlignment.start,
                    children: [
                      index%2==0
                          ?CircleAvatar(
                        radius: dynamicSize(.04),
                        child: Icon(Icons.person_sharp,color: Colors.white),
                      ):Container(),
                      SizedBox(width: 10),

                      Container(
                          width: MediaQuery.of(context).size.width*.6,
                          child: Text(
                            'Block G/1, 05/12, Mohammadpur, Mirpur-13, Dhaka 1216',
                            textAlign: index%2==0
                                ?TextAlign.start:TextAlign.end,
                          )),

                      SizedBox(width: 10),
                      index%2==0
                          ?Container()
                          :CircleAvatar(
                        radius: dynamicSize(.04),
                        child: Icon(Icons.person,color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            ///Message box
            Padding(
              padding: const EdgeInsets.only(bottom: 5,left: 10,right: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      maxLines: 5,
                      minLines: 1,
                      decoration: InputDecoration(
                          fillColor:AllColor.textFieldColor,
                          filled: true,
                          contentPadding: EdgeInsets.all(5),
                          isDense: true,
                          prefixIcon: Icon(Icons.chat,
                              size: dynamicSize(.07),
                              color: Colors.grey.shade700),
                          hintText: 'Write Message...',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(50))
                          )
                      ),
                    ),
                  ),
                  SizedBox(width: 3),

                  ///New Message
                  IconButton(
                      onPressed: (){},
                      icon: Icon(Icons.send,color: AllColor.button_color,size: dynamicSize(.1)),
                      splashRadius: dynamicSize(.07))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
