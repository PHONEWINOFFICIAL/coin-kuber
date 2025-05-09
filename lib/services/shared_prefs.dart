import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? _sharedPref;
  static final SharedPref _instance = SharedPref._internal();

  factory SharedPref() => _instance;

  SharedPref._internal();

  static Future<void> init() async {
    _sharedPref = await SharedPreferences.getInstance();
  }

  static String getString({required String key}) {
    return _sharedPref?.getString(key) ?? "";
  }

  static Future<bool> setString(
      {required String key, required String value}) async {
    return await _sharedPref!.setString(key, value);
  }

  static void clearSharedPreferences() async {
    await _sharedPref!.clear();
  }

  static Future<bool> remove({required String key}) async {
    return await _sharedPref!.remove(key);
  }

  static bool getBool({required String key}) {
    return _sharedPref!.getBool(key) ?? false;
  }

  static Future<Object> setBool(
      {required String key, required bool value}) async {
    return await _sharedPref!.setBool(key, value);
  }

  static int getInt({required String key}) {
    return _sharedPref?.getInt(key) ?? 0;
  }

  static Future<bool> setInt({required String key, required int value}) async {
    return await _sharedPref!.setInt(key, value);
  }

  static Future<bool> setStringList({required String key, required List<String> value}) {
    return _sharedPref!.setStringList(key, value);
  }

  static List<String> getStringList({String? key}) {
    return _sharedPref!.getStringList(key!) ?? <String>[];
  }
}
