import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/pages/home_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';

/*
class HomeButton extends StatelessWidget {
  const HomeButton({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth:MediaQuery.of(context).size.width/3,
      height: 50.0,
      child: new RaisedButton(
        elevation: 9,
        child: new Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 18),),
        color: AllColor.themeColor,
        onPressed: () async{

          if(DataControllers.to.phoneNumber.value.text.isNotEmpty  &&
              DataControllers.to.password.value.text.isNotEmpty
          )
          {

            await DataControllers.to.postLogin(DataControllers.to.phoneNumber.value.text, DataControllers.to.password.value.text);

            Fluttertoast.showToast(
                msg: DataControllers.to.userLoginResponse.value.message!,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
            if(DataControllers.to.userLoginResponse.value.success == true)
            {
             Get.offAll(HomePage());

              // Navigator.of(context).pushReplacement(
              //     MaterialPageRoute(builder: (_) => HomePage()));
            }

          }else
          {
            Fluttertoast.showToast(
                msg: "Fil up the filed!!",
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0
            );
          }


        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}
*/
