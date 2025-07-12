/// A secure preferences storage utility using Flutter Secure Storage.
///
/// This class provides a type-safe interface for storing and retrieving
/// sensitive data like authentication tokens, user preferences, and other
/// secure information. It uses the `flutter_secure_storage` package to
/// ensure data is encrypted and stored securely on the device.
///
/// ## Features
/// - Type-safe storage and retrieval
/// - Automatic serialization/deserialization
/// - Secure storage using platform-specific encryption
/// - Support for multiple data types (String, int, double, bool, List<String>)
/// - Error handling for unsupported types
///
/// ## Supported Types
/// - `String`: Stored as-is
/// - `int`, `double`, `bool`: Converted to/from String
/// - `List<String>`: Joined with commas for storage, split for retrieval
///
/// ## Usage Examples
/// ```dart
/// // Store values
/// await AppPreferences.setValue('auth_token', 'abc123');
/// await AppPreferences.setValue('user_id', 12345);
/// await AppPreferences.setValue('is_logged_in', true);
/// await AppPreferences.setValue('favorite_colors', ['red', 'blue', 'green']);
///
/// // Retrieve values
/// final token = await AppPreferences.getValue<String>('auth_token');
/// final userId = await AppPreferences.getValue<int>('user_id');
/// final isLoggedIn = await AppPreferences.getValue<bool>('is_logged_in');
/// final colors = await AppPreferences.getValue<List<String>>('favorite_colors');
///
/// // Remove specific key
/// await AppPreferences.remove('auth_token');
///
/// // Clear all data
/// await AppPreferences.clear();
/// ```
///
/// ## Security Notes
/// - Data is encrypted using platform-specific encryption (Keychain on iOS, Keystore on Android)
/// - Sensitive data like tokens and passwords should be stored using this class
/// - Non-sensitive preferences can use regular SharedPreferences for better performance
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Secure preferences storage utility for sensitive application data.
///
/// Provides a type-safe interface for storing and retrieving encrypted
/// data on the device using platform-specific secure storage mechanisms.
class AppPreferences {
  /// Flutter secure storage instance for encrypted data storage.
  static final _storage = FlutterSecureStorage();

  /// Stores a value securely with automatic type conversion.
  ///
  /// Converts the value to a string representation for storage.
  /// Supports String, int, double, bool, and List<String> types.
  ///
  /// [key] The unique identifier for the stored value.
  /// [value] The value to store (must be of supported type).
  ///
  /// ## Throws
  /// - `Exception` with message 'Unsupported type' if the value type is not supported.
  ///
  /// ## Supported Types
  /// - `String`: Stored directly
  /// - `int`, `double`, `bool`: Converted to string using `toString()`
  /// - `List<String>`: Joined with commas using `join(',')`
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

  /// Retrieves a value securely with automatic type conversion.
  ///
  /// Converts the stored string back to the requested type.
  /// Returns `null` if the key doesn't exist or the value is null.
  ///
  /// [key] The unique identifier for the value to retrieve.
  ///
  /// ## Returns
  /// The retrieved value converted to type T, or null if not found.
  ///
  /// ## Throws
  /// - `Exception` with message 'Unsupported type' if the requested type is not supported.
  ///
  /// ## Type Conversion
  /// - `String`: Returned as-is
  /// - `int`: Parsed using `int.tryParse()`
  /// - `double`: Parsed using `double.tryParse()`
  /// - `bool`: Returns true if value equals 'true' (case-sensitive)
  /// - `List<String>`: Split by commas using `split(',')`
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

  /// Removes a specific key-value pair from secure storage.
  ///
  /// Deletes the stored value for the specified key. If the key doesn't
  /// exist, the operation completes successfully without error.
  ///
  /// [key] The unique identifier of the value to remove.
  static Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }

  /// Clears all stored data from secure storage.
  ///
  /// Removes all key-value pairs stored by this application.
  /// This is useful for logout scenarios or complete data reset.
  ///
  /// ## Use Cases
  /// - User logout
  /// - App data reset
  /// - Privacy compliance (GDPR, etc.)
  static Future<void> clear() async {
    await _storage.deleteAll();
  }
}
