import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/strings.dart';

class ThemeService {
  final SharedPreferences _preferences;

  ThemeService(this._preferences);

  bool _checkDarkMode() => _preferences.getBool(themeKey) ?? false;


  ThemeMode getTheme() =>
      _checkDarkMode() ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
      _preferences.setBool(themeKey, !_checkDarkMode());

  }
}
