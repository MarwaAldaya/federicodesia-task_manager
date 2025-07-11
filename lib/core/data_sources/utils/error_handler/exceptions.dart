export 'package:firebase_auth/firebase_auth.dart';

class LocalDatabaseException implements Exception {
  final String message;
  LocalDatabaseException(this.message);
  @override
  String toString() => 'LocalDatabaseException: $message';
}

class FirebaseServiceException implements Exception {
  final String message;
  FirebaseServiceException(this.message);
  @override
  String toString() => 'FirebaseServiceException: $message';
}
