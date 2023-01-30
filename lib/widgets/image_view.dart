import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:takecare_user/public_variables/all_colors.dart';
import 'package:takecare_user/public_variables/size_config.dart';

class ImageView extends StatelessWidget {
  String url;
  String name;
  ImageView({Key? key,required this.url,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: AllColor.transBack,
        body: Stack(
          children: [

            Container(
              alignment: Alignment.center,
              child: CachedNetworkImage(

                fit: BoxFit.fill,
                imageUrl: url,
                errorWidget: (context, url, error) =>
                    Image.asset(
                      'assets/images/gallery_image.jpeg',
                      fit: BoxFit.fill,
                    ),
              ),
            ),
            Container(
              width: dynamicSize(1.2),
              color: AllColor.transBack,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.clear,color: Colors.white,)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(name,style: TextStyle(color: Colors.white,fontSize: dynamicSize(0.06),  fontFamily: 'Muli',),textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
