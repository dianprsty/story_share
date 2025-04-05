import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constant/strings.dart';

abstract interface class AuthenticationLocalDatasource {
  Future<void> saveToken(String token);
  Future<String> getToken();
  Future<void> deleteToken();
}

class AuthenticationLocalDatasourceImpl
    implements AuthenticationLocalDatasource {
  final SharedPreferences _sharedPreferences;

  AuthenticationLocalDatasourceImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  @override
  Future<void> deleteToken() async {
    _sharedPreferences.remove(tokenKey);
  }

  @override
  Future<String> getToken() async {
    var token =  _sharedPreferences.getString(tokenKey);
    return token ?? '';
  }

  @override
  Future<void> saveToken(String token) async {
    _sharedPreferences.setString(tokenKey, token);
  }
}
