import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';

class SharedPreferencesHelper {
  static SharedPreferences? sharedPreferences;

  // MARK: - ✏️ Set Data.
  static setData(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint(
        '[SharedPreferencesHelper] setData with key: $key & value: $value');
    switch (value.runtimeType) {
      case String:
        prefs.setString(key, value);
        break;
      case int:
        prefs.setInt(key, value);
        break;
      case double:
        prefs.setDouble(key, value);
        break;
      case bool:
        prefs.setBool(key, value);
        break;
      case List:
        prefs.setStringList(key, value);
        break;
      default:
        debugPrint('[SharedPreferencesHelper] There\'s No Type Matched!');
        return null;
    }
  }

  // MARK: - 🧲 Get Data.
  static getData(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    debugPrint('[SharedPreferencesHelper] getData with key: $key');
    return prefs.get(key);
  }
}
