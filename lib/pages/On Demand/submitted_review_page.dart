import 'package:flutter/material.dart';
import 'package:takecare_user/pages/home_page.dart';

import '../../public_variables/size_config.dart';

class ReviewSubmittedPage extends StatefulWidget {
  const ReviewSubmittedPage({Key? key}) : super(key: key);

  @override
  _ReviewSubmittedPageState createState() => _ReviewSubmittedPageState();
}

class _ReviewSubmittedPageState extends State<ReviewSubmittedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: AllColor.themeColor,
        body: SingleChildScrollView(
          child: Column(

            children: [
              SizedBox(
                height: dynamicSize(0.6),
              ),
              Row(
                // crossAxisAlignment:CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(child: Image.asset("assets/images/success.png")),
                ],
              ),

              SizedBox(
                height: dynamicSize(0.1),
              ),

              Text("You have submitted a review",style: TextStyle(fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold),),
              SizedBox(
                height: dynamicSize(0.6),
              ),
              Text("Thank You for Enjoying Our Service(s)",style: TextStyle(fontSize: dynamicSize(0.035)),),
              SizedBox(
                height: dynamicSize(0.04),
              ),
              TextButton(onPressed: (){

                 Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomePage()));
              }, child:Text("Go to Home",style: TextStyle(fontSize: dynamicSize(0.05),color:Colors.green),),
              ),

            ],
          ),
        ));
  }
}
