import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/strings.dart';

abstract interface class LocalizationLocalDataSource {
  Future<String> getLanguage();
  Future<String> changeLanguage(String language);
}

class LocalizationLocalDataSourceImpl implements LocalizationLocalDataSource {
  final SharedPreferences _sharedPreferences;

  LocalizationLocalDataSourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<String> getLanguage() async {
    return _sharedPreferences.getString(languageKey) ?? 'id';
  }

  @override
  Future<String> changeLanguage(String language) {
    _sharedPreferences.setString(languageKey, language);
    return Future.value(language);
  }
}
