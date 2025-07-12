import 'package:dartz/dartz.dart';
import '../../../../core/data_sources/utils/error_handler/error_handler.dart';
import '../../data/models/login_model.dart';
import '../entities/login_param.dart';
import '../entities/register_param.dart';

abstract class AuthRepository {
  Future<Either<ErrorHandler, AuthModel>> login(LoginParams params);

  Future<Either<ErrorHandler, AuthModel>> signup(RegisterParams params);

  Future<Either<ErrorHandler, void>> logout();
}
