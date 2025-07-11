import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/upcoming_tasks_params.dart';
import 'package:bloc_arch/features/task/domain/repository/task_repository.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetUpcomingTasksUseCase {
  final TaskRepository repository;
  GetUpcomingTasksUseCase(this.repository);

  Future<Either<ErrorHandler, List<TaskEntity>>> call(
      UpcomingTasksParams params) {
    return repository.getUpcomingTasksForUser(params);
  }
}
