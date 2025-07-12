/// Implementation of TaskRepository with comprehensive error handling and logging.
///
/// This repository implementation provides a robust interface for task operations
/// with automatic network connectivity checking, proper error handling, and
/// comprehensive logging for debugging and monitoring purposes.
///
/// ## Features
/// - Automatic network connectivity detection
/// - Offline-first approach with local data prioritization
/// - Comprehensive error handling and logging
/// - Atomic transactions for data consistency
/// - Compensating actions for distributed operations
/// - Sync record management for offline operations
///
/// ## Architecture
/// The repository follows the Repository pattern and implements:
/// - **Network-first for online operations**: Remote operations with local compensation
/// - **Local-first for offline operations**: Local operations with sync records
/// - **Automatic sync**: Background synchronization when connectivity is restored
/// - **Error resilience**: Graceful handling of partial failures
///
/// ## Usage Examples
/// ```dart
/// // Get all tasks (prioritizes local data)
/// final result = await taskRepository.getAllTasks();
/// result.fold(
///   (error) => print('Error: ${error.failure.message}'),
///   (tasks) => print('Tasks: ${tasks.length}'),
/// );
///
/// // Create task (handles online/offline automatically)
/// final createResult = await taskRepository.createTask(taskParams);
/// createResult.fold(
///   (error) => print('Creation failed: ${error.failure.message}'),
///   (task) => print('Task created: ${task.id}'),
/// );
/// ```
///
/// ## Error Handling
/// - Network errors are wrapped in appropriate error types
/// - Local database errors are handled gracefully
/// - Sync failures are logged and retried
/// - User-friendly error messages are provided
import 'package:bloc_arch/features/sync/data/data_source/sync_local_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';

import 'package:bloc_arch/features/task/data/source/task_remote_data_source.dart';
import 'package:bloc_arch/features/task/data/source/task_local_data_source.dart';
import 'package:bloc_arch/features/task/data/models/task_model.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/features/task/domain/params/create_task_params/create_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/update_task_params/update_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/filter_task_params.dart';
import 'package:bloc_arch/features/task/domain/repository/task_repository.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';
import 'dart:developer';
import 'package:bloc_arch/features/sync/domain/params/sync_params.dart';
import 'package:bloc_arch/core/const/constants.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/upcoming_tasks_params.dart';
import 'package:bloc_arch/core/data_sources/local/database/unit_of_work.dart';
import 'package:bloc_arch/core/data_sources/utils/compensating_action.dart';

/// Implementation of TaskRepository with network checking, error handling, and logging.
///
/// This repository implementation handles network connectivity checks, proper error handling,
/// and logs all major operations for easier debugging and monitoring.
@Injectable(as: TaskRepository)
class TaskRepositoryImpl implements TaskRepository {
  /// Remote data source for API operations.
  final TaskRemoteDataSource _remoteDataSource;

  /// Local data source for database operations.
  final TaskLocalDataSource _localDataSource;

  /// Internet connectivity checker.
  final InternetConnectionChecker _connectionChecker;

  /// UUID generator for creating unique identifiers.
  final Uuid _uuid = Uuid();

  /// Local sync data source for managing sync records.
  final SyncLocalDataSource _localSyncDataSource;

  /// Unit of Work for atomic database operations.
  final UnitOfWork _unitOfWork;

  /// Generates a unique identifier using UUID v4.
  ///
  /// Returns a cryptographically secure random UUID string.
  String _generateId() => _uuid.v4();

