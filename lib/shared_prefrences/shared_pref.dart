import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPreferences;

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setStringData({
    required String key,
    required String value,
  }) async {
    await init();
    sharedPreferences.setString(key, value);
  }

  Future<String?> getStringData({required String key}) async {
    await init();
    return sharedPreferences.getString(key);
  }
  Future<bool?> getBoolData({required String key}) async {
    await init();
    return sharedPreferences.getBool(key);
  }
  Future<void> setBoolData({required String key, required bool value}) async {
    await init();
    sharedPreferences.setBool(key, value);
  }

  Future<int> getIntData({required String key}) async {
    await init();
    return sharedPreferences.getInt(key) ?? 0;
  }

  Future<void> setIntData({required String key, required int value}) async {
    await init();
    sharedPreferences.setInt(key, value);
  }

  Future<bool> clearAt(key) async {
    await init();
    return await sharedPreferences.remove(key);
  }

  Future<bool> clearPref() async {
    await init();
    return await sharedPreferences.clear();
  }
}