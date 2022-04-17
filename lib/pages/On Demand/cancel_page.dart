import 'package:flutter/material.dart';
import 'package:takecare_user/pages/On%20Demand/map_page.dart';

import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class CancelPage extends StatelessWidget {
  const CancelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                Text(
                  "Sorry!",
                  style: TextStyle(
                      color: AllColor.themeColor,
                      fontSize: dynamicSize(0.06),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: dynamicSize(0.1),
            ),
            CircleAvatar(
              radius: 40,
              child: ClipOval(child: Image.asset("assets/images/imam.png")),
            ),
            SizedBox(
              height: dynamicSize(0.1),
            ),
            Text(
              "Leya Ajanta Mondol",
              style: TextStyle(
                  fontSize: dynamicSize(0.06), color: AllColor.themeColor),
            ),
            Text(
              "is on the way to accept the service. ",
              style: TextStyle(
                  fontSize: dynamicSize(0.05), color: AllColor.themeColor),
            ),
            SizedBox(
              height: dynamicSize(0.6),
            ),
            Text(
              "Choose Another",
              style: TextStyle(
                  fontSize: dynamicSize(0.06),
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: dynamicSize(0.04),
            ),
            TextButton(
              onPressed: () {
                /*Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => MapePage()));*/
              },
              child: Text(
                "Request again",
                style:
                    TextStyle(fontSize: dynamicSize(0.05), color: Colors.blue),
              ),
            )
          ],
        ),
      )),
    );
  }
}
