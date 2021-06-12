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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: this.onPressed,
          child: Text(
            this.label,
            style: TextStyle(color: Colors.black),
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15)),
            shadowColor: MaterialStateProperty.all<Color>(Colors.transparent),
            backgroundColor: MaterialStateProperty.all<Color>(CustomColorScheme.primaryButton),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
