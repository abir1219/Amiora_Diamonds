import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper{
  static SharedPreferences? _preferences;

  // Initialize SharedPreferences
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveString(String key, String value) async {
    debugPrint("$key ---!!!--> $value");
    await _preferences!.setString(key, value);
  }

  static Future<void> saveBool(String key, bool value) async {
    await _preferences!.setBool(key, value);
  }

  static Future<void> saveInt(String key, int value) async {
    await _preferences!.setInt(key, value);
  }

  static bool containsKey(String key) {
    return _preferences!.containsKey(key);
  }

  // Retrieve a string value from SharedPreferences
  static String? getString(String key) {
    return _preferences!.getString(key);
  }

  static int? getInt(String key) {
    return _preferences!.getInt(key);
  }

  static bool? getBool(String key) {
    return _preferences!.getBool(key);
  }

  // Remove a value from SharedPreferences
  static Future<void> remove(String key) async {
    await _preferences!.remove(key);
  }

  static Future<void> clear() async {
    Set<String> allKeys = _preferences!.getKeys();
    for (String key in allKeys) {
      //if (!keysToKeep.contains(key)) {
      _preferences!.remove(key);
      // }
      await _preferences!.clear();
    }
  }

}