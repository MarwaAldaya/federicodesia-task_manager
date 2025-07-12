/// Unit of Work pattern implementation for database transactions.
///
/// This class provides a clean abstraction for executing database operations
/// within transactions, ensuring data consistency and atomicity. It follows
/// the Unit of Work pattern to manage database transactions effectively.
///
/// ## Features
/// - Generic transaction support for any operation
/// - Automatic rollback on failure
/// - Type-safe return values
/// - Clean separation of concerns
/// - Dependency injection ready
///
/// ## Usage Examples
/// ```dart
/// // Simple transaction
/// final result = await unitOfWork.runInTransaction(() async {
///   // Perform multiple database operations
///   await db.insertTask(task1);
///   await db.insertTask(task2);
///   await db.updateSyncRecord(record);
///   return 'Success';
/// });
///
/// // Transaction with complex logic
/// final task = await unitOfWork.runInTransaction(() async {
///   final newTask = await db.insertTask(taskParams);
///   final syncRecord = SyncParams(
///     id: uuid.v4(),
///     recordId: newTask.id,
///     operationType: 'create',
///     syncStatus: SyncStatus.needSync,
///     feature: 'task',
///     createdAt: DateTime.now(),
///   );
///   await db.insertSyncRecord(syncRecord);
///   return newTask;
/// });
/// ```
///
/// ## Benefits
/// - **Atomicity**: All operations succeed or fail together
/// - **Consistency**: Database remains in a valid state
/// - **Isolation**: Operations are isolated from other transactions
/// - **Durability**: Committed changes are permanent
///
/// ## Error Handling
/// If any operation within the transaction throws an exception, the entire
/// transaction is rolled back automatically, and the exception is re-thrown.
import 'package:injectable/injectable.dart';

import 'app_database.dart';

/// Unit of Work implementation for managing database transactions.
///
/// Provides a clean interface for executing multiple database operations
/// within a single transaction, ensuring data consistency and proper
/// error handling.
@lazySingleton
class UnitOfWork {
  /// The database instance for executing transactions.
  final AppDatabase _db;

  /// Creates a new UnitOfWork instance with the specified database.
  ///
  /// [db] The database instance to use for transactions.
  UnitOfWork(this._db);

  /// Executes an operation within a database transaction.
  ///
  /// Runs the provided operation function within a database transaction.
  /// If the operation completes successfully, the transaction is committed.
  /// If any exception occurs, the transaction is automatically rolled back.
  ///
  /// [operation] The async function to execute within the transaction.
  ///
  /// ## Returns
  /// The result of the operation function.
  ///
  /// ## Throws
  /// - Any exception thrown by the operation function
  /// - Database-specific exceptions if the transaction fails
  ///
  /// ## Example
  /// ```dart
  /// final result = await unitOfWork.runInTransaction(() async {
  ///   // Multiple database operations
  ///   await db.insertTask(task);
  ///   await db.insertSyncRecord(syncRecord);
  ///   return 'Operation completed';
  /// });
  /// ```
  ///
  /// ## Transaction Behavior
  /// - **Success**: All changes are committed to the database
  /// - **Failure**: All changes are rolled back, database remains unchanged
  /// - **Isolation**: Other transactions cannot see uncommitted changes
  Future<T> runInTransaction<T>(Future<T> Function() operation) async {
    return await _db.transaction(() async {
      return await operation();
    });
  }
}
