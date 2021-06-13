import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location/flutter_map_location.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mapwatch/components/animal_card.dart';
import 'package:mapwatch/components/custom_alert_dialog.dart';
import 'package:mapwatch/components/custom_info_dialog.dart';
import 'package:mapwatch/components/custom_success_dialog.dart';
import 'package:mapwatch/components/location_marker_popup.dart';
import 'package:mapwatch/components/slider_panel.dart';
import 'package:mapwatch/components/location_marker.dart' as marker;
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mapwatch/models/coordinate.dart';
import 'package:mapwatch/providers/main_providers.dart';

class MainPageWidget extends HookWidget {
  final LatLng initialLocation = LatLng(43.9113534, -77.2743354);
  final double initialZoom = 13.0;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference coordinates = FirebaseFirestore.instance.collection("coordinates");
  final CollectionReference comments = FirebaseFirestore.instance.collection("comments");
  final MapController _mapController = MapController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _onGpsIconPressed(LatLng location) {
    this._mapController.rotate(0);
    this._mapController.move(location, initialZoom);
  }

  Future<void> addCoordinate(Coordinate coordinate) {
    return coordinates
        .add({
          "title": coordinate.title,
          "description": coordinate.description,
          "latitude": coordinate.latitude,
          "longitude": coordinate.longitude,
          "image": coordinate.image,
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
    //replace DOCUMENT_ID with the var containing the actual id when we add that
    return FirebaseFirestore.instance.collection('coordinates').doc("DOCUMENT_ID").get().then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print(documentSnapshot.data());
      }
    });
  }

  Future<void> getAllCoordinates(BuildContext context) async {
    //replace DOCUMENT_ID with the var containing the actual id when we addd that
    try {
      return await FirebaseFirestore.instance.collection('coordinates').get().then((QuerySnapshot querySnapshot) {
        List<Marker> markers = [];

        querySnapshot.docs.forEach((doc) {
          var coordinate = Coordinate.fromJson(doc.data() as Map<String, dynamic>);
          markers.add(Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(coordinate.latitude, coordinate.longitude),
            builder: (ctx) => marker.LocationMarker(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => LocationMarkerPopup(
                    locationTitle: 'Prince Edward, ON',
                    body: Row(
                      children: [
                        AnimalCard(
                          imageUrl: 'images/turtle.png',
                          title: 'Painted Turtle',
                          description: 'Slightly rare',
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ));
        });

        // Save to state
        _scaffoldKey.currentState?.context.read(markerList).state = markers;
      });
    } on Exception catch (_) {
      return null;
    }
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

  void onMapTap(LatLng tappedLocation, BuildContext context) {
    bool _isAddingNewCoordinate = context.read(isAddingNewCoordinate).state;

    if (_isAddingNewCoordinate) {
      showDialog(
        context: context,
        builder: (BuildContext context) => CustomInfoDialog(
          onCancelPressed: () {
            context.read(isAddingNewCoordinate).state = false;
            Navigator.pop(context);
          },
          onSubmitPressed: (Coordinate coordinate) async {
            coordinate.latitude = tappedLocation.latitude;
            coordinate.longitude = tappedLocation.longitude;
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (BuildContext context) => CustomSuccessDialog(
                onCancelPressed: () async {
                  context.read(isAddingNewCoordinate).state = false;
                  Navigator.pop(context);

                  await addCoordinate(coordinate);
                  await getAllCoordinates(context);
                },
              ),
            );
            context.read(isAddingNewCoordinate).state = false;
          },
        ),
      );
    }
  }

  //UI of the Main Page
  @override
  Widget build(BuildContext context) {
    bool _isAddingNewCoordinate = useProvider(isAddingNewCoordinate).state;
    List<Marker> _markerList = useProvider(markerList).state;

    // useEffect simulates initState(), which will be called only once during the lifetime of the widget
    useEffect(() {
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

      // Get coordinates
      getAllCoordinates(context);
    }, []);

    return Scaffold(
      key: _scaffoldKey,
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
                interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.pinchMove | InteractiveFlag.drag,
                plugins: [
                  LocationPlugin(),
                ],
                onTap: (location) => this.onMapTap(location, context),
              ),
              layers: [
                TileLayerOptions(
                  urlTemplate: "https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                  tileProvider: NonCachingNetworkTileProvider(),
                ),
                MarkerLayerOptions(
                  markers: _isAddingNewCoordinate ? [] : _markerList,
                ),
              ],
              nonRotatedLayers: [
                LocationOptions(
                  locationButton(),
                  onLocationUpdate: (LatLngData? ld) {
                    // print('Location updated: ${ld?.location} (accuracy: ${ld?.accuracy})');
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
