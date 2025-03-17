import 'package:amary_cafe/data/implementation/preference/cafe_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CafePreferenceImpl extends CafePreference {
  final SharedPreferences _preferences;

  static const String _keyNotification = "KEY_NOTIFICATION";
  static const String _keyDarkTheme = "KEY_DARK_THEME";

  CafePreferenceImpl({required SharedPreferences preferences})
    : _preferences = preferences;

  @override
  Future<bool> getIsDarkTheme() async {
    try {
      return _preferences.getBool(_keyDarkTheme) ?? false;
    } catch (e) {
      throw Exception("Preferences cannot save the theme value.");
    }
  }

  @override
  Future<bool> getNotification() async {
    try {
      return _preferences.getBool(_keyNotification) ?? false;
    } catch (e) {
      throw Exception("Preferences cannot save the theme value.");
    }
  }

  @override
  Future<void> saveDarkTheme(bool isDarkTheme) async {
    try {
      await _preferences.setBool(_keyDarkTheme, isDarkTheme);
    } catch (e) {
      throw Exception("Preferences cannot save the theme value.");
    }
  }

  @override
  Future<void> saveNotification(bool isNotify) async {
    try {
      await _preferences.setBool(_keyNotification, isNotify);
    } catch (e) {
      throw Exception("Preferences cannot save the notification value.");
    }
  }
}
