import 'package:flutter/material.dart';

import '../public_variables/size_config.dart';

class ForgatePassPage extends StatefulWidget {
  const ForgatePassPage({Key? key}) : super(key: key);

  @override
  State<ForgatePassPage> createState() => _ForgatePassPageState();
}

class _ForgatePassPageState extends State<ForgatePassPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Container(
            height: dynamicSize(0.5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/clip_path_shape.png"),
                  //fit:BoxFit.cover
                  alignment: Alignment.topRight),
            ),
          ),
        ],
      ),
    ));
  }
}
