import 'package:flutter/material.dart';
import 'package:takecare_user/pages/home_page.dart';

import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';
import 'massage_page.dart';

class SuccessOrderPage extends StatelessWidget {
  const SuccessOrderPage({Key? key}) : super(key: key);

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
              Text("Thank You",style: TextStyle(fontSize: dynamicSize(0.035),),),
              Text("Your Order Has been Placed",style: TextStyle(fontSize: dynamicSize(0.05)),),
              SizedBox(
                height: dynamicSize(0.6),
              ),
              Text("Enjoy the service of expert hand.",style: TextStyle(fontSize: dynamicSize(0.035)),),
              SizedBox(
                height: dynamicSize(0.04),
              ),
              TextButton(onPressed: (){

                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => HomePage()));
              }, child:Text("Go to Home",style: TextStyle(fontSize: dynamicSize(0.05),color:Colors.blue),),
              )
            ],
          ),
        ));
  }
}
