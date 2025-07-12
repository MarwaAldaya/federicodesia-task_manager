import 'package:dartz/dartz.dart';
import 'package:bloc_arch/core/domain/use_cases/usecase.dart';
import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';
import 'package:bloc_arch/features/user/domain/repositories/user_repository.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/error_handler.dart';
import 'package:injectable/injectable.dart';

/// Use case for getting all users
///
/// This use case encapsulates the business logic for retrieving all users
/// from the repository. It follows clean architecture principles by keeping
/// business logic separate from data access.
@injectable
class GetAllUsersUseCase extends UseCase<List<UserEntity>, NoParams> {
  final UserRepository _userRepository;

  GetAllUsersUseCase(this._userRepository);

  @override
  Future<Either<ErrorHandler, List<UserEntity>>> call({
    required NoParams params,
  }) {
    return _userRepository.getAllUsers();
  }
}
