import 'package:injectable/injectable.dart';

import 'app_database.dart';

@lazySingleton
class UnitOfWork {
  final AppDatabase _db;
  UnitOfWork(this._db);

  /// Runs any async function inside a transaction and returns its result.
  Future<T> runInTransaction<T>(Future<T> Function() operation) async {
    return await _db.transaction(() async {
      return await operation();
    });
  }
}
