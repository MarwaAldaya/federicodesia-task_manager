import 'package:dartz/dartz.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/features/task/domain/params/create_task_params/create_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/update_task_params/update_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/filter_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/upcoming_tasks_params.dart';

abstract class TaskRepository {
  Future<Either<ErrorHandler, List<TaskEntity>>> getAllTasks({
    FilterTaskParams? filterParams,
  });

  Future<Either<ErrorHandler, TaskEntity>> createTask(CreateTaskParams params);
  Future<Either<ErrorHandler, TaskEntity>> updateTask(UpdateTaskParams params);
  Future<Either<ErrorHandler, void>> deleteTask(String taskId);
  Future<Either<ErrorHandler, TaskEntity?>> getTaskById(String taskId);
  Future<Either<ErrorHandler, List<TaskEntity>>> getUpcomingTasksForUser(
      UpcomingTasksParams params);
}
