/*
PDF().cachedFromUrl(
'http://africau.edu/images/default/sample.pdf',
placeholder: (progress) => Center(child: Text('$progress %')),
errorWidget: (error) => Center(child: Text(error.toString())),
)*/



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:takecare_user/public_variables/all_colors.dart';

class PDFReaderPage extends StatelessWidget {
  PDFReaderPage( this.url, {Key? key}) : super(key: key);

  String url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Container(
          child: PDF().cachedFromUrl(
            url,
            maxAgeCacheObject:Duration(days: 30),
            placeholder: (progress) => Center(child: Text('$progress %')),
            errorWidget: (error) => Center(child: Text(error.toString())),
          ),
        )
    );
  }
}