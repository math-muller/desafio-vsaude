import 'package:flutter/material.dart';

void showMessage({
  required BuildContext context,
  required String message,
  bool success = false,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: success ? Colors.green : Colors.red[900],
      content: Text(message, textAlign: TextAlign.center),
    ),
  );
}
