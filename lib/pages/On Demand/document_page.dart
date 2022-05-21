import 'package:flutter/material.dart';
import 'package:takecare_user/pages/On%20Demand/image_page.dart';

import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';
import 'caregiver_profile_page.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({Key? key}) : super(key: key);

  @override
  _DocumentPageState createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text("Caregiver Profile"),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => CaregiverProfile()));
          },
          child: Icon(Icons.arrow_back),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none, children: [
                Container(
                  height: dynamicSize(.4),
                  width: dynamicSize(1.4),
                  decoration: BoxDecoration(
                    color: AllColor.themeColor,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                    ),
                  ),
                ),
                Positioned(
                  top: dynamicSize(0.24),
                  left: MediaQuery.of(context).size.width / 2.5,
                  child: InkWell(
                    onTap: () {
                      /* Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => ImageViewPage()));*/
                    },
                    child: Container(
                      width: 110.0,
                      height: 110.0,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                            style: BorderStyle.solid),
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/baby.png"),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: dynamicSize(0.5),
                  left: MediaQuery.of(context).size.width / 2.25,
                  child: Container(
                      width: dynamicSize(0.18),
                      //color: Colors.red,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orangeAccent,
                          ),
                          Text(
                            "3.5",
                            style: TextStyle(color: Colors.white),
                          ),
                          Text(
                            "/5",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      )),
                ),
                Positioned(
                  top: dynamicSize(0.6),
                  left: MediaQuery.of(context).size.width / 2.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Leya Ajanta Mondol",
                        // ("${DataControllers.to.userLoginResponse.value.data!.user!.fullName}"),
                        style: TextStyle(
                            fontSize: dynamicSize(0.05),
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent),
                      ),
                      Text("Caregiver"),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: dynamicSize(0.4),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  //requestView = true;
                });
              },
              child: Container(
                width: dynamicSize(0.4),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: 15, bottom: 15),
                  child: Text(
                    'View Profile',
                    style: TextStyle(fontSize: dynamicSize(0.05)),
                  ),
                ),
                decoration: BoxDecoration(
                  color: AllColor.shado_color,
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(
              height: dynamicSize(0.04),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Container(
                child: Text(
                  "Documents",
                  style: TextStyle(
                      fontSize: dynamicSize(0.04), color: Colors.blue),
                ),
                alignment: Alignment.topLeft,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8, top: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "NID",
                    style: TextStyle(fontSize: dynamicSize(0.04)),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => ImageViewPage()));

                    },
                    child: Image.asset("assets/images/image.png"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8, top: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Experience Certificate",
                    style: TextStyle(fontSize: dynamicSize(0.04)),
                  ),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => ImageViewPage()));
                      },
                      child: Image.asset("assets/images/image.png"))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8, top: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "SSC Certificate",
                    style: TextStyle(fontSize: dynamicSize(0.04)),
                  ),
                  InkWell(
                      onTap: (){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (_) => ImageViewPage()));
                      },
                      child: Image.asset("assets/images/image.png"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
