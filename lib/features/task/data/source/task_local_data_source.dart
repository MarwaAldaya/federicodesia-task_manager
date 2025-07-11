import 'dart:developer';

import 'package:bloc_arch/features/sync/domain/params/sync_params.dart';
import 'package:bloc_arch/features/task/data/models/task_model.dart';
import 'package:bloc_arch/features/task/domain/params/create_task_params/create_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/update_task_params/update_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/filter_task_params.dart';
import 'package:bloc_arch/core/data_sources/models/base_response/base_response.dart';
import 'package:bloc_arch/core/data_sources/local/database/app_database.dart';
import 'package:bloc_arch/features/user/data/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:drift/drift.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/exceptions.dart';
import 'package:bloc_arch/features/task/domain/params/delete_task_params/delete_task_params.dart';
import 'package:bloc_arch/core/const/constants.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/upcoming_tasks_params.dart';
import 'dart:convert';

abstract class TaskLocalDataSource {
  Future<BaseResponse<List<TaskModel>>> getAllTasks({
    FilterTaskParams? filterParams,
  });

  Future<BaseResponse<TaskModel>> createTask(CreateTaskParams params);
  Future<BaseResponse<TaskModel>> updateTask(UpdateTaskParams params);
  Future<BaseResponse<void>> deleteTask(String taskId);
  Future<BaseResponse<TaskModel?>> getTaskById(String taskId);
  Future<void> addDeletedTask(DeleteTaskParams params);
  Future<BaseResponse<List<TaskModel>>> getUpcomingTasksForUser(
      UpcomingTasksParams params);

  /// Deletes all tasks from the local database. For testing/development only.
  Future<void> clearAllTasks();

  /// Deletes all tables from the local database. For testing/development only.
  Future<void> clearAllTables();

  /// Atomically insert a task and a sync record in a single transaction.
  Future<BaseResponse<TaskModel>> createTaskWithSync(
    CreateTaskParams params,
    SyncParams syncParams,
  ) async {
    // Implemented in TaskLocalDataSourceImpl
    throw UnimplementedError();
  }
}

