import 'package:dartz/dartz.dart';
import 'package:bloc_arch/core/domain/use_cases/usecase.dart';
import 'package:bloc_arch/features/auth/data/models/login_model.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../entities/login_param.dart';
import '../repositories/auth_repository.dart';

@injectable
class LoginUseCase extends UseCase<AuthModel, LoginParams> {
  final AuthRepository repository;

  LoginUseCase({required this.repository});

  @override
  Future<Either<ErrorHandler, AuthModel>> call({required LoginParams params}) {
    return repository.login(params);
  }
}
