import 'package:dartz/dartz.dart';
import 'package:bloc_arch/core/domain/use_cases/usecase.dart';
import 'package:bloc_arch/features/workspace/domain/entities/workspace_entity.dart';
import 'package:bloc_arch/features/workspace/domain/repositories/workspace_repository.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:injectable/injectable.dart';

/// Use case for getting workspaces for a specific user
///
/// This use case encapsulates the business logic for retrieving workspaces
/// that belong to a specific user from the repository.
@injectable
class GetWorkspacesForUserUseCase
    extends UseCase<List<WorkspaceEntity>, String> {
  final WorkspaceRepository _workspaceRepository;

  GetWorkspacesForUserUseCase(this._workspaceRepository);

  @override
  Future<Either<ErrorHandler, List<WorkspaceEntity>>> call({
    required String params,
  }) {
    return _workspaceRepository.getAllWorkSpacesForUser(params);
  }
}