@Injectable(as: TaskLocalDataSource)
class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final AppDatabase _database;

  TaskLocalDataSourceImpl(this._database);

  @override
  Future<BaseResponse<List<TaskModel>>> getAllTasks({
    FilterTaskParams? filterParams,
  }) async {
    try {
      // 1. Query all tasks matching the filter (except for deleted)
      final query = _database.select(_database.tasks);
      if (filterParams != null) {
        if (filterParams.statuses != null &&
            filterParams.statuses!.isNotEmpty) {
          query.where((tbl) => tbl.status
              .isIn(filterParams.statuses!.map((s) => s.name).toList()));
        }
        if (filterParams.userIds != null && filterParams.userIds!.isNotEmpty) {
          query.where((tbl) => tbl.assigneeId.isIn(filterParams.userIds!));
        }
        if (filterParams.dueDate != null) {
          query.where((tbl) => tbl.dueDate.equals(filterParams.dueDate!));
        }
      }
      // Don't filter out deleted here, will do in memory
      final allTasks = await query.get();

      // For each task, get the latest sync status from SyncRecords
      final List<TaskModel> allTaskModels = [];

      for (final task in allTasks) {
        // Get the latest sync record for this task
        final latestSyncRecord = await (_database.select(_database.syncRecords)
              ..where((tbl) =>
                  tbl.recordId.equals(task.id) &
                  tbl.feature.equals(FeatureNames.task))
              ..orderBy([
                (tbl) => OrderingTerm(
                    expression: tbl.updatedAt, mode: OrderingMode.desc),
                (tbl) => OrderingTerm(
                    expression: tbl.createdAt, mode: OrderingMode.desc),
              ])
              ..limit(1))
            .getSingleOrNull();
        final taskModel = _taskFromTable(task).copyWith(
          syncStatus: latestSyncRecord?.syncStatus ?? SyncStatus.synced.name,
        );
        allTaskModels.add(taskModel);
      }

      return BaseResponse<List<TaskModel>>(
        data: allTaskModels,
        success: true,
      );
    } catch (e) {
      throw LocalDatabaseException(
          'Failed to get tasks from local database: $e');
    }
  }

  @override
  Future<BaseResponse<TaskModel>> createTask(CreateTaskParams params) async {
    try {
      final task = TasksCompanion.insert(
        id: params.id!,
        title: params.title,
        description: Value(params.description),
        dueDate: Value(params.dueDate),
        priority: Value(params.priority?.name),
        status: params.status.name,
        assigneeId: Value(params.assignee?.id),
        assigneeUsername: Value(params.assignee?.username),
        assigneeEmail: Value(params.assignee?.email),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      log('Inserting task with id: ${task.id.value}');
// //TODO: Remove when complete
//       await logTableCount(
//         getCount: () async =>
//             (await _database.select(_database.tasks).get()).length,
//         label: 'before',
//       );

      await _database.into(_database.tasks).insert(task);

// //TODO: Remove when complete

//       await logTableCount(
//         getCount: () async =>
//             (await _database.select(_database.tasks).get()).length,
//         label: 'after',
//       );

      final createdTask = await (_database.select(_database.tasks)
            ..where((tbl) => tbl.id.equals(params.id!)))
          .getSingleOrNull();
      if (createdTask == null) {
        log('Task not found after insert!');
        throw LocalDatabaseException('Task not found after insert');
      }
      return BaseResponse<TaskModel>(
        data: _taskFromTable(createdTask),
        success: true,
      );
    } catch (e) {
      log('CreateTask error: $e');
      throw LocalDatabaseException(
          'Failed to create task in local database: $e');
    }
  }

  @override
  Future<BaseResponse<TaskModel>> updateTask(UpdateTaskParams params) async {
    try {
      final companion = TasksCompanion(
        id: params.id != null ? Value(params.id!) : const Value.absent(),
        title:
            params.title != null ? Value(params.title!) : const Value.absent(),
        description: params.description != null
            ? Value(params.description!)
            : const Value.absent(),
        dueDate: params.dueDate != null
            ? Value(params.dueDate!)
            : const Value.absent(),
        priority: params.priority != null
            ? Value(params.priority!.name)
            : const Value.absent(),
        status: params.status != null
            ? Value(params.status!.name)
            : const Value.absent(),
        assigneeId: params.assignee?.id != null
            ? Value(params.assignee!.id!)
            : const Value.absent(),
        assigneeUsername: params.assignee?.username != null
            ? Value(params.assignee!.username!)
            : const Value.absent(),
        assigneeEmail: params.assignee?.email != null
            ? Value(params.assignee!.email!)
            : const Value.absent(),
        updatedAt: Value(DateTime.now()),
      );
      await (_database.update(_database.tasks)
            ..where((tbl) => tbl.id.equals(params.id!)))
          .write(companion);
      final updatedTask = await (_database.select(_database.tasks)
            ..where((tbl) => tbl.id.equals(params.id!)))
          .getSingle();
      return BaseResponse<TaskModel>(
        data: _taskFromTable(updatedTask),
        success: true,
      );
    } catch (e) {
      throw LocalDatabaseException(
          'Failed to update task in local database: $e');
    }
  }

  @override
  Future<BaseResponse<void>> deleteTask(String taskId) async {
    try {
      await (_database.delete(_database.tasks)
            ..where((tbl) => tbl.id.equals(taskId)))
          .go();
      return BaseResponse<void>(
        data: null,
        success: true,
      );
    } catch (e) {
      throw LocalDatabaseException(
          'Failed to delete task from local database: $e');
    }
  }

  @override
  Future<BaseResponse<TaskModel?>> getTaskById(String taskId) async {
    try {
      final task = await (_database.select(_database.tasks)
            ..where((tbl) => tbl.id.equals(taskId)))
          .getSingleOrNull();
      if (task == null) {
        return BaseResponse<TaskModel?>(
          data: null,
          success: true,
        );
      }
      return BaseResponse<TaskModel?>(
        data: _taskFromTable(task),
        success: true,
      );
    } catch (e) {
      throw LocalDatabaseException(
          'Failed to get task from local database: $e');
    }
  }

  @override
  Future<void> addDeletedTask(DeleteTaskParams params) async {
    try {
      final task = TasksCompanion(
        id: Value(params.id),
        title: const Value(''),
        description: const Value(''),
        dueDate: const Value(null),
        priority: const Value(null),
        status: const Value(''),
        assigneeId: const Value(null),
        assigneeUsername: const Value(null),
        assigneeEmail: const Value(null),
        createdAt: Value(DateTime.now()),
        updatedAt: Value(DateTime.now()),
      );
      await _database.into(_database.tasks).insert(task);
    } catch (e) {
      throw LocalDatabaseException('Failed to add deleted task: $e');
    }
  }

  @override
  Future<BaseResponse<List<TaskModel>>> getUpcomingTasksForUser(
      UpcomingTasksParams params) async {
    try {
      // Create date range for the given date (start of day to end of day)
      final startOfDay = DateTime(
        params.dueDate.year,
        params.dueDate.month,
        params.dueDate.day,
      );
      final endOfDay = startOfDay.add(const Duration(days: 1));

      // Query by assigneeId only, then filter by date range in memory
      final query = _database.select(_database.tasks)
        ..where((tbl) => tbl.assigneeId.equals(params.userId));

      final tasks = await query.get();

      // Apply date range filter in memory
      final filteredTasks = tasks.where((task) {
        if (task.dueDate == null) return false;
        return task.dueDate!.isAfter(
                startOfDay.subtract(const Duration(microseconds: 1))) &&
            task.dueDate!.isBefore(endOfDay);
      }).toList();

      final models = filteredTasks.map(_taskFromTable).toList();
      return BaseResponse<List<TaskModel>>(
        data: models,
        success: true,
      );
    } catch (e) {
      throw LocalDatabaseException('Failed to get upcoming tasks: $e');
    }
  }

  @override
  Future<void> clearAllTasks() async {
    await _database.delete(_database.tasks).go();
  }

  /// Deletes all tables from the local database. For testing/development only.
  @override
  Future<void> clearAllTables() async {
    await _database.delete(_database.tasks).go();
    await _database.delete(_database.syncRecords).go();
  }

  /// Atomically insert a task and a sync record in a single transaction.
  @override
  Future<BaseResponse<TaskModel>> createTaskWithSync(
    CreateTaskParams params,
    SyncParams syncParams,
  ) async {
    try {
      return await _database.transaction(() async {
        // Insert task
        final task = TasksCompanion.insert(
          id: params.id!,
          title: params.title,
          description: Value(params.description),
          dueDate: Value(params.dueDate),
          priority: Value(params.priority?.name),
          status: params.status.name,
          assigneeId: Value(params.assignee?.id),
          assigneeUsername: Value(params.assignee?.username),
          assigneeEmail: Value(params.assignee?.email),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        );
        await _database.into(_database.tasks).insert(task);
        // Insert sync record
        final record = SyncRecordsCompanion(
          id: Value(syncParams.id),
          recordId: Value(syncParams.recordId),
          feature: Value(syncParams.feature),
          operationType: Value(syncParams.operationType),
          syncStatus: Value(syncParams.syncStatus.name),
          createdAt: Value(syncParams.createdAt),
          updatedAt: Value(syncParams.updatedAt),
          operationParamsJson: Value(syncParams.operationParamsJson == null
              ? null
              : jsonEncode(syncParams.operationParamsJson)),
        );
        await _database.into(_database.syncRecords).insert(record);
        // Return created task
        final createdTask = await (_database.select(_database.tasks)
              ..where((tbl) => tbl.id.equals(params.id!)))
            .getSingleOrNull();
        if (createdTask == null) {
          throw LocalDatabaseException('Task not found after insert');
        }
        return BaseResponse<TaskModel>(
          data: _taskFromTable(createdTask),
          success: true,
        );
      });
    } catch (e) {
      throw LocalDatabaseException(
          'Failed to create task+sync in transaction: $e');
    }
  }

  TaskModel _taskFromTable(Task task) {
    return TaskModel(
      id: task.id,
      title: task.title,
      description: task.description,
      dueDate: task.dueDate,
      priority: task.priority,
      status: task.status,
      assignee: task.assigneeId != null
          ? UserModel(
              id: task.assigneeId!,
              username: task.assigneeUsername,
              email: task.assigneeEmail,
              workspaces: [],
            )
          : null,
      // syncStatus: SyncStatus.needSync.name,
      createdAt: task.createdAt,
      updatedAt: task.updatedAt,
    );
  }
}

// Future<void> logTableCount({
//   required Future<int> Function() getCount,
//   required String label,
// }) async {
//   final count = await getCount();
//   print('Table $label insert: $count');
// }
