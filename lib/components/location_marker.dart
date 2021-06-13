import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter_svg/flutter_svg.dart';

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
      child: IconButton(
        icon: SvgPicture.asset('images/map_pin.svg'),
        onPressed: widget.onPressed,
      ),
    );
  }
}
