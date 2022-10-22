import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takecare_user/pages/On%20Demand/order_information_page.dart';
import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class AcceptedPage extends StatefulWidget {
  const AcceptedPage({Key? key, required this.reqDocId,required this.receiverId}) : super(key: key);
  final String reqDocId;
  final String receiverId;

  @override
  _AcceptedPageState createState() => _AcceptedPageState();
}

class _AcceptedPageState extends State<AcceptedPage> {
  @override
  void initState() {
    super.initState();
    _navigateToNavPage();
  }

  Future<void> _navigateToNavPage() async {
    Future.delayed(const Duration(seconds: 5)).then((value) =>
        Get.offAll(()=>OrderInformationPage(reqDocId: widget.reqDocId,receiverId: widget.receiverId)));
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AllColor.themeColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: dynamicSize(0.2),
                ),
                Row(
                  // crossAxisAlignment:CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Image.asset("assets/images/success.png",),
                  ],
                ),
                SizedBox(
                  height: dynamicSize(0.2),
                ),
                CircleAvatar(
                  radius: 40,
                  child: ClipOval(child: Image.asset("assets/images/imam.png")),
                ),
                SizedBox(
                  height: dynamicSize(0.1),
                ),
                Text("Leya Ajanta Mondol",style: TextStyle(
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.w600,
                    fontSize: dynamicSize(0.06),color: Colors.white),),
                Text("is on the way to accept the service. ",style: TextStyle(
                    fontFamily: 'Muli',
                    fontWeight: FontWeight.w600,
                    fontSize: dynamicSize(0.05),color: Colors.white),),
              
              ],
            ),
          )),
    );
  }
}
