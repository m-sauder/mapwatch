import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MainPageWidget extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPageWidget> {
  //UI of the Main Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(44.17, -81.64),
          zoom: 13.0,
          maxZoom: 18.3,
          minZoom: 17.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'],
            tileProvider: NonCachingNetworkTileProvider(),
          ),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: LatLng(51.5, -0.09),
                builder: (ctx) => Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
