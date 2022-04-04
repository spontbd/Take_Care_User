import 'package:flutter/material.dart';
import 'package:takecare_user/pages/home_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}


class _ProfileState extends State<Profile> {
  bool name = false;
  bool email = false;
  bool password = false;
  bool mobile_number = false;
  bool age = false;


  late FocusNode Name;
  late FocusNode Email;
  late FocusNode Password;
  late FocusNode Mobile_Number;
  late FocusNode Age;



  @override
  void initState() {
    Name = FocusNode();
    Email = FocusNode();
    Password = FocusNode();
    Mobile_Number = FocusNode();
    Age = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(fontSize: dynamicSize(0.05)),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  name = true;
                                  Name =FocusNode();
                                  Name.requestFocus();
                                });
                              },
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.05),
                                    color: AllColor.themeColor),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  TextField (
                        // controller: et_gallery,
                        enabled: name,
                        focusNode: Name,
                        cursorHeight: dynamicSize(0.06),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Nazmul Hassan Sohan',hintStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)

                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Email",
                            style: TextStyle(fontSize: dynamicSize(0.05)),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  email =true;
                                  Email=FocusNode();
                                  Email.requestFocus();
                                });
                              },
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.05),
                                    color: AllColor.themeColor),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  TextField (
                        // controller: et_gallery,
                        enabled: email,
                        focusNode: Email,
                        cursorHeight: dynamicSize(0.06),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'mnhsohan@gmail.com',hintStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)

                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(fontSize: dynamicSize(0.05)),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  password = true;
                                  Password= FocusNode();
                                  Password.requestFocus();
                                });
                              },
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.05),
                                    color: AllColor.themeColor),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  TextField (
                        obscureText: true,
                        // controller: et_gallery,
                        enabled: password,
                        focusNode: Password,
                        cursorHeight: dynamicSize(0.06),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '******',hintStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)

                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mobile Number",
                            style: TextStyle(fontSize: dynamicSize(0.05)),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  mobile_number = true;
                                  Mobile_Number= FocusNode();
                                  Mobile_Number.requestFocus();
                                });
                              },
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.05),
                                    color: AllColor.themeColor),
                              )),

                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  TextField (
                        // controller: et_gallery,
                        enabled: mobile_number,
                        focusNode: Mobile_Number,
                        cursorHeight: dynamicSize(0.06),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '+8801685475384',hintStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)

                        ),
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0,bottom: 8),
                      child: Container(
                        width: dynamicSize(0.3),
                        decoration: BoxDecoration(
                          color: AllColor.shado_color,
                          borderRadius: BorderRadius.all(
                            Radius.circular(12.0),
                          ),
                        ),
                        child: Row(
mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.done,color: Colors.green,),
                            SizedBox(width: dynamicSize(0.02),),
                            Text("Verified",style: TextStyle(color: Colors.green),)
                          ],
                        ),
                      ),
                    )
                    
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Age",
                            style: TextStyle(fontSize: dynamicSize(0.05)),
                          ),
                          InkWell(
                              onTap: () {
                                setState(() {
                                  age = true;
                                  Age = FocusNode();
                                  Age.requestFocus();
                                });
                              },
                              child: Text(
                                "Add",
                                style: TextStyle(
                                    fontSize: dynamicSize(0.05),
                                    color: AllColor.themeColor),
                              ))
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  TextField (
                        // controller: et_gallery,
                        enabled: age,
                        focusNode: Age,
                        cursorHeight: dynamicSize(0.06),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: '',hintStyle: TextStyle(color:Colors.black,fontWeight: FontWeight.bold)
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
