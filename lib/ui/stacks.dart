import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takecare_user/pages/sing_in_page.dart';
import 'package:takecare_user/public_variables/size_config.dart';
import 'package:takecare_user/ui/home.dart';
import 'package:takecare_user/ui/sign_in.dart';
import 'package:takecare_user/widgets/button.dart';
import 'package:takecare_user/widgets/toggle_button.dart';
import "package:toggle_switch/toggle_switch.dart";



class StackHomeCenter extends StatelessWidget {
  const StackHomeCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            height: dynamicSize(0.28),
            width:dynamicSize(0.4),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 7,
                  spreadRadius: 5,
                  offset: Offset(0, 3), // Shadow position
                ),
              ],
            ),
          ),
          Positioned(
            child: ToggleButtonSTF(
              value:dynamicSize(0.2),
              lableValue: ["Sign in", "Sign Up"],
            ),
            top: -10,
          ),

          new Positioned(
            top: 45.0,
            left: 0.0,
            right: 0.0,
            height: MediaQuery.of(context).size.height/4.5,
            child: new Navigator(
              onGenerateRoute: (_) => new MaterialPageRoute(
                builder: (_) => SingIn(),
              ),
            ),
          ),

          Positioned(
            left: MediaQuery.of(context).size.width * .25,
            //  right:   MediaQuery.of(context).size.width *.2, bottom: -25,
            bottom: dynamicSize(-0.02),
            child: HomeButton(),
          ),

        ],
      ),
    );
  }
}

class StackHome extends StatelessWidget {
  const StackHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: [
        PageStructure(),
        Positioned(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ToggleSwitch(
              minWidth: 80,
              inactiveBgColor: Colors.grey,
              cornerRadius: 10,
              initialLabelIndex: 0,
              totalSwitches: 2,
              labels:["Bangla", "English"],
              onToggle: (index) {
                print('switched to: $index');

                if(index == 0)
                {
                  // Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(builder: (_) => MyApp()));
                }
                else if(index == 1){
                  // Navigator.of(context).pushReplacement(
                  //     MaterialPageRoute(builder: (_) => AccountInfoPage()));
                }

              },
            ),
          ),
          top: 0.0,
          right: 0.0,
        ),
        Positioned(
          child: StackHomeCenter(),
          top:dynamicSize(0.28),
        )
      ],
    );
  }
}
