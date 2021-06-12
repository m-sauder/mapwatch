import 'package:flutter/material.dart';
import 'package:mapwatch/constants.dart';

class CustomSquareButton extends StatelessWidget {
  /// Text to show on button
  final String label;

  /// Event handler for when the button is pressed
  final Function() onPressed;

  CustomSquareButton({
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 90,
        child: ElevatedButton(
          onPressed: this.onPressed,
          child: Text(
            this.label,
            style: TextStyle(color: Colors.white),
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
      ),
    );
  }
}
