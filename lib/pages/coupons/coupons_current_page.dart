
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';

class CouponsCurrentPage extends StatefulWidget {
  const CouponsCurrentPage({Key? key}) : super(key: key);

  @override
  State<CouponsCurrentPage> createState() => _CouponsCurrentPageState();
}



class _CouponsCurrentPageState extends State<CouponsCurrentPage> {

  void BottomSheetDialog(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bcs) {
          return Container(
              decoration: BoxDecoration(
              color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
            height: dynamicSize(0.8),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 35,
                        ))),
                Container(
                  color: AllColor.white,
                  padding: EdgeInsets.all(10),
                  height: dynamicSize(0.55),
                  child: Column(children: [
                    Text('T&C',style: TextStyle(fontWeight: FontWeight.bold,fontSize: dynamicSize(0.06)),),
                   SizedBox(height: dynamicSize(0.04),),
                    
                    Expanded(
                      child: Text('Material Symbols are our newest icons consolidating over 2,500 glyphs in a single font file with a wide range of design variants. Symbols are available in three styles and four adjustable variable font styles (fill, weight, grade, and optical size).',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: dynamicSize(0.04)),),
                    ),

                  ],)
                  ,
                ),
              ],
            ),
          );
        });
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColor.shado_color,
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: (){
            BottomSheetDialog(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children:
                  [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Enjoy, it\'s on us'),
                          Text('TK 200',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0,top: 8),
                        child: Text('city40'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0,top: 8),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            RichText(text:
                            TextSpan(   text: 'Avail ',
                              style: TextStyle(color: Colors.black87,),

                children: <TextSpan>[
                  TextSpan(text: 'Tk 500 ',
                    style: TextStyle(color: AllColor.black, fontWeight: FontWeight.bold
                    ),
                  ),
                  TextSpan(text: 'minimum price',
                    style: TextStyle(color: Colors.black87,),
                  ),
                ],
                            ),

                            ),

                            RichText(text:
                            TextSpan(   text: 'Valid Until ',
                              style: TextStyle(color: Colors.black87,),

                children: <TextSpan>[
                  TextSpan(text: '07 Sept 2021',
                    style: TextStyle(color: AllColor.black, fontWeight: FontWeight.bold
                    ),
                  ),
                ],
                            ),

                            ),
                          // Text('Avail Tk 500 minimum price'),
                        ],
                    ),
                      ),
                    DottedBorder( color: Colors.grey,
                      strokeWidth: 0.5,
                      dashPattern: [4, 4],
                        child: SizedBox (width: dynamicSize(1.3),)
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('On demand service'),
                          Text('T&C',style: TextStyle(color: Colors.pinkAccent),),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },),
    );
  }
}
