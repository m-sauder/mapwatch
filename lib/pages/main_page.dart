import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location/flutter_map_location.dart';
import 'package:mapwatch/components/custom_alert_dialog.dart';
import 'package:mapwatch/components/slider_panel.dart';
import 'package:mapwatch/mocks/markers_mock.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MainPageWidget extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MainPageWidget> {
  final LatLng initialLocation = LatLng(44.17, -81.64);
  final double initialZoom = 13.0;
  late final MapController _mapController;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference coordinates = FirebaseFirestore.instance.collection("coordinates");
  CollectionReference comments = FirebaseFirestore.instance.collection("comments");

  @override
  void initState() {
    super.initState();
    _mapController = MapController();

    // Load the onboarding dialog on startup
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomAlertDialog(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      );
    });
  }

  void _onGpsIconPressed(LatLng location) {
    this._mapController.rotate(0);
    this._mapController.move(location, initialZoom);
  }

  Future<void> addCoordinate() {
    return coordinates
        .add({
          'id': "id",
          "title": "title",
          "description": "description",
          "latitude": 34.0,
          "longitude": 12.0,
          "image": 7,
        })
        .then((value) => print("Coordinate Added"))
        .catchError((error) => print("Failed to add coordinate: $error"));
  }

  Future<void> addComment() {
    return comments
        .add({
          'coordinateId': "coordinateId",
          "commentId": "commentId",
          "comment": "comment",
          "datePosted": DateTime.june,
        })
        .then((value) => print("Comment Added"))
        .catchError((error) => print("Failed to add Comment: $error"));
  }

  Future<void> getCoordinate() async {
    print(await readCoordinate());
  }

  Future<DocumentSnapshot<Object?>> readCoordinate() {
    //replace DOCUMENT_ID with the var containing the actual id when we add that
    return FirebaseFirestore.instance.collection('coordinates').doc("DOCUMENT_ID").get().then((DocumentSnapshot documentSnapshot) {
      //print(documentSnapshot.data());
      if (documentSnapshot.exists) {
        print(documentSnapshot.data());
        return documentSnapshot;
      }
      return documentSnapshot;
    });
  }

  // Location button on the top-right
  LocationButtonBuilder locationButton() {
    return (BuildContext context, ValueNotifier<LocationServiceStatus> status, Function onPressed) {
      return Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: EdgeInsets.only(top: 40, right: 10),
          child: Container(
            height: 120,
            width: 51,
            // color: Colors.red,
            decoration: BoxDecoration(shape: BoxShape.rectangle, color: Colors.white, borderRadius: BorderRadius.circular(15), boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(3, 3), // changes position of shadow
              ),
            ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {},
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Divider(
                    thickness: 2,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.near_me),
                  onPressed: () => onPressed(),
                ),
              ],
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
      body: SliderPanel(
        body: Stack(
          children: [
            FlutterMap(
              mapController: this._mapController,
              options: MapOptions(
                center: this.initialLocation,
                zoom: this.initialZoom,
                maxZoom: 18.3,
                minZoom: 17.0,
                plugins: [
                  LocationPlugin(),
                ],
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate: "https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                  tileProvider: NonCachingNetworkTileProvider(),
                ),
                MarkerLayerOptions(
                  markers: getMockMarkers(this.initialLocation),
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
