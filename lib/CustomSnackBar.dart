import 'package:flutter/material.dart';

class CustomSnackBar {
  static SnackBar showSnackBar(String message, Color color) {
    return SnackBar(
      content: Text(
        message,
        style: TextStyle(fontSize: 18),
      ),
      backgroundColor: color,
    );
  }
}
