// Utility functions used throughout the project

import 'package:flutter/cupertino.dart';

/// Hides the keyboard
void unfocus(BuildContext context) {
  FocusScope.of(context).unfocus();
}