  /// Creates a new TaskRepositoryImpl instance.
  ///
  /// [remoteDataSource] The remote data source for API operations.
  /// [localDataSource] The local data source for database operations.
  /// [connectionChecker] The internet connectivity checker.
  /// [localSyncDataSource] The local sync data source.
  /// [unitOfWork] The unit of work for atomic operations.
  TaskRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._connectionChecker,
    this._localSyncDataSource,
    this._unitOfWork,
  );

  /// Generates sync parameters for tracking operations.
  ///
  /// Creates a [SyncParams] object with the specified operation details
  /// and current timestamp information.
  ///
  /// [operationType] The type of operation (create, update, delete).
  /// [syncStatus] The current sync status.
  /// [taskId] Optional task ID for the operation.
  /// [json] Optional JSON parameters for the operation.
  ///
  /// Returns a [SyncParams] object with generated ID and timestamps.
  SyncParams _generateSyncParams({
    required String operationType,
    required SyncStatus syncStatus,
    String? taskId,
    Map<String, dynamic>? json,
  }) {
    return SyncParams(
      id: _generateId(),
      operationType: operationType,
      syncStatus: syncStatus,
      recordId: taskId ?? _generateId(),
      feature: FeatureNames.task,
      createdAt: DateTime.now(),
      operationParamsJson: json,
    );
  }

  /// Retrieves all tasks, prioritizing local data for consistency.
  ///
  /// This method implements an offline-first approach:
  /// - **Online**: Fetches from remote API and returns results
  /// - **Offline**: Fetches from local database and returns results
  /// - **Error handling**: Provides detailed error information
  ///
  /// [filterParams] Optional filter parameters for querying tasks.
  ///
  /// ## Returns
  /// [Either<ErrorHandler, List<TaskEntity>>] containing either an error
  /// or a list of task entities.
  ///
  /// ## Logging
  /// - Logs the data source being used (remote vs local)
  /// - Logs successful operations and error conditions
  /// - Provides context for debugging network issues
  @override
  Future<Either<ErrorHandler, List<TaskEntity>>> getAllTasks({
    FilterTaskParams? filterParams,
  }) async {
    final hasInternet = await _connectionChecker.hasConnection;
    try {
      if (hasInternet) {
        log('[TaskRepository] Fetching all tasks from remote.');
        final response =
            await _remoteDataSource.getAllTasks(filterParams: filterParams);
        log('[TaskRepository] Successfully fetched tasks from remote.');
        final tasks = response.data!.map((model) => model.toEntity()).toList();
        return Right(tasks);
      } else {
        log('[TaskRepository] Fetching all tasks from local.');
        final localResponse =
            await _localDataSource.getAllTasks(filterParams: filterParams);
        if (localResponse.success == true && localResponse.data != null) {
          log('[TaskRepository] Successfully fetched tasks from local.');
          final tasks =
              localResponse.data!.map((model) => model.toEntity()).toList();
          return Right(tasks);
        } else {
          log('[TaskRepository] Local fetch failed.');
          return Left(
              ErrorHandler.handle(Exception('Failed to get tasks locally')));
        }
      }
    } catch (e) {
      log('[TaskRepository] Exception in getAllTasks: $e');
      return Left(ErrorHandler.handle(e));
    }
  }

  /// Creates a new task with automatic online/offline handling.
  ///
  /// This method handles task creation differently based on connectivity:
  /// - **Online**: Creates remotely first, then locally with compensation
  /// - **Offline**: Creates locally and adds sync record for later synchronization
  ///
  /// [params] The parameters for creating the task.
  ///
  /// ## Returns
  /// [Either<ErrorHandler, TaskEntity>] containing either an error
  /// or the created task entity.
  ///
  /// ## Online Flow
  /// 1. Create task remotely
  /// 2. If successful, create locally
  /// 3. If local fails, compensate by deleting remote task
  ///
  /// ## Offline Flow
  /// 1. Create task locally
  /// 2. Add sync record for later synchronization
  /// 3. Return task with sync status
  ///
  /// ## Logging
  /// - Logs the creation approach (remote vs local)
  /// - Logs successful operations and error conditions
  /// - Provides context for debugging sync issues
  @override
  Future<Either<ErrorHandler, TaskEntity>> createTask(
      CreateTaskParams params) async {
    final hasInternet = await _connectionChecker.hasConnection;
    final paramsWithLocalId = params.copyWith(id: _generateId());

    try {
      if (hasInternet) {
        log('[TaskRepository] Creating task remotely.');
        final response = await CompensatingAction.runWithCompensation(
          remoteOperation: () =>
              _remoteDataSource.createTask(paramsWithLocalId),
          localOperation: () => _localDataSource.createTask(paramsWithLocalId),
          compensateRemote: () =>
              _remoteDataSource.deleteTask(paramsWithLocalId.id!),
          operationName: 'CreateTask',
        );
        log('[TaskRepository] Task created remotely and locally with id: ${paramsWithLocalId.id}');
        return Right(response.data!.toEntity());
      } else {
        log('[TaskRepository] Creating task locally and adding sync record.');
        final localResponse = await _unitOfWork.runInTransaction(() async {
          final taskResponse =
              await _localDataSource.createTask(paramsWithLocalId);
          final syncParams = _generateSyncParams(
            taskId: paramsWithLocalId.id,
            operationType: OperationTypes.create,
            syncStatus: SyncStatus.needSync,
            json: paramsWithLocalId.toFirestoreJson(),
          );
          await _localSyncDataSource.insertSyncRecord(syncParams);
          return taskResponse;
        });
        log('[TaskRepository] Sync record created for offline task creation.');
        return Right(localResponse.data!
            .copyWith(syncStatus: SyncStatus.needSync.name)
            .toEntity());
      }
    } catch (e) {
      log('[TaskRepository] Exception in createTask: $e');
      return Left(ErrorHandler.handle(e));
    }
  }

  /// Updates an existing task with automatic online/offline handling.
  ///
  /// This method handles task updates differently based on connectivity:
  /// - **Online**: Updates remotely first, then locally with compensation
  /// - **Offline**: Updates locally and adds sync record for later synchronization
  ///
  /// [params] The parameters for updating the task.
  ///
  /// ## Returns
  /// [Either<ErrorHandler, TaskEntity>] containing either an error
  /// or the updated task entity.
  ///
  /// ## Online Flow
  /// 1. Update task remotely
  /// 2. If successful, update locally
  /// 3. If local fails, compensate by reverting remote update
  ///
  /// ## Offline Flow
  /// 1. Update task locally
  /// 2. Add sync record for later synchronization
  /// 3. Return task with sync status
  ///
  /// ## Logging
  /// - Logs the update approach (remote vs local)
  /// - Logs successful operations and error conditions
  /// - Provides context for debugging sync issues
  @override
  Future<Either<ErrorHandler, TaskEntity>> updateTask(
      UpdateTaskParams params) async {
    final hasInternet = await _connectionChecker.hasConnection;
    try {
      if (hasInternet) {
        log('[TaskRepository] Updating task remotely.');
        final response = await CompensatingAction.runWithCompensation(
          remoteOperation: () => _remoteDataSource.updateTask(params),
          localOperation: () => _localDataSource.updateTask(params),
          compensateRemote: () => _remoteDataSource.deleteTask(params.id!),
          operationName: 'UpdateTask',
        );
        log('[TaskRepository] Task updated remotely and locally with id: ${params.id}');
        return Right(response.data!.toEntity());
      } else {
        log('[TaskRepository] Updating task locally and adding sync record.');
        final localResponse = await _unitOfWork.runInTransaction(() async {
          final taskResponse = await _localDataSource.updateTask(params);
          final syncParams = _generateSyncParams(
              taskId: params.id,
              operationType: OperationTypes.update,
              syncStatus: SyncStatus.needSync,
              json: params.toFirestoreJson());
          await _localSyncDataSource.insertSyncRecord(syncParams);
          return taskResponse;
        });
        log('[TaskRepository] Sync record created for offline task update.');
        return Right(localResponse.data!
            .copyWith(syncStatus: SyncStatus.needSync.name)
            .toEntity());
      }
    } catch (e) {
      log('[TaskRepository] Exception in updateTask: $e');
      return Left(ErrorHandler.handle(e));
    }
  }

  /// Deletes a task with automatic online/offline handling.
  ///
  /// This method handles task deletion differently based on connectivity:
  /// - **Online**: Deletes remotely first, then locally
  /// - **Offline**: Deletes locally and adds sync record for later synchronization
  ///
  /// [taskId] The unique identifier of the task to delete.
  ///
  /// ## Returns
  /// [Either<ErrorHandler, void>] containing either an error or void on success.
  ///
  /// ## Online Flow
  /// 1. Delete task remotely (idempotent operation)
  /// 2. Delete task locally
  ///
  /// ## Offline Flow
  /// 1. Delete task locally
  /// 2. Add sync record for later synchronization
  ///
  /// ## Notes
  /// - Firestore delete operations are idempotent, so they succeed even if the document doesn't exist
  /// - This provides resilience against race conditions and duplicate delete requests
  ///
  /// ## Logging
  /// - Logs the deletion approach (remote vs local)
  /// - Logs successful operations and error conditions
  /// - Provides context for debugging sync issues
  @override
  Future<Either<ErrorHandler, void>> deleteTask(String taskId) async {
    final hasInternet = await _connectionChecker.hasConnection;

    try {
      if (hasInternet) {
        log('[TaskRepository] Deleting task remotely.');
        // Firestore delete is idempotent: succeeds even if doc doesn't exist
        await _remoteDataSource.deleteTask(taskId);
        await _localDataSource.deleteTask(taskId);
        log('[TaskRepository] Task deleted remotely and locally with id: $taskId');
        return const Right(null);
      } else {
        log('[TaskRepository] Deleting task locally and adding sync record.');
        await _unitOfWork.runInTransaction(() async {
          await _localDataSource.deleteTask(taskId);
          final syncParams = _generateSyncParams(
            taskId: taskId,
            operationType: OperationTypes.delete,
            syncStatus: SyncStatus.needSync,
          );
          await _localSyncDataSource.insertSyncRecord(syncParams);
        });
        log('[TaskRepository] Sync record created for offline task deletion.');

        return const Right(null);
      }
    } catch (e) {
      log('[TaskRepository] Exception in deleteTask: $e');
      return Left(ErrorHandler.handle(e));
    }
  }

  /// Retrieves a specific task by its ID.
  ///
  /// This method prioritizes remote data when online for the most up-to-date
  /// information, but falls back to local data when offline.
  ///
  /// [taskId] The unique identifier of the task to retrieve.
  ///
  /// ## Returns
  /// [Either<ErrorHandler, TaskEntity?>] containing either an error
  /// or the task entity (null if not found).
  ///
  /// ## Behavior
  /// - **Online**: Fetches from remote API for latest data
  /// - **Offline**: Fetches from local database
  /// - **Not found**: Returns null (not an error condition)
  ///
  /// ## Logging
  /// - Logs the data source being used (remote vs local)
  /// - Logs successful operations and error conditions
  /// - Provides context for debugging network issues
  @override
  Future<Either<ErrorHandler, TaskEntity?>> getTaskById(String taskId) async {
    final hasInternet = await _connectionChecker.hasConnection;
    try {
      if (hasInternet) {
        log('[TaskRepository] Fetching task by id from remote: $taskId');
        final response = await _remoteDataSource.getTaskById(taskId);

        return Right(response.data!.toEntity());
      } else {
        log('[TaskRepository] Fetching task by id from local: $taskId');
        final localResponse = await _localDataSource.getTaskById(taskId);
        return Right(localResponse.data?.toEntity());
      }
    } catch (e) {
      log('[TaskRepository] Exception in getTaskById: $e');
      return Left(ErrorHandler.handle(e));
    }
  }

  /// Retrieves upcoming tasks for a specific user on a specific date.
  ///
  /// This method prioritizes local data for consistency and reliability,
  /// especially important for notification systems that need to work offline.
  ///
  /// [params] Parameters containing user ID and due date for filtering.
  ///
  /// ## Returns
  /// [Either<ErrorHandler, List<TaskEntity>>] containing either an error
  /// or a list of upcoming task entities.
  ///
  /// ## Behavior
  /// 1. **Primary**: Attempts to fetch from local database
  /// 2. **Fallback**: If local fails and online, tries remote database
  /// 3. **Error**: If both fail, returns appropriate error
  ///
  /// ## Use Cases
  /// - Notification systems for upcoming tasks
  /// - Dashboard widgets showing due tasks
  /// - Calendar integrations
  ///
  /// ## Logging
  /// - Logs the data source being used (local vs remote)
  /// - Logs successful operations and error conditions
  /// - Provides context for debugging notification issues
  @override
  Future<Either<ErrorHandler, List<TaskEntity>>> getUpcomingTasksForUser(
      UpcomingTasksParams params) async {
    try {
      // Prioritize local data source for consistency and reliability
      log('[TaskRepository] Fetching upcoming tasks from local (prioritized).');
      final localResponse =
          await _localDataSource.getUpcomingTasksForUser(params);
      if (localResponse.success == true && localResponse.data != null) {
        log('[TaskRepository] Successfully fetched upcoming tasks from local.');
        final tasks =
            localResponse.data!.map((model) => model.toEntity()).toList();
        return Right(tasks);
      }

      // Fallback to remote if local fails
      final hasInternet = await _connectionChecker.hasConnection;
      if (hasInternet) {
        log('[TaskRepository] Local failed, trying remote for upcoming tasks.');
        final response =
            await _remoteDataSource.getUpcomingTasksForUser(params);
        log('[TaskRepository] Successfully fetched upcoming tasks from remote.');
        final tasks = response.data!.map((model) => model.toEntity()).toList();
        return Right(tasks);
      } else {
        log('[TaskRepository] Both local and remote failed for upcoming tasks.');
        return Left(ErrorHandler.handle(
            Exception('Failed to get upcoming tasks locally')));
      }
    } catch (e) {
      log('[TaskRepository] Exception in getUpcomingTasksForUser: $e');
      return Left(ErrorHandler.handle(e));
    }
  }
}
