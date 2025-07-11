import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppPreferences {
  static final _storage = FlutterSecureStorage();

  // Set value (String, int, double, bool, List<String>)
  static Future<void> setValue<T>(String key, T value) async {
    if (value is String) {
      await _storage.write(key: key, value: value);
    } else if (value is int || value is double || value is bool) {
      await _storage.write(key: key, value: value.toString());
    } else if (value is List<String>) {
      await _storage.write(key: key, value: value.join(','));
    } else {
      throw Exception('Unsupported type');
    }
  }

  // Get value (String, int, double, bool, List<String>)
  static Future<T?> getValue<T>(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) return null;
    if (T == String) {
      return value as T;
    } else if (T == int) {
      return int.tryParse(value) as T?;
    } else if (T == double) {
      return double.tryParse(value) as T?;
    } else if (T == bool) {
      return (value == 'true') as T;
    } else if (T == List<String>) {
      return value.split(',') as T;
    } else {
      throw Exception('Unsupported type');
    }
  }

  static Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }

  static Future<void> clear() async {
    await _storage.deleteAll();
  }
}
