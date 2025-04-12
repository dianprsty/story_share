import 'package:flutter/material.dart';

enum FlavorType { free, pro }

class FlavorValues {
  final String titleApp;

  const FlavorValues({this.titleApp = 'Story Share'});
}

class FlavorConfig {
  final FlavorType flavor;
  final FlavorValues values;
  final Color color;

  static FlavorConfig? _instance;

  FlavorConfig({
    this.flavor = FlavorType.free,
    this.values = const FlavorValues(),
    this.color = Colors.green,
  }) {
    _instance = this;
  }

  static FlavorConfig get instance => _instance ?? FlavorConfig();
}
