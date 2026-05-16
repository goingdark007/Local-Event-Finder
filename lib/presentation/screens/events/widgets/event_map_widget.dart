import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class EventMapWidget extends StatelessWidget{

  final double latitude;
  final double longitude;
  final String location;

  const EventMapWidget({super.key, required this.latitude, required this.longitude, required this.location});

  @override
  Widget build(BuildContext context) {

    final CameraPosition cameraPosition = CameraPosition(
        target: LatLng(latitude, longitude),
        zoom: 15
    );

    return Container(

      height: 250,

      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      clipBehavior: .antiAlias,
      child: GoogleMap(
          initialCameraPosition: cameraPosition,
          zoomControlsEnabled: true,
          markers: {
            Marker(
              markerId: MarkerId(location),
              visible: true,
              position: LatLng(latitude, longitude),
              infoWindow: InfoWindow(title: location)
            )
          }
      ),
    );

  }
}