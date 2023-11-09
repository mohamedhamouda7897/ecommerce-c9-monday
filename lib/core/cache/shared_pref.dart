import 'package:shared_preferences/shared_preferences.dart';

class CacheData {
  static late SharedPreferences preferences;

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData<T>(String key, String data) async {
    return preferences.setString(key, data);
  }

  static Future<String?> getData(String key) async {
    return preferences.getString(key);
  }
}
