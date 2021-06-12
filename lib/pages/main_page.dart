import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutterinit/mocks/markers_mock.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainPageWidget extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPageWidget> {
  final LatLng initialLocation = LatLng(44.17, -81.64);
  late final MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  void _onGpsIconPressed() {
    this._mapController.rotate(0);
  }

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
        minHeight: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        panel: Center(
          child: Text('hey asshole'),
        ),
        body: Stack(
          children: [
            FlutterMap(
              mapController: this._mapController,
              options: MapOptions(
                center: this.initialLocation,
                zoom: 13.0,
                maxZoom: 18.3,
                minZoom: 13.0,
              ),
              layers: [
                TileLayerOptions(urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", subdomains: ['a', 'b', 'c']),
                MarkerLayerOptions(
                  markers: getMockMarkers(this.initialLocation),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: EdgeInsets.only(top: 40, right: 10),
                child: Container(
                  width: 25,
                  height: 25,
                  child: FloatingActionButton(
                    child: Icon(
                      Icons.gps_fixed,
                      size: 18,
                    ),
                    onPressed: this._onGpsIconPressed,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
