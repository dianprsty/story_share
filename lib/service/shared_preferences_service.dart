import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences _preferences;

  SharedPreferencesService(this._preferences);

  static const String _keyTheme = 'THEME';

  String getTheme() =>
      _preferences.getString(_keyTheme) ?? ThemeMode.light.name;

  Future<void> setTheme(String value) =>
      _preferences.setString(_keyTheme, value);
}
