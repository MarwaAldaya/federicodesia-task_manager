import 'package:dartz/dartz.dart';
import 'package:bloc_arch/core/domain/use_cases/usecase.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/features/task/domain/params/update_task_params/update_task_params.dart';
import 'package:bloc_arch/features/task/domain/repository/task_repository.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:injectable/injectable.dart';

/// Use case for updating an existing task
///
/// This use case handles the business logic for updating tasks in the repository.
/// It validates the input parameters and delegates the update to the repository.
@injectable
class UpdateTaskUseCase extends UseCase<TaskEntity, UpdateTaskParams> {
  final TaskRepository repository;

  UpdateTaskUseCase({required this.repository});

  @override
  Future<Either<ErrorHandler, TaskEntity>> call({
    required UpdateTaskParams params,
  }) {
    return repository.updateTask(params);
  }
}
