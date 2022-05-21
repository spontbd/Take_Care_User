import 'package:flutter/material.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
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
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text(
                                            " You want to edit profile ?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: dynamicSize(0.05),
                                                color: Colors.red),
                                          ),
                                          actions: [
                                            Column(
                                              children: [
                                                SizedBox(
                                                  height: dynamicSize(0.07),
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
                                                                "Name",
                                                                style: TextStyle(fontSize: dynamicSize(0.05)),
                                                              ),

                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: TextField(
                                                              // controller: et_gallery,
                                                              enabled: name,
                                                              focusNode: Name,
                                                              cursorHeight: dynamicSize(0.06),
                                                              decoration: InputDecoration(
                                                                  border: InputBorder.none,
                                                                  hintText: DataControllers
                                                                      .to.userLoginResponse.value.data!.user!.fullName,
                                                                  hintStyle: TextStyle(
                                                                      color: Colors.black,
                                                                      fontWeight: FontWeight.bold)),
                                                            )),

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

                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: TextField(
                                                              // controller: et_gallery,
                                                              enabled: name,
                                                              focusNode: FocusNode(),
                                                              cursorHeight: dynamicSize(0.06),
                                                              decoration: InputDecoration(
                                                                  border: InputBorder.none,
                                                                  hintText: DataControllers
                                                                      .to.userLoginResponse.value.data!.user!.email,
                                                                  hintStyle: TextStyle(
                                                                      color: Colors.black,
                                                                      fontWeight: FontWeight.bold)),
                                                            )),

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

                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                            padding: const EdgeInsets.all(8.0),
                                                            child: TextField(
                                                              // controller: et_gallery,
                                                              enabled: name,
                                                              focusNode: FocusNode(),
                                                              cursorHeight: dynamicSize(0.06),
                                                              decoration: InputDecoration(
                                                                  border: InputBorder.none,
                                                                  hintText: DataControllers
                                                                      .to.userLoginResponse.value.data!.user!.phone,
                                                                  hintStyle: TextStyle(
                                                                      color: Colors.black,
                                                                      fontWeight: FontWeight.bold)),
                                                            )),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 8.0, bottom: 8),
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
                                                                Icon(
                                                                  Icons.done,
                                                                  color: Colors.green,
                                                                ),
                                                                SizedBox(
                                                                  width: dynamicSize(0.02),
                                                                ),
                                                                Text(
                                                                  "Verified",
                                                                  style: TextStyle(color: Colors.green),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                Row(
                                                  children: [
                                                    Flexible(
                                                      flex: 1,
                                                      child: SizedBox(
                                                        height:
                                                            dynamicSize(0.10),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Container(
                                                          child: RaisedButton(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10.0),
                                                              ),
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              Navigator.pop(
                                                                  context);

                                                              /* Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );*/
                                                            },
                                                            //color: AllColor.button_color,
                                                            textColor:
                                                                Colors.black,
                                                            child: Text(
                                                              "NO",
                                                              style: TextStyle(
                                                                  fontSize: 18),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      height: dynamicSize(0.1),
                                                      width: dynamicSize(0.003),
                                                      color: Colors.grey,
                                                    ),
                                                    Flexible(
                                                      flex: 1,
                                                      child: SizedBox(
                                                        height:
                                                            dynamicSize(0.10),
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Container(
                                                          child: RaisedButton(
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        10.0),
                                                              ),
                                                            ),
                                                            onPressed: () {
                                                             /* Navigator.pop(context);
                                                              setState(() => addedservice = true);
                                                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ServiceRequestFormPage()),
                                                              );*/
                                                              //showBottomSheetAddedDialog(context);
                                                            },
                                                            //color: AllColor.button_color,
                                                            textColor:
                                                                Colors.black,
                                                            child: Text(
                                                              "YES",
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .lightBlue),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      });
                                  name = true;
                                  Name = FocusNode();
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
                        child: TextField(
                          // controller: et_gallery,

                          cursorHeight: dynamicSize(0.06),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: DataControllers.to.userLoginResponse
                                  .value.data!.user!.fullName,
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
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
                      child: Text(
                        "Email",
                        style: TextStyle(fontSize: dynamicSize(0.05)),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          // controller: et_gallery,

                          cursorHeight: dynamicSize(0.06),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: DataControllers
                                  .to.userLoginResponse.value.data!.user!.email,
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
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

                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          // controller: et_gallery,

                          cursorHeight: dynamicSize(0.06),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: DataControllers
                                  .to.userLoginResponse.value.data!.user!.phone,
                              hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 8),
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
                            Icon(
                              Icons.done,
                              color: Colors.green,
                            ),
                            SizedBox(
                              width: dynamicSize(0.02),
                            ),
                            Text(
                              "Verified",
                              style: TextStyle(color: Colors.green),
                            )
                          ],
                        ),
                      ),
                    )
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
