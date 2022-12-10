import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';

showToast(String mgs, [Color? color]) => Fluttertoast.showToast(
    msg: mgs,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: color ?? Colors.black87,
    textColor: Colors.white,
    fontSize: 16.0);
snackBar(BuildContext context,String msg)
{
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

}

Center loadingWidget({double? loadingSize})=>Center(
  child: SpinKitSpinningLines(color: AllColor.themeColor, size: dynamicSize(loadingSize??0.12)),
);


Widget loadingPage({double? loadingSize})=>Container(
  height: MediaQuery.of(Get.context!).size.height,
  width: MediaQuery.of(Get.context!).size.width,
  color: Colors.black.withOpacity(0.25),
  child: Center(
    child: SpinKitSpinningLines(color: AllColor.themeColor, size: dynamicSize(loadingSize??0.12)),
  ),
);
