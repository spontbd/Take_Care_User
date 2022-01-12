import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/public_variables/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(title: Text('Goog Morning'),),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset("assets/images/baby.png"),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 10, top: 15),
                            child: Text(
                              "Good Morning",
                              style: TextStyle(fontSize: dynamicSize(0.02)),
                            )),
                        Container(
                            margin:
                            EdgeInsets.only(left: 10, bottom: 10, top: 5),
                            child: Text(
                              (
                                  DataControllers.to.userLoginResponse.value.data!
                                  .user!.fullName!.isEmpty
                                  ? " "
                                  : DataControllers.to.userLoginResponse.value
                                  .data!.user!.fullName
                                  .toString()),
                              style:
                              TextStyle(fontSize: 25, color: Colors.pink),
                            )),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                  )
                ],
              ), //appbar design

              Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      SizedBox(height: dynamicSize(0.04)),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text(
                              "On demand",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                ///Red Back
                                Container(
                                  height: dynamicSize(0.2),
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                ///Top Image
                                Positioned(
                                  right: -size.width * .015,
                                  top: -size.width * .06,
                                  child: Image.asset(
                                    'assets/images/inject_1.png',
                                    height: size.width * .3,
                                    width: size.width * .3,
                                  ),
                                ),
                                Positioned(
                                  left: -size.width * .01,
                                  top: size.width * .12,
                                  child: Padding(
                                    padding:
                                    EdgeInsets.only(left: size.width * .04),
                                    child: Text(
                                      "Right Now",
                                      style: TextStyle(
                                          fontSize: size.width * .05,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),

                                Positioned(
                                  bottom: size.width * .04,
                                  left: size.width * .03,
                                  right: -5.0,
                                  child: Text('Book Service for\nRight now',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * .038,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Positioned(
                                  bottom: size.width * .008,
                                  right: -size.width * .02,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.chevron_right,
                                        size: size.width * .06,
                                        color: Colors.white),
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding:
                                      EdgeInsets.all(size.width * .005),
                                      primary: Colors.blue.shade900,
                                      onPrimary: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width:dynamicSize(0.01)),
                          Expanded(
                            child: Stack(
                              children: [
                                ///Red Back
                                Container(
                                  height: dynamicSize(0.2),
                                  decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                ///Top Image
                                Positioned(
                                  right: -size.width * .015,
                                  top: -size.width * .06,
                                  child: Image.asset(
                                    'assets/images/inject_1.png',
                                    height: size.width * .3,
                                    width: size.width * .3,
                                  ),
                                ),
                                Positioned(
                                  left: -size.width * .01,
                                  top: size.width * .12,
                                  child: Padding(
                                    padding:
                                    EdgeInsets.only(left: size.width * .04),
                                    child: Text(
                                      "Schedule",
                                      style: TextStyle(
                                          fontSize: size.width * .05,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: size.width * .04,
                                  left: size.width * .03,
                                  right: -5.0,
                                  child: Text('Book Service for\nLater',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: size.width * .038,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Positioned(
                                  bottom: size.width * .008,
                                  right: -size.width * .02,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Icon(Icons.chevron_right,
                                        size: size.width * .06,
                                        color: Colors.white),
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      padding:
                                      EdgeInsets.all(size.width * .005),
                                      primary: Colors.blue.shade900,
                                      onPrimary: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0, top: 20),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Offers & News",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            )),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              //color: Colors.pinkAccent,
                              height: dynamicSize(0.2),
                              // width: MediaQuery.of(context).size.width/2,
                              decoration: BoxDecoration(
                                // color: Colors.pinkAccent,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),

                                image: DecorationImage(
                                  image: AssetImage("assets/images/doc.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, bottom: 10),
                                      child: Text(
                                        "Right Now",
                                        style: TextStyle(
                                            fontSize: dynamicSize(0.027),
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, bottom: 15),
                                      child: Text(
                                        "Total take care for 12 hrs.or 24 hrs. ",
                                        style: TextStyle(
                                          fontSize: dynamicSize(0.02),
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 8),
                        child: Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Long Time Service",
                              style: TextStyle(
                                  fontSize: dynamicSize(0.027), fontWeight: FontWeight.bold),
                            )),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 5.0),
                          child: Row(
                            children: [
                              Container(
                                width: size.width / 2,
                                height: dynamicSize(0.22),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(4, 4), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height:dynamicSize(0.14),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        // color: Colors.pinkAccent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),

                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/pet.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        margin:
                                        EdgeInsets.only(left: 10, top: 12),
                                        child: Text(
                                          "Dementia Patient",
                                          style: TextStyle(fontSize: size.width*.04),
                                        )),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(
                                            left: 10, bottom: 5, top: 5),
                                        child: Text(
                                          "Starts from 21,000 Tk",
                                          style: TextStyle(fontSize: dynamicSize(0.019)),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: dynamicSize(0.02),
                              ),
                              Container(
                                width: size.width / 2,
                                height: dynamicSize(0.22),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(4, 4), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height:dynamicSize(0.14),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        // color: Colors.pinkAccent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),

                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/pet.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        margin:
                                        EdgeInsets.only(left: 10, top: 12),
                                        child: Text(
                                          "Dementia Patient",
                                          style: TextStyle(fontSize: size.width*.04),
                                        )),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(
                                            left: 10, bottom: 5, top: 5),
                                        child: Text(
                                          "Starts from 21,000 Tk",
                                          style: TextStyle(fontSize: dynamicSize(0.019)),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: dynamicSize(0.02),
                              ),

                              Container(
                                width: size.width / 2,
                                height: dynamicSize(0.22),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(4, 4), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height:dynamicSize(0.14),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        // color: Colors.pinkAccent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),

                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/pet.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        margin:
                                        EdgeInsets.only(left: 10, top: 12),
                                        child: Text(
                                          "Dementia Patient",
                                          style: TextStyle(fontSize: size.width*.04),
                                        )),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(
                                            left: 10, bottom: 5, top: 5),
                                        child: Text(
                                          "Starts from 21,000 Tk",
                                          style: TextStyle(fontSize: dynamicSize(0.019)),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: dynamicSize(0.02),
                              ),
                              Container(
                                width: size.width / 2,
                                height: dynamicSize(0.22),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(4, 4), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height:dynamicSize(0.14),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        // color: Colors.pinkAccent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),

                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/pet.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        margin:
                                        EdgeInsets.only(left: 10, top: 12),
                                        child: Text(
                                          "Dementia Patient",
                                          style: TextStyle(fontSize: size.width*.04),
                                        )),
                                    Container(
                                        alignment: Alignment.topLeft,
                                        margin: EdgeInsets.only(
                                            left: 10, bottom: 5, top: 5),
                                        child: Text(
                                          "Starts from 21,000 Tk",
                                          style: TextStyle(fontSize: dynamicSize(0.019)),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: dynamicSize(0.02),
                              ),
                              Container(
                                width: size.width / 2,
                                height: dynamicSize(0.22),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 4,
                                      offset: Offset(4, 4), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height:dynamicSize(0.14),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: Colors.lightBlue,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Center(
                                        child: Container(
                                            child: ElevatedButton(
                                              onPressed: () {
                                               /* Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          AnimatedSearch()),
                                                );*/
                                              },
                                              child: Icon(Icons.arrow_forward,
                                                  size: 45, color: Colors.white),
                                              style: ElevatedButton.styleFrom(
                                                shape: CircleBorder(),
                                                padding: EdgeInsets.all(8),
                                                primary: Colors.pinkAccent,
                                              ),
                                            )),
                                      ),
                                    ),
                                    Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(top: 16),
                                        child: Text(
                                          "See All",
                                          style: TextStyle(
                                              fontSize: size.width*.04,
                                              color: Colors.pinkAccent),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}