import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:bloc_arch/features/workspace/domain/entities/workspace_entity.dart';
import 'package:dartz/dartz.dart';

abstract class WorkspaceRepository {
  Future<Either<ErrorHandler, List<WorkspaceEntity>>> searchWorkSpace(
      String query);
  Future<Either<ErrorHandler, List<WorkspaceEntity>>> getAllWorkSpaces();
  Future<Either<ErrorHandler, List<WorkspaceEntity>>> getAllWorkSpacesForUser(
      String email);
}
