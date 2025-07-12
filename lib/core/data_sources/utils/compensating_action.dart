/// Compensating Action pattern implementation for distributed operations.
///
/// This utility provides a robust way to handle operations that involve both
/// remote and local data sources, ensuring consistency even when partial
/// failures occur. It implements the Saga pattern for distributed transactions.
///
/// ## Pattern Overview
/// The Compensating Action pattern is used when you need to perform operations
/// across multiple systems (e.g., remote API and local database) and want to
/// ensure consistency. If the local operation fails after a successful remote
/// operation, a compensating action is executed to undo the remote changes.
///
/// ## Use Cases
/// - Creating tasks with both remote and local storage
/// - Updating user data across multiple systems
/// - Synchronizing data between local and remote databases
/// - Handling offline-first operations with eventual consistency
///
/// ## Features
/// - Automatic compensation on local failure
/// - Comprehensive error handling and reporting
/// - Clear operation naming for debugging
/// - Type-safe return values
/// - Proper exception propagation
///
/// ## Usage Examples
/// ```dart
/// // Create task with compensation
/// final task = await CompensatingAction.runWithCompensation(
///   remoteOperation: () => remoteDataSource.createTask(params),
///   localOperation: () => localDataSource.createTask(params),
///   compensateRemote: () => remoteDataSource.deleteTask(taskId),
///   operationName: 'CreateTask',
/// );
///
/// // Update task with compensation
/// final updatedTask = await CompensatingAction.runWithCompensation(
///   remoteOperation: () => remoteDataSource.updateTask(params),
///   localOperation: () => localDataSource.updateTask(params),
///   compensateRemote: () => remoteDataSource.revertTaskUpdate(taskId),
///   operationName: 'UpdateTask',
/// );
/// ```
///
/// ## Error Scenarios
/// 1. **Remote fails**: Local operation is not executed, exception is thrown
/// 2. **Local fails**: Remote operation is compensated, exception is thrown
/// 3. **Compensation fails**: Both operations fail, detailed exception is thrown
///
/// ## Benefits
/// - **Consistency**: Ensures data consistency across systems
/// - **Reliability**: Handles partial failures gracefully
/// - **Debuggability**: Clear error messages with operation context
/// - **Maintainability**: Centralized compensation logic

/// Utility class for implementing the Compensating Action pattern.
///
/// Provides a clean interface for executing operations that require
/// compensation in case of partial failures.
class CompensatingAction {
  /// Executes a remote operation followed by a local operation with compensation.
  ///
  /// This method implements the Saga pattern for distributed transactions:
  /// 1. Execute the remote operation
  /// 2. If successful, execute the local operation
  /// 3. If local operation fails, execute the compensation action
  /// 4. Return the result of the remote operation
  ///
  /// ## Execution Flow
  /// ```
  /// Remote Operation → Success → Local Operation → Success → Return Result
  ///                ↓                    ↓
  ///              Failure              Failure
  ///                ↓                    ↓
  ///              Throw Error         Compensation → Success → Throw Error
  ///                                           ↓
  ///                                        Failure
  ///                                           ↓
  ///                                    Throw Detailed Error
  /// ```
  ///
  /// [remoteOperation] Function that performs the remote operation.
  /// [localOperation] Function that performs the local operation.
  /// [compensateRemote] Function that undoes the remote operation.
  /// [operationName] Human-readable name for the operation (used in error messages).
  ///
  /// ## Returns
  /// The result of the remote operation if both operations succeed.
  ///
  /// ## Throws
  /// - Exception with remote operation details if remote fails
  /// - Exception with local operation details if local fails but compensation succeeds
  /// - Exception with both local and compensation details if both fail
  ///
  /// ## Example
  /// ```dart
  /// try {
  ///   final result = await CompensatingAction.runWithCompensation(
  ///     remoteOperation: () async {
  ///       return await api.createTask(taskData);
  ///     },
  ///     localOperation: () async {
  ///       return await database.insertTask(taskData);
  ///     },
  ///     compensateRemote: () async {
  ///       await api.deleteTask(taskData.id);
  ///     },
  ///     operationName: 'CreateTask',
  ///   );
  ///   print('Task created successfully: $result');
  /// } catch (e) {
  ///   print('Failed to create task: $e');
  /// }
  /// ```
  static Future<T> runWithCompensation<T>({
    required Future<T> Function() remoteOperation,
    required Future<void> Function() localOperation,
    required Future<void> Function() compensateRemote,
    required String operationName,
  }) async {
    try {
      // Step 1: Execute remote operation
      final remoteResult = await remoteOperation();

      try {
        // Step 2: Execute local operation
        await localOperation();

        // Step 3: Both operations succeeded, return remote result
        return remoteResult;
      } catch (localError) {
        // Step 4: Local operation failed, try to compensate
        try {
          await compensateRemote();
        } catch (compensateError) {
          // Step 5: Compensation also failed, throw detailed error
          throw Exception(
              '$operationName: Local failed ($localError), compensation also failed ($compensateError)');
        }

        // Step 6: Compensation succeeded, throw error with local details
        throw Exception(
            '$operationName: Local failed ($localError), remote compensated');
      }
    } catch (remoteError) {
      // Step 7: Remote operation failed, throw error
      throw Exception('$operationName: Remote failed ($remoteError)');
    }
  }
}
