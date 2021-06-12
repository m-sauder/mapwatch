import 'package:flutter/material.dart';
import 'package:mapwatch/constants.dart';

class GuideCards extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String description;

  GuideCards({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  _GuideCardsState createState() => _GuideCardsState();
}

class _GuideCardsState extends State<GuideCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              widget.imageUrl,
              width: double.infinity,
              height: 135,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.title,
                          style: Constants.mainFont.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Text(
                      widget.description,
                      style: Constants.mainFont.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
