import 'package:flutter/material.dart';
import 'package:mapwatch/constants.dart';

class FavouriteCard extends StatefulWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;

  FavouriteCard({
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  _FavouriteCardState createState() => _FavouriteCardState();
}

class _FavouriteCardState extends State<FavouriteCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            widget.icon,
            size: 50,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        Text(
          widget.title,
          style: Constants.mainFont.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        Text(
          widget.subtitle,
          style: Constants.mainFont.copyWith(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
