import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    primaryColor: Colors.blue,
    hintColor: Colors.blueAccent,
    textTheme: const TextTheme(
      displayLarge: TextStyle(
          color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
  );



}
