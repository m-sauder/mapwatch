import 'package:flutter/material.dart';
import 'package:mapwatch/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  /// Text to show on button
  final String label;

  /// Event handler for when the button is pressed
  final Function() onPressed;

  CustomElevatedButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: this.onPressed,
        child: Text(
          this.label,
          style: Constants.mainFont.copyWith(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
          shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
          backgroundColor: MaterialStateProperty.all<Color>(CustomColorScheme.primaryColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
