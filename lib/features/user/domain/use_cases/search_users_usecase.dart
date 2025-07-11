import 'package:dartz/dartz.dart';
import 'package:bloc_arch/core/domain/use_cases/usecase.dart';
import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';
import 'package:bloc_arch/features/user/domain/repositories/user_repository.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:injectable/injectable.dart';

/// Use case for searching users
///
/// This use case encapsulates the business logic for searching users
/// from the repository based on a query string.
@injectable
class SearchUsersUseCase extends UseCase<List<UserEntity>, String> {
  final UserRepository _userRepository;

  SearchUsersUseCase(this._userRepository);

  @override
  Future<Either<ErrorHandler, List<UserEntity>>> call({
    required String params,
  }) {
    return _userRepository.searchUsers(params);
  }
}
