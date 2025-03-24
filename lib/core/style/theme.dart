import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class StoryShareTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: CustomColors.red.color,
      brightness: Brightness.light,
      textTheme: GoogleFonts.poppinsTextTheme(Typography.blackHelsinki),
      useMaterial3: true,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: CustomColors.red.color,
      brightness: Brightness.dark,
      textTheme: GoogleFonts.poppinsTextTheme(Typography.whiteHelsinki),
      useMaterial3: true,
    );
  }
}
