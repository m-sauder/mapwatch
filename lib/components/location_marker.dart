import 'package:flutter/material.dart';

class LocationMarker extends StatefulWidget {
  final void Function() onPressed;

  LocationMarker({
    required this.onPressed,
  });

  @override
  _LocationMarkerState createState() => _LocationMarkerState();
}

class _LocationMarkerState extends State<LocationMarker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      child: FloatingActionButton(
        child: Icon(Icons.pets),
        onPressed: widget.onPressed,
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
