import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location/flutter_map_location.dart';
import 'package:mapwatch/mocks/markers_mock.dart';
import 'package:latlong2/latlong.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class MainPageWidget extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPageWidget> {
  final LatLng initialLocation = LatLng(44.17, -81.64);
  final double initialZoom = 13.0;
  late final MapController _mapController;

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
  }

  void _onGpsIconPressed(LatLng location) {
    this._mapController.rotate(0);
    this._mapController.move(location, initialZoom);
  }

  // Location button on the top-right
  LocationButtonBuilder locationButton() {
    return (BuildContext context, ValueNotifier<LocationServiceStatus> status, Function onPressed) {
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(top: 40, right: 10),
          child: Container(
            width: 25,
            height: 25,
            child: FloatingActionButton(
              child: ValueListenableBuilder<LocationServiceStatus>(
                valueListenable: status,
                builder: (BuildContext context, LocationServiceStatus value, Widget? child) {
                  switch (value) {
                    case LocationServiceStatus.disabled:
                    case LocationServiceStatus.permissionDenied:
                    case LocationServiceStatus.unsubscribed:
                      return const Icon(
                        Icons.location_disabled,
                        color: Colors.white,
                        size: 18,
                      );
                    default:
                      return const Icon(
                        Icons.location_searching,
                        color: Colors.white,
                        size: 18,
                      );
                  }
                },
              ),
              // Execute the default onPressed(), which triggers onLocationRequested()
              onPressed: () => onPressed(),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
      );
    };
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
<<<<<<< HEAD
                center: LatLng(43.91135, -77.27232),
                zoom: 17.0,
                maxZoom: 18.3,
                minZoom: 17.0,
=======
                center: this.initialLocation,
                zoom: this.initialZoom,
                maxZoom: 18.3,
                minZoom: 17.0,
                plugins: [
                  LocationPlugin(),
                ],
>>>>>>> 789706c7181d79c8ebf01cd2333221ac726712c5
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate: "https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                  tileProvider: NonCachingNetworkTileProvider(),
<<<<<<< HEAD
=======
                ),
                MarkerLayerOptions(
                  markers: getMockMarkers(this.initialLocation),
>>>>>>> 789706c7181d79c8ebf01cd2333221ac726712c5
                ),
              ],
              nonRotatedLayers: [
                LocationOptions(
                  locationButton(),
                  onLocationUpdate: (LatLngData? ld) {
                    print('Location updated: ${ld?.location} (accuracy: ${ld?.accuracy})');
                  },
                  onLocationRequested: (LatLngData? ld) {
                    if (ld == null) {
                      return;
                    }

                    this._onGpsIconPressed(ld.location);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
