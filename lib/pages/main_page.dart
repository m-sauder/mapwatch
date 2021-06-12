import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainPageWidget extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPageWidget> {
  //UI of the Main Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        backdropEnabled: true,
        maxHeight: MediaQuery.of(context).size.height - 80,
        minHeight: 30,
        margin: EdgeInsets.symmetric(horizontal: 10),
        panel: Center(
          child: Text('hey asshole'),
        ),
        body: new FlutterMap(
          options: new MapOptions(
            center: new LatLng(44.17, -81.64),
            zoom: 13.0,
          ),
          layers: [
            new TileLayerOptions(urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", subdomains: ['a', 'b', 'c']),
            new MarkerLayerOptions(
              markers: [
                new Marker(
                  width: 80.0,
                  height: 80.0,
                  point: new LatLng(51.5, -0.09),
                  builder: (ctx) => new Container(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
