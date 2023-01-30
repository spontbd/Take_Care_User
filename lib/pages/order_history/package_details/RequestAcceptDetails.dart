
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:takecare_user/api_service/ApiService.dart';
import 'package:takecare_user/controllers/DataContollers.dart';
import 'package:takecare_user/pages/provider/provider_profile_page.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';

class RequestAcceptDetailsScreen extends StatefulWidget {
  const RequestAcceptDetailsScreen({Key? key}) : super(key: key);

  @override
  State<RequestAcceptDetailsScreen> createState() => _RequestAcceptDetailsScreenState();
}

class _RequestAcceptDetailsScreenState extends State<RequestAcceptDetailsScreen> {
  bool rqbutton =false;
  List<bool> selected = [];
  var requestIndex;

  @override
  void initState()
  {
    super.initState();
    selected = DataControllers.to.getAvailableProviderList.value.data!.provider_data!.map<bool>((v) => false).toList();
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Stack(
              children: [
                Container(
                  width: dynamicSize(1.3),
                  height: dynamicSize(.7),
                  child:  Image.asset("assets/images/pet.png",fit: BoxFit.fill,
                  ),
                  ),
                Positioned(
                    child: Container(
                      margin: EdgeInsets.only(top: 33),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: dynamicSize(0.2),
                      color: AllColor.colorTransBlack,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close,color: AllColor.white,)),
                            ),
                            Text('Package Details',textAlign: TextAlign.center, style:TextStyle(fontSize: dynamicSize(.06),color: AllColor.white)),
                          ],
                        ),
                      ),))
              ],
            ),
             Expanded(
               child: Padding(
            padding: const EdgeInsets.only(left: 10.0,top: 10 ),
            child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                   children: [

                      Text('Duration',textAlign: TextAlign.start, style: TextStyle(fontSize: dynamicSize(0.06)),),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           margin: EdgeInsets.only(top: 10,left: 10),
                           padding: EdgeInsets.all(12),
                           color: AllColor.white_yeo,
                           child: Text('7 Days',style: TextStyle(color: AllColor.colorGreen,fontSize: dynamicSize(0.05)),),
                         ),
                         Container(
                           margin: EdgeInsets.only(top: 10,left: 10),
                           padding: EdgeInsets.all(12),
                           color: AllColor.shado_color,
                           child: Text('24 Hrs.',style: TextStyle(color: AllColor.black,fontSize: dynamicSize(0.05) ),),
                         ),
                          Spacer(),
                         Container(
                           margin: EdgeInsets.only(top: 5),
                           height: dynamicSize(0.12),
                           child: Card(
                             color: AllColor.blue_light,
                             margin: EdgeInsets.only(left: 0,right: 0),
                             semanticContainer: true,
                             clipBehavior: Clip.antiAliasWithSaveLayer,
                             shape: const RoundedRectangleBorder(
                               borderRadius: BorderRadius.only(
                                   bottomLeft: Radius.circular(25),
                                   topLeft: Radius.circular(25)
                               ),
                             ),
                             elevation: 6,
                             child: Padding(
                               padding: const EdgeInsets.only(left: 13.0,right: 10,top: 5,bottom: 5),
                               child: Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                     child: Icon(Icons.add,color: Colors.white,),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                     child: Text("Accept",style: TextStyle(color: Colors.white,fontSize: dynamicSize(0.05)),),
                                   )
                                 ],
                               ),
                             ),

                             /*CachedNetworkImage(
                                fit: BoxFit.fill,
                                width: 120,
                                imageUrl:
                                "https://takecare.ltd/${DataControllers.to.shortServiceResponse.value.data!.data![index].imagePath *//* == null ?   "https://cdn.vectorstock.com/i/1000x1000/21/73/old-people-in-hospital-vector-34042173.webp": DataControllers.to.shortServiceResponse.value.data![index]!.imagePath *//*}",
                                progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                CircularProgressIndicator(),
                                errorWidget: (context, url, error) => Image.asset(
                              "assets/images/image.png",
                                ),
                              ),*/
                           ),
                         ),
                       ],
                     ),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           margin: EdgeInsets.only(top: 10,left: 10),
                           padding: EdgeInsets.all(10),
                           color: AllColor.white_blue,
                           child: Column(
                             children: [

                               Text('Shift',style: TextStyle(color: AllColor.black,fontSize: dynamicSize(0.05)),),
                               Text('Day - Night',style: TextStyle(color: AllColor.blue,fontSize: dynamicSize(0.05)),),
                             ],
                           ),
                         ),

                         Spacer(),

                         Container(
                           margin: EdgeInsets.only(top: 15),

                           height: dynamicSize(0.12),
                           child: Card(
                             color: AllColor.search_field_color,
                             margin: EdgeInsets.only(left: 0,right: 0),
                             semanticContainer: true,
                             clipBehavior: Clip.antiAliasWithSaveLayer,
                             shape: const RoundedRectangleBorder(
                               borderRadius: BorderRadius.only(
                                   bottomLeft: Radius.circular(25),
                                   topLeft: Radius.circular(25)
                               ),
                             ),
                             elevation: 6,
                             child: Padding(
                               padding: const EdgeInsets.only(left: 13.0,right: 10,top: 5,bottom: 5),
                               child: Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                     child: Icon(Icons.remove,color: Colors.white,),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                     child: Text("Reject ",style: TextStyle(color: Colors.white,),),
                                   )
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 15.0,bottom: 10),
                           child: Text("Choose One...",style: TextStyle(fontSize: dynamicSize(0.06))),
                         ),
                         Container(
                           alignment: Alignment.center,
                           height: dynamicSize(rqbutton ? .7 : .7),
                           child: Padding(
                             padding: const EdgeInsets.only(bottom: 18.0),
                             child: ListView(

                               children: List.generate(
                                 DataControllers.to.getAvailableProviderList.value.data!.provider_data!.length,
                                     (index) => Container(
                                   color:  selected[index] ? AllColor.selected_color:Colors.white,
                                   child: Padding(
                                     padding: const EdgeInsets.only(top: 8.0 ,left: 8,bottom: 15,right: 8),
                                     child: InkWell(
                                       onTap: (){
                                         rqbutton =true;
                                         setState(() {
                                           selected = DataControllers.to.getAvailableProviderList.value.data!.provider_data!.map<bool>((v) => false).toList();
                                           selected[index] = !selected[index];
                                           requestIndex = index;

                                           // Get.offAll(()=>const RequestPage());
                                         });
                                       },
                                       child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children: [
                                           Row(
                                             children: [
                                               Stack(
                                                 alignment: Alignment.center,
                                                 clipBehavior: Clip.none,
                                                 children: [
                                                   Positioned(
                                                     child: ClipRRect(
                                                       borderRadius:
                                                       const BorderRadius.all(Radius.circular(30)),
                                                       child: CachedNetworkImage(
                                                         height: 60,
                                                         width: 60,
                                                         fit: BoxFit.cover,
                                                         imageUrl:
                                                         ApiService.MainURL + DataControllers.to.getAvailableProviderList.value.data!.provider_data![index].profilePhoto.toString(),
                                                         placeholder: (context, url) =>
                                                             Image.asset('assets/images/imam.png'),
                                                         errorWidget: (context, url, error) =>
                                                             Image.asset('assets/images/imam.png'),
                                                       ),
                                                     ),
                                                   ),

                                                 ],
                                               ),
                                               InkWell(
                                                 onTap: (){

                                                   Navigator.push(
                                                     context,
                                                     MaterialPageRoute(builder: (context) => ProviderProfilePage(providerdata: DataControllers.to.getAvailableProviderList.value.data!.provider_data![index])),
                                                   );
                                                   // showToast("Provider Profile");
                                                 },
                                                 child: Padding(
                                                   padding: const EdgeInsets.only(left: 10.0),
                                                   child: Column(
                                                     crossAxisAlignment: CrossAxisAlignment.start,
                                                     children: [
                                                       Text("${DataControllers.to.getAvailableProviderList.value.data!.provider_data![index].fullName}",style: TextStyle(fontSize: dynamicSize(0.05),color:AllColor.themeColor,fontWeight: FontWeight.bold),),

                                                       Padding(
                                                         padding: const EdgeInsets.all(5.0),
                                                         child: Row(children:  [
                                                           Text("${DataControllers.to.getAvailableProviderList.value.data!.provider_data![index].specialityId}"),
                                                           Text(""),
                                                         ],),
                                                       ),
                                                       Padding(
                                                         padding: const EdgeInsets.all(3.0),
                                                         child: Row(children: const [
                                                           Text("Service Cost: "),
                                                           Text(""),
                                                         ],),
                                                       ),
                                                     ],
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                           InkWell(
                                             child: Container(
                                               decoration: ShapeDecoration(
                                                   shape: CircleBorder (
                                                       side: BorderSide(
                                                           width: 2,
                                                           color: selected[index]  ? AllColor.blue_light : Colors.black38  ))),

                                               child: Container(
                                                   margin: const EdgeInsets.all( 3),
                                                   width: 15,
                                                   height: 15,
                                                   decoration: ShapeDecoration(
                                                       color:  selected[index]  ? AllColor.blue_light : Colors.white,
                                                       shape: const CircleBorder ()
                                                   )
                                               ),
                                             ),
                                           )
                                         ],
                                       ),
                                     ),
                                   ),
                                 ),
                               ),
                             ),
                           ),
                         ),
                       ],
                     ),
                     Padding(
                       padding: const EdgeInsets.only(top: 8.0),
                       child: Text('Starting from: Monday, 1st January, 2021',textAlign: TextAlign.start,),
                     ),

                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 10.0),
                       child: Text('Attendant for Hospital Visit',textAlign: TextAlign.start,style: TextStyle(fontSize: dynamicSize(0.05)),),
                     ),

                     Padding(
                       padding: const EdgeInsets.symmetric(vertical: 10.0),
                       child: Row(
                         children: [
                           Padding(
                             padding: const EdgeInsets.only(right: 8.0),
                             child: Icon(Icons.home_repair_service_rounded),
                           ),
                           Text('Service included-',textAlign: TextAlign.start,style: TextStyle(fontSize: dynamicSize(0.05)),),
                         ],
                       ),
                     ),
                     Container(
                       height: dynamicSize(.55),
                       margin: EdgeInsets.zero,
                       padding: EdgeInsets.zero,
                       child: ListView.builder(
                         scrollDirection: Axis.vertical,
                         itemCount: 10,
                           itemBuilder: (bux,index)
                           =>
                          Padding(
                           padding: const EdgeInsets.only(top: 8.0,left: 10),
                           child: Text('●  Point ${index}',textAlign: TextAlign.start,),
                         ),

                       ),
                     ),
                     Row(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 30.0,right: 10,bottom: 50),
                           child: Text('Terms & Conditions',textAlign: TextAlign.start,style: TextStyle(fontSize: dynamicSize(0.05),
                             decoration: TextDecoration.underline,
                             color: AllColor.pink_button
                           ),),
                         ),

                       ],
                     )
                   ],
                  ),
                ),
            ),
          ),
             ),


          ],
        ),
      );
  }

}
