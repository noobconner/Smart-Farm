import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  @override
  _MyMapState createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  //method
  static const LatLng ssruLatLng = const LatLng(
    13.7762957,
    100.5083987,
  );
  CameraPosition cameraPossition = CameraPosition(
    target: ssruLatLng,
    zoom: 16.0,
  );

  //method
  Widget showMap() {
    return GoogleMap(
      mapType: MapType.normal,
      initialCameraPosition: cameraPossition,
      onMapCreated: (GoogleMapController googleMapController) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return showMap();
  }
}
