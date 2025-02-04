import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  SharedPref._internal();
  static final SharedPref _instance = SharedPref._internal();

  static SharedPref get instance => _instance;

  static SharedPreferences? _sharedPreferences;

  /// Initialize SharedPreferences instance.
  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
  }

  /// Get SharedPreferences instance safely.
  SharedPreferences get prefs {
    if (_sharedPreferences == null) {
      throw Exception("SharedPreferences is not initialized. Call init() first.");
    }
    return _sharedPreferences!;
  }

  /// Set string value.
  Future<void> setString(String key, String value) async {
    await prefs.setString(key, value);
  }

  /// Get string value.
  String? getString(String key) => prefs.getString(key);

  /// Set boolean value.
  Future<void> setBoolean(String key, bool value) async {
    await prefs.setBool(key, value);
  }

  /// Get boolean value.
  bool? getBoolean(String key) => prefs.getBool(key);

  /// Set double value.
  Future<void> setDouble(String key, double value) async {
    await prefs.setDouble(key, value);
  }

  /// Get double value.
  double? getDouble(String key) => prefs.getDouble(key);

  /// Set int value.
  Future<void> setInt(String key, int value) async {
    await prefs.setInt(key, value);
  }

  /// Get int value.
  int? getInt(String key) => prefs.getInt(key);

  /// Set string list value.
  Future<void> setStringList(String key, List<String> value) async {
    await prefs.setStringList(key, value);
  }

  /// Get string list value.
  List<String>? getStringList(String key) => prefs.getStringList(key);

  /// Check if a preference exists.
  bool containsPreference(String key) => prefs.containsKey(key);

  /// Remove a preference.
  Future<void> removePreference(String key) async {
    await prefs.remove(key);
  }

  /// Clear all preferences.
  Future<void> clearPreferences() async {
    await prefs.clear();
  }
}
