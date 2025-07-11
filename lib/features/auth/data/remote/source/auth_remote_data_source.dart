import 'package:bloc_arch/features/auth/data/models/login_model.dart';

import 'package:bloc_arch/features/auth/domain/entities/login_param.dart';

import 'package:bloc_arch/features/auth/domain/entities/register_param.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/data_sources/models/base_response/base_response.dart';
import '../services/auth_service.dart';

abstract class AuthRemoteDataSource {
  Future<BaseResponse<AuthModel>> login(LoginParams params);

  Future<BaseResponse<AuthModel>> register(RegisterParams params);

  Future<BaseResponse<void>> logout();
}

@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthService _service;

  const AuthRemoteDataSourceImpl(this._service);

  @override
  Future<BaseResponse<AuthModel>> login(LoginParams params) async {
    return await _service.login(params);
  }

  @override
  Future<BaseResponse<AuthModel>> register(RegisterParams params) async {
    return await _service.register(params);
  }

  @override
  Future<BaseResponse<void>> logout() async {
    return await _service.logout();
  }
}
