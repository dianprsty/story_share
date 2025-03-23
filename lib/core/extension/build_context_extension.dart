import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  void showSnackBar(String message, {bool success = true}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: success ? Colors.green : Colors.red,
      ),
    );
  }
}
