import 'package:dartz/dartz.dart';
import 'package:bloc_arch/core/domain/use_cases/usecase.dart';
import 'package:bloc_arch/features/task/domain/params/delete_task_params/delete_task_params.dart';
import 'package:bloc_arch/features/task/domain/repository/task_repository.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:injectable/injectable.dart';

/// Use case for deleting a task
///
/// This use case handles the business logic for deleting tasks from the repository.
/// It validates the task ID and delegates the deletion to the repository.
@injectable
class DeleteTaskUseCase extends UseCase<void, DeleteTaskParams> {
  final TaskRepository repository;

  DeleteTaskUseCase({required this.repository});

  @override
  Future<Either<ErrorHandler, void>> call({
    required DeleteTaskParams params,
  }) {
    return repository.deleteTask(params.id);
  }
}
