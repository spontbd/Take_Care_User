import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takecare_user/model/provider/provider_data.dart';
import 'package:takecare_user/pages/On%20Demand/order_information_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';
import 'package:takecare_user/public_variables/variables.dart';


class AcceptedPage extends StatefulWidget {

  const AcceptedPage({Key? key, required this.reqDocId,required this.receiverId,this.requestList,this.providerData}) : super(key: key);
  final String reqDocId;
  final String receiverId;
  final DocumentSnapshot? requestList;
  final ProviderData? providerData;

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
        Get.offAll(()=>OrderInformationPage(providerData : widget.providerData,reqDocId: widget.reqDocId ?? '',receiverId: widget.receiverId ?? '',activity: Variables.onDemandServiceActivity,serviceAddress: widget.requestList!.get("booking_address"),)));
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
                  child: ClipOval(child:
                  Image.asset("assets/images/imam.png"),
                  ),
                ),
                SizedBox(
                  height: dynamicSize(0.1),
                ),
                Text("${ widget.requestList == null ? widget.providerData!.fullName ?? '' : widget.requestList!.get('receiver_name')}",style: TextStyle(
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
