import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  Future<void> save({
    required String key,
    required String value,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String?> read({
    required String key,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }
}

abstract class StorageKey {
  static const String login = 'LOGIN';
  static const String password = 'PASSWORD';
}
