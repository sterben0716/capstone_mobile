import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

const LatLng currentLocation = LatLng(8.4803, 124.6498);

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: currentLocation,
          zoom: 10,
        ),
      ),
    );
  }
}
