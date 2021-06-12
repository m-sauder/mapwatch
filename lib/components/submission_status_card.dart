import 'package:flutter/material.dart';
import 'package:mapwatch/constants.dart';

class SubmissionStatusCard extends StatefulWidget {
  final String title;
  final String date;
  final Color statusColor;
  final String status;

  SubmissionStatusCard({
    required this.title,
    required this.date,
    required this.statusColor,
    required this.status,
  });

  @override
  _SubmissionStatusCardState createState() => _SubmissionStatusCardState();
}

class _SubmissionStatusCardState extends State<SubmissionStatusCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 72,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${widget.title} · ${widget.date}',
              style: Constants.mainFont.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(
                  Icons.circle,
                  color: widget.statusColor.withAlpha(120),
                  size: 10,
                ),
                SizedBox(width: 5),
                Text(
                  widget.status,
                  style: Constants.mainFont.copyWith(
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: Colors.black.withAlpha(120),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
