import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../core/config/flavor_config.dart';

import 'colors.dart';

class StoryShareTheme {
  static ThemeData lightTheme({Color? color = Colors.cyanAccent}) {
    return ThemeData(
      colorSchemeSeed: color,
      brightness: Brightness.light,
      textTheme: GoogleFonts.poppinsTextTheme(Typography.blackHelsinki),
      useMaterial3: true,
    );
  }

  static ThemeData darkTheme({FlavorType? flavor = FlavorType.free}) {
    return ThemeData(
      colorSchemeSeed:
          flavor == FlavorType.free
              ? CustomColors.tosca.color
              : CustomColors.purple.color,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.poppinsTextTheme(Typography.whiteHelsinki),
      useMaterial3: true,
    );
  }
}
