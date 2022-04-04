import 'package:flutter/material.dart';

import '../../public_variables/size_config.dart';

class SuccessPaymentPage extends StatefulWidget {
  const SuccessPaymentPage({Key? key}) : super(key: key);

  @override
  _SuccessPaymentPageState createState() => _SuccessPaymentPageState();
}

class _SuccessPaymentPageState extends State<SuccessPaymentPage> {
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

              Text("Payment received Successfully!",style: TextStyle(fontSize: dynamicSize(0.05),fontWeight: FontWeight.bold),),
              SizedBox(
                height: dynamicSize(0.6),
              ),
              Text("Thank You for Enjoying Our Service(s)",style: TextStyle(fontSize: dynamicSize(0.035)),),
              SizedBox(
                height: dynamicSize(0.04),
              ),
              TextButton(onPressed: (){

                /* Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => MapePage()));*/
              }, child:Text("Go to Home",style: TextStyle(fontSize: dynamicSize(0.05),color:Colors.green),),
              ),
              SizedBox(
                height: dynamicSize(0.04),
              ),
              TextButton(onPressed: (){

                /* Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => MapePage()));*/
              }, child:Text("Give a Feedback",style: TextStyle(fontSize: dynamicSize(0.05),color:Colors.blue),),
              ),
            ],
          ),
        ));
  }
}
