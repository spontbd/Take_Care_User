import 'package:flutter/material.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';

class RequestPage extends StatelessWidget {
  const RequestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AllColor.themeColor,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  // crossAxisAlignment:CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: Colors.white, fontSize: dynamicSize(0.05)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: dynamicSize(0.2),
                ),
                CircleAvatar(
                  radius: 40,
                  child: ClipOval(child: Image.asset("assets/images/imam.png")),
                ),
                SizedBox(
                  height: dynamicSize(0.1),
                ),
                Text("Leya Ajanta Mondol",style: TextStyle(fontSize: dynamicSize(0.06),color: Colors.white),),
                Text("is on the way to accept the service. ",style: TextStyle(fontSize: dynamicSize(0.05),color: Colors.white),),
                SizedBox(
                  height: dynamicSize(0.8),
                ),
                Text("Please wait",style: TextStyle(fontSize: dynamicSize(0.05),color: Colors.white),),
                Text(". . . .",style: TextStyle(fontSize: dynamicSize(0.1),color: Colors.white),),

              ],
            ),
          )),
    );
  }
}
