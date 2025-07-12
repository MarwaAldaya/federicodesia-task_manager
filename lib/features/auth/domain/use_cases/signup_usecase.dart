import 'package:dartz/dartz.dart';
import 'package:bloc_arch/features/auth/data/models/login_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../../../core/domain/use_cases/usecase.dart';
import '../entities/register_param.dart';
import '../repositories/auth_repository.dart';

@injectable
class SignupUseCase extends UseCase<AuthModel, RegisterParams> {
  final AuthRepository repository;

  SignupUseCase({required this.repository});

  @override
  Future<Either<ErrorHandler, AuthModel>> call(
      {required RegisterParams params}) {
    return repository.signup(params);
  }
}
