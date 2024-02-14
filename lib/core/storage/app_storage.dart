import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  static SharedPreferences? _prefs;

  /// Initializes the AppStorage instance.
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    // You can perform any initialization logic here if needed.
  }

  /// Checks if data associated with the given [key] exists.
  static bool has(String key) {
    return _prefs!.containsKey(key);
  }

  /// Retrieves data associated with the given [key].
  static dynamic get(String key) {
    // Reading the value as dynamic to support different types
    return _prefs!.get(key);
  }
  
  /// Stores data associated with the given [key].
  static Future<void> set(String key, dynamic value) async {
    // Storing values based on their types
    if (value is String) {
      _prefs!.setString(key, value);
    } else if (value is int) {
      _prefs!.setInt(key, value);
    } else if (value is double) {
      _prefs!.setDouble(key, value);
    } else if (value is bool) {
      _prefs!.setBool(key, value);
    } else {
      throw ArgumentError("Unsupported data type");
    }
  }

  /// Removes data associated with the given [key].
  static Future<void> remove(String key) async {
    _prefs!.remove(key);
  }

  /// Clears all stored data.
  static Future<void> clear() async {
    _prefs!.clear();
  }

  /// Closes the storage instance.
  static Future<void> close() async {
    // There's no explicit closing needed for shared_preferences.
  }
}
