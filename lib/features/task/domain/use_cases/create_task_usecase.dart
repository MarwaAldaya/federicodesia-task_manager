import 'package:dartz/dartz.dart';
import 'package:bloc_arch/core/domain/use_cases/usecase.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/features/task/domain/params/create_task_params/create_task_params.dart';
import 'package:bloc_arch/features/task/domain/repository/task_repository.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:injectable/injectable.dart';

/// Use case for creating a new task
///
/// This use case handles the business logic for creating tasks in the repository.
/// It validates the input parameters and delegates the creation to the repository.
@injectable
class CreateTaskUseCase extends UseCase<TaskEntity, CreateTaskParams> {
  final TaskRepository repository;

  CreateTaskUseCase({required this.repository});

  @override
  Future<Either<ErrorHandler, TaskEntity>> call({
    required CreateTaskParams params,
  }) {
    return repository.createTask(params);
  }
}
