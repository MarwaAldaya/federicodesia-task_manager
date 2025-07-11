import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<ErrorHandler, List<UserEntity>>> searchUsers(String query);
  Future<Either<ErrorHandler, List<UserEntity>>> getAllUsers();
}
