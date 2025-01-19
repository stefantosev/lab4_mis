import 'package:google_maps_flutter/google_maps_flutter.dart';

class Exam {
  final String subject;
  final DateTime dateTime;
  final LatLng location;

  Exam({required this.subject, required this.dateTime, required this.location});
}