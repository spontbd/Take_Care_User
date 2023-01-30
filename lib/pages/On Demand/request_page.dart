import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:takecare_user/controller/data_controller.dart';
import 'package:takecare_user/model/provider/provider_data.dart';
import 'package:takecare_user/pages/On%20Demand/accepted_page.dart';
import 'package:takecare_user/pages/On%20Demand/cancel_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/notifications.dart';
import 'package:takecare_user/public_variables/size_config.dart';
import 'package:takecare_user/public_variables/variables.dart';


class RequestPage extends StatefulWidget {
  const RequestPage({Key? key, required this.docId, required this.requestIndex,required this.receiverId,
  required this.providerInfo,  this.geocodingResult
  }) : super(key: key);

  final int requestIndex;
  final String docId;
  final String receiverId;
  final ProviderData providerInfo;
  final GeocodingResult? geocodingResult;

  @override
  _RequestPageState createState() => _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  @override
  void initState() {
    super.initState();
    DataController.dc.autoCancelRequest(widget.docId, widget.receiverId);
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance.collection("request").doc(widget.docId).snapshots(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          else if(snapshot.hasData){
            if(snapshot.data!.get('status')==Variables.orderStatusData[1].statusCode){
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Get.to(()=>AcceptedPage(reqDocId: widget.docId,receiverId: widget.receiverId,providerData: widget.providerInfo,requestList: snapshot.data));
              });
            }
            else if(snapshot.data!.get('status')==Variables.orderStatusData[2].statusCode){
              SchedulerBinding.instance.addPostFrameCallback((_) {
                showToast('Request Denied');
                Get.back();
              });
            }
            return SafeArea(
              child: Scaffold(
                  backgroundColor: AllColor.blue_light,
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            // crossAxisAlignment:CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  requestForCancel();
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(
                                      fontFamily: 'Muli',
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white, fontSize: dynamicSize(0.05)),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: dynamicSize(0.2),
                          ),
                          CircleAvatar(
                            radius: 40,
                            child:
                            ClipOval(child: Image.network("${widget.providerInfo.profilePhoto}")),
                          ),
                          SizedBox(
                            height: dynamicSize(0.1),
                          ),
                          Text(
                            "${widget.providerInfo.fullName}",
                            style: TextStyle(
                                fontFamily: 'Muli',
                                fontWeight: FontWeight.w600,
                                fontSize: dynamicSize(0.06), color: Colors.white),
                          ),
                          Text(
                            "is on the way to accept the service. ",
                            style: TextStyle(
                                fontFamily: 'Muli',
                                fontWeight: FontWeight.w600,
                                fontSize: dynamicSize(0.05), color: Colors.white),
                          ),
                          SizedBox(
                            height: dynamicSize(0.5),
                          ),
                          Text(
                            "Please wait",
                            style: TextStyle(
                                fontFamily: 'Muli',
                                fontWeight: FontWeight.w600,
                                fontSize: dynamicSize(0.05), color: Colors.white),
                          ),
                          Center(
                            child: LoadingAnimationWidget.prograssiveDots(
                              color: Colors.white,
                              size: 70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            );
          }
          else{
            return const Center(child: Text('Error getting Data'));
          }
        }
    );
  }


  void requestForCancel() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) =>  CancelPage(providerInfo: widget.providerInfo,)));
  }
}