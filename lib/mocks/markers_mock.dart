import 'dart:math';
import 'package:flutterinit/components/location_marker.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

List<Marker> getMockMarkers(LatLng initialPoint) {
  int count = 20;
  List<Marker> mockMarkers = [];

  for (int i = 0; i < count; i++) {
    var rng = new Random();
    LatLng randomPoint = LatLng(initialPoint.latitude + 0.001 * rng.nextInt(10), initialPoint.longitude + 0.001 * rng.nextInt(10));

    mockMarkers.add(Marker(
      width: 80.0,
      height: 80.0,
      point: randomPoint,
      builder: (ctx) => LocationMarker(
        onPressed: () {},
      ),
    ));
  }

  return mockMarkers;
}
