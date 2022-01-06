import 'package:flutter/material.dart';
import 'package:takecare_user/public_variables/notifications.dart';
import 'package:takecare_user/public_variables/size_config.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          loadingPage(),
          Center(child: Text('This is Home Page',style: TextStyle(fontSize: dynamicSize(0.1),color: Colors.black))),
        ],
      ),
    );
  }
}
