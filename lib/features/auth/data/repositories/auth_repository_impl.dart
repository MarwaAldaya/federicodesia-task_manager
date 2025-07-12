import 'package:dartz/dartz.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:bloc_arch/features/auth/data/remote/source/auth_remote_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_arch/core/data_sources/utils/network/base_network_info.dart';
import '../../domain/entities/login_param.dart';
import '../../domain/entities/register_param.dart';
import '../../domain/repositories/auth_repository.dart';
import '../models/login_model.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<ErrorHandler, AuthModel>> login(LoginParams params) async {
    if (!await networkInfo.isConnected) {
      return left(ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION));
    }
    try {
      final remoteDataSourceResult = await remoteDataSource.login(params);
      return Right(remoteDataSourceResult.data!);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ErrorHandler, AuthModel>> signup(RegisterParams params) async {
    if (!await networkInfo.isConnected) {
      return left(ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION));
    }
    try {
      final remoteDataSourceResult = await remoteDataSource.register(params);
      return Right(remoteDataSourceResult.data!);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ErrorHandler, void>> logout() async {
    if (!await networkInfo.isConnected) {
      return left(ErrorHandler.handle(DataSource.NO_INTERNET_CONNECTION));
    }
    try {
      await remoteDataSource.logout();
      return Right(true);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }
}
