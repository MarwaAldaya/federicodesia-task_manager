import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';
import 'package:bloc_arch/features/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/data_sources/utils/network/base_network_info.dart';
import '../../../../core/data_sources/utils/error_handler/error_handler.dart'
    show DataSource;
import '../models/user_model.dart';
import '../remote/source/user_remote_data_source.dart';

/// Implementation of UserRepository with network checking and error handling
///
/// This repository implementation handles network connectivity checks and
/// proper error handling for all user operations.
@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  UserRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<ErrorHandler, List<UserEntity>>> searchUsers(
      String query) async {
    if (!await networkInfo.isConnected) {
      return Left(ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION));
    }
    try {
      final remoteDataSourceResult = await remoteDataSource.searchUsers(query);

      final userEntities =
          remoteDataSourceResult.data!.map((user) => user.toEntity()).toList();
      return Right(userEntities);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ErrorHandler, List<UserEntity>>> getAllUsers() async {
    if (!await networkInfo.isConnected) {
      return Left(ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION));
    }
    try {
      final remoteDataSourceResult = await remoteDataSource.getAllUsers();

      final userEntities =
          remoteDataSourceResult.data!.map((user) => user.toEntity()).toList();
      return Right(userEntities);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }
}
