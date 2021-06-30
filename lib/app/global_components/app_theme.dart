import 'package:flutter/material.dart';

ThemeData makeAppTheme() {
  final inputDecorationTheme = InputDecorationTheme(
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.pinkAccent.shade700),
    ),
    labelStyle: TextStyle(color: Colors.pinkAccent.shade700, fontSize: 14),
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.pinkAccent.shade100),
    ),
  );

  return ThemeData(
    inputDecorationTheme: inputDecorationTheme,
  );
}
