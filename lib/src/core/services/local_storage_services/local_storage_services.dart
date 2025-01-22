import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// Sets
  static Future<bool> setBool(String key, bool value) async =>
      await _prefs.setBool(key, value);
  static Future<bool> setDouble(String key, double value) async =>
      await _prefs.setDouble(key, value);
  static Future<bool> setInt(String key, int value) async =>
      await _prefs.setInt(key, value);
  static Future<bool> setString(String key, String value) async =>
      await _prefs.setString(key, value);
  static Future<bool> setStringList(String key, List<String> value) async =>
      await _prefs.setStringList(key, value);

  /// Set Map List
  static Future<bool> setMapList(String key, List<Map<String, dynamic>> value) async {
    final jsonString = jsonEncode(value);
    return await _prefs.setString(key, jsonString);
  }

  /// Gets
  static bool? getBool(String key) => _prefs.getBool(key);
  static double? getDouble(String key) => _prefs.getDouble(key);
  static int? getInt(String key) => _prefs.getInt(key);
  static String? getString(String key) => _prefs.getString(key);
  static List<String>? getStringList(String key) => _prefs.getStringList(key);

  /// Get Map List
  static List<Map<String, dynamic>>? getMapList(String key) {
    final jsonString = _prefs.getString(key);
    if (jsonString == null) return null;
    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((item) => item as Map<String, dynamic>).toList();
  }

  /// Deletes
  static Future<bool> remove(String key) async => await _prefs.remove(key);
  static Future<bool> clear() async => await _prefs.clear();
}
