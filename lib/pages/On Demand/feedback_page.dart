import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:takecare_user/pages/On%20Demand/submitted_review_page.dart';
import 'package:takecare_user/pages/On%20Demand/write_review_page.dart';

import '../../controller/data_controller.dart';
import '../../public_variables/all_colors.dart';
import '../../public_variables/notifications.dart';
import '../../public_variables/size_config.dart';

class FeedBackPage extends StatefulWidget {
  const FeedBackPage({Key? key}) : super(key: key);

  @override
  _FeedBackPageState createState() => _FeedBackPageState();
}

class _FeedBackPageState extends State<FeedBackPage> {
  bool _chk1 = false,
      _chk2 = false,
      _chk3 = false,
      _chk4 = false,
      _chk5 = false;

  var _myColorOne = AllColor.shado_color;
  var _myColorTwo = AllColor.shado_color;
  var _myColorThree = AllColor.shado_color;
  var _myColorFour = AllColor.shado_color;
  var _myColorFive = AllColor.shado_color;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(builder: (dataController) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.grey),
          title: Text('Review',
              style: TextStyle(
                  color: AllColor.black, fontSize: dynamicSize(.045))),
          leading: InkWell(
            onTap: () {
              /*Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => CaregiverProfile()));*/
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          titleSpacing: 0.0,
          elevation: 0.0,
        ),
        body: _bodyUI(dataController),
      );
    });
  }

  Widget _bodyUI(DataController dataController) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(icon: new Icon(Icons.star, size: dynamicSize(0.1),),

      onPressed: ()=>setState((){
  _myColorOne=Colors.orange;
  _myColorTwo=AllColor.shado_color;
  _myColorThree=AllColor.shado_color;
  _myColorFour=AllColor.shado_color;
  _myColorFive=AllColor.shado_color;
  }),color: _myColorOne,),
   IconButton(icon: new Icon(Icons.star, size: dynamicSize(0.1),),
  onPressed: ()=>setState((){
  _myColorOne=Colors.orange;
  _myColorTwo=Colors.orange;
  _myColorThree=AllColor.shado_color;
  _myColorFour=AllColor.shado_color;
  _myColorFive=AllColor.shado_color;
  }),color: _myColorTwo,),
   IconButton(icon: new Icon(Icons.star, size: dynamicSize(0.1),), onPressed: ()=>setState((){
  _myColorOne=Colors.orange;
  _myColorTwo=Colors.orange;
  _myColorThree=Colors.orange;
  _myColorFour=AllColor.shado_color;
  _myColorFive=AllColor.shado_color;
  }),color: _myColorThree,),
   IconButton(icon: new Icon(Icons.star, size: dynamicSize(0.1),
  ), onPressed: ()=>setState((){
  _myColorOne=Colors.orange;
  _myColorTwo=Colors.orange;
  _myColorThree=Colors.orange;
  _myColorFour=Colors.orange;
  _myColorFive=AllColor.shado_color;
  }),color: _myColorFour,),
  new IconButton(icon: new Icon(Icons.star, size: dynamicSize(0.1),), onPressed: ()=>setState((){
  _myColorOne=Colors.orange;
  _myColorTwo=Colors.orange;
  _myColorThree=Colors.orange;
  _myColorFour=Colors.orange;
  _myColorFive=Colors.orange;
  }),color: _myColorFive,),
                      ],
                    ),
                  ),
                  SizedBox(height: dynamicSize(0.1),),
                  Row(
                    children: [
                      Checkbox(
                          value: _chk1,
                          onChanged: (val) => setState(() => _chk1 = val!)),
                      Text('Predefine Text 01',
                          style: TextStyle(fontSize: dynamicSize(.04))),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: _chk2,
                          onChanged: (val) => setState(() => _chk2 = val!)),
                      Text('Predefine Text 02',
                          style: TextStyle(fontSize: dynamicSize(.04))),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: _chk3,
                          onChanged: (val) => setState(() => _chk3 = val!)),
                      Text('Predefine Text 03',
                          style: TextStyle(fontSize: dynamicSize(.04))),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: _chk4,
                          onChanged: (val) => setState(() => _chk4 = val!)),
                      Text('Predefine Text 04',
                          style: TextStyle(fontSize: dynamicSize(.04))),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: _chk5,
                          onChanged: (val) => setState(() => _chk5 = val!)),
                      Text('Predefine Text 05',
                          style: TextStyle(fontSize: dynamicSize(.04))),
                    ],
                  ),
                  dataController.feedbackController.value.text.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: dynamicSize(.1)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                      onTap: () =>
                                          Get.to(() => WriteReviewPage()),
                                      child: Text('EDIT',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold)))
                                ],
                              ),
                              SizedBox(height: dynamicSize(.02)),
                              Text(dataController.feedbackController.value.text,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),

          ///Bottom Section
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: Column(
              children: [
                dataController.feedbackController.value.text.isEmpty
                    ? TextButton(
                        onPressed: () => Get.to(() => WriteReviewPage()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.chat,
                                color: AllColor.button_color,
                                size: dynamicSize(.07)),
                            SizedBox(width: dynamicSize(.02)),
                            Text('Write Review',
                                style: TextStyle(
                                    color: AllColor.button_color,
                                    fontSize: dynamicSize(.038)))
                          ],
                        ),
                      )
                    : Container(),
                ElevatedButton(
                    onPressed: () {
                      if (dataController
                          .feedbackController.value.text.isNotEmpty) {
                        dataController.clearFeedController();
                        showToast('Your Review Submitted');
                        Get.offAll(()=>ReviewSubmittedPage());
                      } else
                        showToast('Write Your Review');
                    },
                    style: ElevatedButton.styleFrom(
                        primary:
                            dataController.feedbackController.value.text.isEmpty
                                ? AllColor.textFieldColor
                                : AllColor.themeColor,
                        elevation: 0.0),
                    child: Padding(
                      padding: EdgeInsets.all(dynamicSize(.035)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Submit Review',
                              style: TextStyle(
                                  fontSize: dynamicSize(.04),
                                  color: dataController
                                          .feedbackController.value.text.isEmpty
                                      ? AllColor.cancel_icon_color
                                      : Colors.white)),
                        ],
                      ),
                    )),
              ],
            ),
          )
        ],
      );
}
