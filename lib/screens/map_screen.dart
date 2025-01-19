import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapScreen extends StatefulWidget {
  final LatLng examLocation;

  const MapScreen({Key? key, required this.examLocation}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exam Location')),
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
          mapController.animateCamera(
            CameraUpdate.newLatLngZoom(widget.examLocation, 15),
          );
        },
        initialCameraPosition: CameraPosition(
          target: widget.examLocation,
          zoom: 11.0,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("exam_location"),
            position: widget.examLocation,
            infoWindow: const InfoWindow(title: "Exam Location"),
          ),
        },
      ),
    );
  }
}