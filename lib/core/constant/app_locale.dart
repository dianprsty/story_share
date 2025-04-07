import 'package:flutter/material.dart';

class AppLocale {
  static Locale en = const Locale('en', 'US');
  static Locale id = const Locale('id', 'ID');
}

enum LocaleEnum {
  en,
  id;

  String get english => en.name;
  String get indonesia => id.name;
}
