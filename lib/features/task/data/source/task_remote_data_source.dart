import 'package:bloc_arch/features/task/data/service/task_service.dart';
import 'package:bloc_arch/features/task/data/models/task_model.dart';
import 'package:bloc_arch/features/task/domain/params/create_task_params/create_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/upcoming_tasks_params.dart';
import 'package:bloc_arch/features/task/domain/params/update_task_params/update_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/filter_task_params.dart';
import 'package:bloc_arch/core/data_sources/models/base_response/base_response.dart';
import 'package:injectable/injectable.dart';

abstract class TaskRemoteDataSource {
  Future<BaseResponse<List<TaskModel>>> getAllTasks({
    FilterTaskParams? filterParams,
  });

  Future<BaseResponse<TaskModel>> createTask(CreateTaskParams params);
  Future<BaseResponse<TaskModel>> updateTask(UpdateTaskParams params);
  Future<BaseResponse<void>> deleteTask(String taskId);
  Future<BaseResponse<TaskModel?>> getTaskById(String taskId);
  Future<BaseResponse<List<TaskModel>>> getUpcomingTasksForUser(
      UpcomingTasksParams params);
}

@LazySingleton(as: TaskRemoteDataSource)
class TaskRemoteDataSourceImpl implements TaskRemoteDataSource {
  final TaskService _taskService;

  TaskRemoteDataSourceImpl(this._taskService);

  @override
  Future<BaseResponse<List<TaskModel>>> getAllTasks({
    FilterTaskParams? filterParams,
  }) async {
    return await _taskService.getAllTasks(
      filterParams: filterParams,
    );
  }

  @override
  Future<BaseResponse<TaskModel>> createTask(CreateTaskParams params) async {
    return await _taskService.createTask(params);
  }

  @override
  Future<BaseResponse<TaskModel>> updateTask(UpdateTaskParams params) async {
    return await _taskService.updateTask(params);
  }

  @override
  Future<BaseResponse<void>> deleteTask(String taskId) async {
    return await _taskService.deleteTask(taskId);
  }

  @override
  Future<BaseResponse<TaskModel?>> getTaskById(String taskId) async {
    return await _taskService.getTaskById(taskId);
  }

  @override
  Future<BaseResponse<List<TaskModel>>> getUpcomingTasksForUser(
      UpcomingTasksParams params) async {
    return await _taskService.getUpcomingTasksForUser(params);
  }
}
