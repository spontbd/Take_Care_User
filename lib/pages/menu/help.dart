
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:takecare_user/controllers/language_controller.dart';
import 'package:takecare_user/pages/home_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/notifications.dart';
import 'package:takecare_user/public_variables/size_config.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);





  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AllColor.shado_color,
        appBar: AppBar(
          leading: InkWell(
            child: Icon(
              Icons.arrow_back,
              color: Colors.pinkAccent,
            ),
            onTap: () {
              ///Navigator.pop(context);
              Navigator.of(context)
                  .pushReplacement(
                  MaterialPageRoute(
                      builder: (_) =>
                          HomePage()));
            },
          ),

          title: Text(
            LanguageController.lc.helpCenter.value,
            style: TextStyle(color: Colors.black, fontSize: dynamicSize(0.05)),
          ),

          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10,top: 15 ),
              child: Card(
                elevation: 4,
                shadowColor: Colors.blue,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(

                      padding: const EdgeInsets.only(top: 10.0,left: 10),
                      child: Text("How we Can help you?",style: TextStyle(color: Colors.pinkAccent,fontSize: dynamicSize(0.05)), ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20,
                          left: 10.0, right: 5),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: dynamicSize(0.13),
                            color: Colors.white,
                            child: DottedBorder(
                              color: Colors.grey,
                              strokeWidth: 0.5,
                              dashPattern: [2, 2],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "FaQ",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.04),
                                          fontWeight: FontWeight.bold),
                                    ),

                                    Icon(Icons.arrow_forward,color: Colors.pinkAccent,)
                                    //ChkBox(checkValue: _value)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                  /*  Padding(
                      padding: const EdgeInsets.only(
                          top: 10,
                          left: 10.0, right: 5),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: dynamicSize(0.13),
                            color: Colors.white,
                            child: DottedBorder(
                              color: Colors.grey,
                              strokeWidth: 0.5,
                              dashPattern: [2, 2],
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Chat with representative",
                                      style: TextStyle(
                                          fontSize: dynamicSize(0.04),
                                          fontWeight: FontWeight.bold),
                                    ),

                                    Icon(Icons.arrow_forward,color: Colors.red,)
                                    //ChkBox(checkValue: _value)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),*/


                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10,
                          left: 10.0, right: 5),
                      child: InkWell(
                        onTap: () async{



                          if (await canLaunchUrl(Uri.parse("https://wa.me/qr/QONSU4VOF5MYI1"))) {
                            // showToast('launch');
                          await launchUrl(Uri.parse("https://wa.me/qr/QONSU4VOF5MYI1",));
                          } else {
                            showToast(' Could not launch');
                          throw 'Could not launch';
                          }

                        },
                        child: Column(
                         children: [
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: dynamicSize(0.13),
                              color: Colors.white,
                              child: DottedBorder(
                                color: Colors.grey,
                                strokeWidth: 0.5,
                                dashPattern: [2, 2],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Whatsapp",
                                        style: TextStyle(
                                            fontSize: dynamicSize(0.04),
                                            fontWeight: FontWeight.bold),
                                      ),

                                      Icon(Icons.arrow_forward,color: Colors.pinkAccent,)
                                      //ChkBox(checkValue: _value)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),



                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10,
                          left: 10.0, right: 5, bottom: 10),
                      child: InkWell(

                        onTap: ()async{
                          // showToast( 'Click');
                          // _launchUrl();
                          if (await canLaunchUrl(Uri.parse("https://www.messenger.com/t/101542532314132/?messaging_source=source%3Apages%3Amessage_shortlink&source_id=1441792&recurring_notification=0"))) {
                          await launchUrl(Uri.parse("https://www.messenger.com/t/101542532314132/?messaging_source=source%3Apages%3Amessage_shortlink&source_id=1441792&recurring_notification=0"));
                          } else {
                          showToast( 'Could not launch');
                          }
                        },

                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: dynamicSize(0.13),
                              color: Colors.white,
                              child: DottedBorder(
                                color: Colors.grey,
                                strokeWidth: 0.5,
                                dashPattern: [2, 2],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Facebook",
                                        style: TextStyle(
                                            fontSize: dynamicSize(0.04),
                                            fontWeight: FontWeight.bold),
                                      ),

                                      Icon(Icons.arrow_forward,color: Colors.pinkAccent,)
                                      //ChkBox(checkValue: _value)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10,
                          left: 10.0, right: 5, bottom: 20),
                      child: InkWell(

                        onTap: ()async{
                          // showToast( 'Click');
                          // _launchUrl();
                          if (await canLaunchUrl(Uri.parse("https://www.youtube.com/channel/UCBwjLdE1i7L8EJYiu-ms_fA"))) {
                          await launchUrl(Uri.parse("https://www.youtube.com/channel/UCBwjLdE1i7L8EJYiu-ms_fA"));
                          } else {
                          showToast( 'Could not launch');
                          }
                        },

                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: dynamicSize(0.13),
                              color: Colors.white,
                              child: DottedBorder(
                                color: Colors.grey,
                                strokeWidth: 0.5,
                                dashPattern: [2, 2],
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "YouTube",
                                        style: TextStyle(
                                            fontSize: dynamicSize(0.04),
                                            fontWeight: FontWeight.bold),
                                      ),

                                      Icon(Icons.arrow_forward,color: Colors.pinkAccent,)
                                      //ChkBox(checkValue: _value)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse('https://pub.dev/packages/url_launcher'))) {
      throw 'Could not launch ';
    }
  }
}