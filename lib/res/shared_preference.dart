import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences{
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  saveStringPreference(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  getStringPreference(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key)??'';
  }

  static final AppPreferences _appPreferences = new AppPreferences._internal();
  factory AppPreferences() {
    return _appPreferences;
  }
  AppPreferences._internal();
}

AppPreferences appPreferences = new AppPreferences();