import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late SharedPreferences preferences;

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData(String key, dynamic data) async {
    if (data is String) {
      return preferences.setString(key, data);
    } else if (data is bool) {
      return preferences.setBool(key, data);
    } else if (data is int) {
      return preferences.setInt(key, data);
    } else if (data is double) {
      return preferences.setDouble(key, data);
    }
    return false;
  }

  static Future<String?> getData(String key) async {
    return preferences.getString(key);
  }
}
