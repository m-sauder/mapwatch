import 'package:flutter/material.dart';
import 'package:mapwatch/constants.dart';

class LocationMarkerPopup extends StatefulWidget {
  final String locationTitle;
  final Widget body;

  LocationMarkerPopup({
    required this.locationTitle,
    required this.body,
  });

  @override
  _LocationMarkerPopupState createState() => _LocationMarkerPopupState();
}

class _LocationMarkerPopupState extends State<LocationMarkerPopup> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 200),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInExpo,
  );

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  void dispose() {
    this._controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        titlePadding: EdgeInsets.only(top: 20, left: 23, right: 30, bottom: 0),
        title: Text(
          widget.locationTitle,
          textAlign: TextAlign.left,
          style: Constants.mainFont.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        content: Container(
          width: 400,
          height: 160,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Animals found here:',
                textAlign: TextAlign.left,
                style: Constants.mainFont.copyWith(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 10),
              widget.body
            ],
          ),
        ),
      ),
    );
  }
}
