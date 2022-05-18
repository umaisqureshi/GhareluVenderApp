import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Maps extends StatefulWidget {
  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  var latitude = 31.5204;
  var longitude = 74.3587;

  double distanceInMeters;

  Completer<GoogleMapController> controller = Completer();

  GoogleMapController _controller;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(
        //   elevation: 0,
        //   centerTitle: true,
        //   backgroundColor: Colors.blueAccent,
        //   leading: IconButton(
        //     icon: Icon(Icons.arrow_back_ios),
        //     color: Colors.white,
        //     iconSize: 19,
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        //   title: Text(
        //     "MAP",
        //     style: GoogleFonts.quicksand(
        //       color: Colors.white,
        //       fontSize: 15,
        //     ),
        //   ),
        // ),
        body: Stack(
          children: [
            GoogleMap(
              myLocationEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: LatLng(latitude, longitude),
                zoom: 13.4746,
              ),
              onMapCreated: (GoogleMapController controllers) {
                controller.complete(controllers);
              },
              onTap: (coordinate) {
                _controller.animateCamera(CameraUpdate.newLatLng(
                    LatLng(coordinate.latitude, coordinate.longitude)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
