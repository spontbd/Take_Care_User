import 'package:flutter/material.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:takecare_user/model/AvailableProviderResponse.dart';
import 'package:takecare_user/pages/On%20Demand/map_page.dart';
import 'package:takecare_user/public_variables/variables.dart';

import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class CancelPage extends StatelessWidget {
  final Providerdata providerInfo;

  const CancelPage( {Key? key,required this.providerInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          //backgroundColor: AllColor.themeColor,
          body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: dynamicSize(0.6),
            ),
            Row(
              // crossAxisAlignment:CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sorry!",
                  style: TextStyle(
                      color: AllColor.themeColor,
                      fontSize: dynamicSize(0.06),
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: dynamicSize(0.1),
            ),
            CircleAvatar(
              radius: 40,
              child: ClipOval(child: Image.network("${providerInfo.profilePhoto}")),
            ),
            SizedBox(
              height: dynamicSize(0.1),
            ),
            Text(
              "${providerInfo.fullName}",
              style: TextStyle(
                  fontSize: dynamicSize(0.06), color: AllColor.themeColor),
            ),
            Text(
              "is on the way to accept the service. ",
              style: TextStyle(
                  fontSize: dynamicSize(0.05), color: AllColor.themeColor),
            ),
            SizedBox(
              height: dynamicSize(0.6),
            ),
            Text(
              "Choose Another",
              style: TextStyle(
                  fontSize: dynamicSize(0.06),
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: dynamicSize(0.04),
            ),
            TextButton(
              onPressed: () async{

                 GeocodingResult resultGeo;

                resultGeo = (await Navigator.push(
                context,
                MaterialPageRoute<GeocodingResult>(
                    builder: (cx) {
                  return MapLocationPicker(

                      origin:Location(lat: Variables.currentPostion.latitude , lng :  Variables.currentPostion.longitude),
                      desiredAccuracy : LocationAccuracy.high,
                      location :  Location(lat: Variables.currentPostion.latitude , lng :  Variables.currentPostion.longitude),
                      apiKey: "AIzaSyB5x56y_2IlWhARk8ivDevq-srAkHYr9HY",
                      canPopOnNextButtonTaped: true,
                      onNext: (GeocodingResult? result) {
                        if (result != null) {

                            resultGeo = result;
                            Navigator.pop(cx,resultGeo);

                        }
                      }
                  );

                },
                ),
                ))!;
                if(resultGeo != null){
                Navigator.push(context, MaterialPageRoute(builder: (cp) => MapPage(result: resultGeo,)),);
                }
              },
              child: Text(
                "Request again",
                style:
                    TextStyle(fontSize: dynamicSize(0.05), color: Colors.blue),
              ),
            )
          ],
        ),
      )),
    );
  }
}
