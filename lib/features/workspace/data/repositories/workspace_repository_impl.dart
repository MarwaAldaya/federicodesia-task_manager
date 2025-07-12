import 'package:bloc_arch/features/workspace/data/models/workspace_model.dart';
import 'package:bloc_arch/features/workspace/data/remote/source/workspace_remote_data_source.dart';
import 'package:bloc_arch/features/workspace/domain/entities/workspace_entity.dart';
import 'package:bloc_arch/features/workspace/domain/repositories/workspace_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/data_sources/utils/network/base_network_info.dart';
import '../../../../core/data_sources/utils/error_handler/error_handler.dart'
    show DataSource;

/// Implementation of WorkspaceRepository with network checking and error handling
///
/// This repository implementation handles network connectivity checks and
/// proper error handling for all workspace operations.
@Injectable(as: WorkspaceRepository)
class WorkSpaceRepositoryImpl implements WorkspaceRepository {
  final WorkSpaceRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  WorkSpaceRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<ErrorHandler, List<WorkspaceEntity>>> searchWorkSpace(
      String query) async {
    if (!await networkInfo.isConnected) {
      return Left(ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION));
    }
    try {
      final remoteDataSourceResult =
          await remoteDataSource.searchWorkSpace(query);

      final workspaceEntities = remoteDataSourceResult.data!
          .map((workspace) => workspace.toEntity())
          .toList();
      return Right(workspaceEntities);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ErrorHandler, List<WorkspaceEntity>>> getAllWorkSpaces() async {
    if (!await networkInfo.isConnected) {
      return Left(ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION));
    }
    try {
      final remoteDataSourceResult = await remoteDataSource.getAllWorkSpaces();

      final workspaceEntities = remoteDataSourceResult.data!
          .map((workspace) => workspace.toEntity())
          .toList();
      return Right(workspaceEntities);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ErrorHandler, List<WorkspaceEntity>>> getAllWorkSpacesForUser(
      String email) async {
    if (!await networkInfo.isConnected) {
      return Left(ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION));
    }
    try {
      final remoteDataSourceResult =
          await remoteDataSource.getAllWorkSpacesForUser(email);

      final workspaceEntities = remoteDataSourceResult.data!
          .map((workspace) => workspace.toEntity())
          .toList();
      return Right(workspaceEntities);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
