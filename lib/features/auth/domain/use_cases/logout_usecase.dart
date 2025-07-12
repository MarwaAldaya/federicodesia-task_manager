import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/domain/use_cases/usecase.dart';
import '../repositories/auth_repository.dart';

@injectable
class LogoutUseCase extends UseCase<void, NoParams> {
  final AuthRepository repository;

  LogoutUseCase({required this.repository});

  @override
  Future<Either<ErrorHandler, void>> call({required NoParams params}) {
    return repository.logout();
  }
}
