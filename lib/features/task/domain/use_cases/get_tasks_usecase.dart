import 'package:dartz/dartz.dart';
import 'package:bloc_arch/core/domain/use_cases/usecase.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/get_tasks_params.dart';
import 'package:bloc_arch/features/task/domain/repository/task_repository.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:injectable/injectable.dart';

/// Use case for getting tasks with optional filtering
///
/// This use case handles the business logic for retrieving tasks from the repository.
/// It can fetch all tasks or apply filters based on the provided parameters.
@injectable
class GetTasksUseCase extends UseCase<List<TaskEntity>, GetTasksParams> {
  final TaskRepository repository;

  GetTasksUseCase({required this.repository});

  @override
  Future<Either<ErrorHandler, List<TaskEntity>>> call({
    required GetTasksParams params,
  }) {
    return repository.getAllTasks(
      filterParams: params.filterParams,
    );
  }
}
