import 'dart:convert';
import 'package:password_manager/data/enum/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtil {
  const PreferenceUtil(SharedPreferences prefs) : _prefs = prefs;

  final SharedPreferences _prefs;

  getValue<T>(StorageKeys key, T value) async {
    switch (T) {
      case int:
        return _prefs.getInt(key.name) as T?;
      case double:
        return _prefs.getDouble(key.name) as T?;
      case String:
        return _prefs.getString(key.name) as T?;
      case bool:
        return _prefs.getBool(key.name) as T?;
      default:
      // assert(fromJson != null, 'fromJson must be provided for Object values');
      // if (fromJson != null) {
      //   final stringObject = _prefs.getString(key.name);
      //   if (stringObject == null) return null;
      //   final jsonObject = jsonDecode(stringObject) as Map<String, dynamic>;
      //   return fromJson(jsonObject);
      // }
    }
    return null;
  }

  void setValue<T>(StorageKeys key, T value) {
    switch (T) {
      case int:
        _prefs.setInt(key.name, value as int);
        break;
      case double:
        _prefs.setDouble(key.name, value as double);
        break;
      case String:
        _prefs.setString(key.name, value as String);
        break;
      case bool:
        _prefs.setBool(key.name, value as bool);
        break;
      default:
        assert(
          value is Map<String, dynamic>,
          'value must be int, double, String, bool or Map<String, dynamic>',
        );
        final stringObject = jsonEncode(value);
        _prefs.setString(key.name, stringObject);
    }
  }

  void remove(String key) {
    _prefs.remove(key);
  }
  void clear(){
    _prefs.clear();
  }
}
