import 'package:flutter/material.dart';

enum CustomColors {
  tosca('tosca', Colors.cyanAccent),
  purple('purple', Colors.purple);

  const CustomColors(this.name, this.color);

  final String name;
  final Color color;
}
