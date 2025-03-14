import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static cacheData(String key, dynamic value) async {
    if (value is int) {
      await _prefs?.setInt(key, value);
    } else if (value is double) {
      await _prefs?.setDouble(key, value);
    } else if (value is bool) {
      await _prefs?.setBool(key, value);
    } else if (value is String) {
      await _prefs?.setString(key, value);
    } else if (value is List<String>) {
      await _prefs?.setStringList(key, value);
    } else {
      throw Exception("UnSupported type for Shared Helper");
    }
  }

  static dynamic getData(String key) {
    return _prefs?.get(key);
  }

  // static Future<bool?> removeKey(String key) async {
  //     return await prefs?.remove(key);
  //   }
  //
  //   static clearAll() async {
  //     return await prefs?.clear();
  //   }
  // }
}
