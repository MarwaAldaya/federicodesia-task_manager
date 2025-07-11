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
  final TaskRemoteDataSource _remoteDataSource;
  final TaskLocalDataSource _localDataSource;
  final InternetConnectionChecker _connectionChecker;
  final Uuid _uuid = Uuid();
  final SyncLocalDataSource _localSyncDataSource;
  final UnitOfWork _unitOfWork;

  String _generateId() => _uuid.v4();

  TaskRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._connectionChecker,
    this._localSyncDataSource,
    this._unitOfWork,
  );

  SyncParams _generateSyncParams(
      {required String operationType,
      required SyncStatus syncStatus,
      String? taskId,
      Map<String, dynamic>? json}) {
    return SyncParams(
        id: _generateId(),
        operationType: operationType,
        syncStatus: syncStatus,
        recordId: taskId ?? _generateId(),
        feature: FeatureNames.task,
        createdAt: DateTime.now(),
        operationParamsJson: json);
  }

  /// Returns all tasks, either from remote or local depending on connectivity.
  /// Logs the source and any errors encountered.
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

  /// Creates a new task, syncing offline if needed. Logs all actions and errors.
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

  /// Updates a task, syncing offline if needed. Logs all actions and errors.
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

  /// Deletes a task, syncing offline if needed. Logs all actions and errors.
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

  /// Returns a task by id, either from remote or local depending on connectivity.
  /// Logs the source and any errors encountered.
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
