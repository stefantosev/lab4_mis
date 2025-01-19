import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    print('Exam location: ${widget.examLocation}');
    return Scaffold(
      appBar: AppBar(title: const Text('Exam Location')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(42.00437734905961, 21.409342165150097),
          zoom: 15.0,
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