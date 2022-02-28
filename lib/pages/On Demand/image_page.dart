import 'package:flutter/material.dart';
import 'package:takecare_user/public_variables/size_config.dart';

import 'caregiver_profile_page.dart';

class ImageViewPage extends StatelessWidget {
  const ImageViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // backgroundColor: Colors.white,
        title: Text("Caregiver Profile"),
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => CaregiverProfile()));
          },
          child: Image.asset("assets/images/cross.png"),
        ),
        elevation: 0,
      ),
      body: Container(
        child: Image.asset(
          "assets/images/baby.png",
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
          alignment: Alignment.center,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          color: Colors.black,
          height: dynamicSize(0.2),
        ),
      ),
    );
  }
}
