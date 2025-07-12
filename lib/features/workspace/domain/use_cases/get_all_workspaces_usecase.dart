import 'package:dartz/dartz.dart';
import 'package:bloc_arch/core/domain/use_cases/usecase.dart';
import 'package:bloc_arch/features/workspace/domain/entities/workspace_entity.dart';
import 'package:bloc_arch/features/workspace/domain/repositories/workspace_repository.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:injectable/injectable.dart';

/// Use case for getting all workspaces
///
/// This use case encapsulates the business logic for retrieving all workspaces
/// from the repository. It follows clean architecture principles by keeping
/// business logic separate from data access.
@injectable
class GetAllWorkspacesUseCase extends UseCase<List<WorkspaceEntity>, NoParams> {
  final WorkspaceRepository _workspaceRepository;

  GetAllWorkspacesUseCase(this._workspaceRepository);

  @override
  Future<Either<ErrorHandler, List<WorkspaceEntity>>> call({
    required NoParams params,
  }) {
    return _workspaceRepository.getAllWorkSpaces();
  }
}
