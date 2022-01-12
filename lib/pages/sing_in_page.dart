import 'package:flutter/material.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/notifications.dart';
import 'package:takecare_user/public_variables/size_config.dart';
import 'package:takecare_user/ui/stacks.dart';
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                StackHome(),
              ],
            ),
          )),
    );
  }
}

class PageStructure extends StatelessWidget {
  const PageStructure({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
           // height: MediaQuery.of(context).size.height * 0.4,
            height: dynamicSize(0.32),
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              'assets/images/home_header.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          SizedBox(
           height: dynamicSize(0.33),
          ),
          Container(
            padding: EdgeInsets.only(right: 10),
            alignment: Alignment.bottomRight,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    child: Text(
                      "Continue as Guest",
                      style: TextStyle(fontSize: dynamicSize(0.025),color:AllColor.blue ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        "Or",
                        style: TextStyle(fontSize:dynamicSize(0.025)),
                      ),
                    )),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8.0, top: 10),
                      child: Text(
                        "Sing Up With",
                        style: TextStyle(fontSize: dynamicSize(0.025)),
                      ),
                    )),
                SizedBox(height: dynamicSize(0.01),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: dynamicSize(0.05),
                      height: dynamicSize(0.05),
                      decoration: BoxDecoration(
                        // color: const Color(0xff7c94b6),
                        image: DecorationImage(
                          image: AssetImage('assets/images/email.png'),
                          fit: BoxFit.none,
                        ),
                        borderRadius: BorderRadius.all( Radius.circular(50.0)),
                        border: Border.all(
                          color: Colors.blue,
                          width:dynamicSize(0.003),
                        ),
                      ),
                    ),
                    SizedBox(width: dynamicSize(0.01),),
                    Container(
                      width: dynamicSize(0.05),
                      height: dynamicSize(0.05),
                      decoration: BoxDecoration(
                        // color: const Color(0xff7c94b6),
                        image: DecorationImage(
                          image: AssetImage('assets/images/facebook.png'),
                          fit: BoxFit.none,
                        ),
                        borderRadius: BorderRadius.all( Radius.circular(50.0)),
                        border: Border.all(
                          color: Colors.blue,
                          width:dynamicSize(0.003),
                        ),
                      ),
                    ),

                    SizedBox(width: dynamicSize(0.01),),
                    Container(
                      width: dynamicSize(0.05),
                      height: dynamicSize(0.05),
                      decoration: BoxDecoration(
                        // color: const Color(0xff7c94b6),
                        image: DecorationImage(
                          image: AssetImage('assets/images/google.png'),
                          fit: BoxFit.none,
                        ),
                        borderRadius: BorderRadius.all( Radius.circular(50.0)),
                        border: Border.all(
                          color: Colors.blue,
                          width:dynamicSize(0.003),
                        ),
                      ),
                    ),
                    SizedBox(width: dynamicSize(0.01),),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}