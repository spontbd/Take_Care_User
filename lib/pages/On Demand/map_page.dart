import 'dart:async';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../public_variables/all_colors.dart';
import '../../public_variables/size_config.dart';

class MapePage extends StatefulWidget {
  const MapePage({Key? key}) : super(key: key);

  @override
  _MapePageState createState() => _MapePageState();
}

class _MapePageState extends State<MapePage> {
  Completer<GoogleMapController> _controller = Completer();
  bool _arrived = false;
  bool _startService = false;
  bool _finished = false;

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),() {
      setState(() {
        _arrived = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: _kLake,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    ),);
  }
}
