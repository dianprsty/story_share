import 'package:flutter/material.dart';

enum CustomColors {
  red('Red', Colors.cyanAccent);

  const CustomColors(this.name, this.color);

  final String name;
  final Color color;
}
