import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  //! Initialize SharedPreferences
  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  //! Save a single value (String, int, bool, double)
  Future<bool> saveData({required String key, required dynamic value}) async {
    if (value is bool) {
      return await sharedPreferences.setBool(key, value);
    }
    if (value is String) {
      return await sharedPreferences.setString(key, value);
    }
    if (value is int) {
      return await sharedPreferences.setInt(key, value);
    } else {
      return await sharedPreferences.setDouble(key, value);
    }
  }

  //! Retrieve a single value
  dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  //! Save a List of Strings
  Future<bool> saveList({required String key, required List<String> value}) async {
    return await sharedPreferences.setStringList(key, value);
  }

  //! Retrieve a List of Strings
  List<String>? getList({required String key}) {
    return sharedPreferences.getStringList(key);
  }

  //! Remove a single value
  Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  //! Add an item to a List
  Future<void> addToList({required String key, required String value}) async {
    final existingList = sharedPreferences.getStringList(key) ?? [];
    if (!existingList.contains(value)) {
      existingList.add(value);
      await sharedPreferences.setStringList(key, existingList);
    }
  }

  //! Remove an item from a List
  Future<void> removeFromList({required String key, required String value}) async {
    final existingList = sharedPreferences.getStringList(key) ?? [];
    existingList.remove(value);
    await sharedPreferences.setStringList(key, existingList);
  }

  //! Retrieve List Length
  int getListLength({required String key}) {
    final existingList = sharedPreferences.getStringList(key) ?? [];
    return existingList.length;
  }
}
