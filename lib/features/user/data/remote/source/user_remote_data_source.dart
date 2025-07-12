import 'package:bloc_arch/features/user/data/models/user_model.dart';
import 'package:bloc_arch/core/data_sources/models/base_response/base_response.dart';
import 'package:injectable/injectable.dart';
import '../services/user_service.dart';

abstract class UserRemoteDataSource {
  Future<BaseResponse<List<UserModel>>> searchUsers(String query);
  Future<BaseResponse<List<UserModel>>> getAllUsers();
}

@Injectable(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final UserService userService;

  UserRemoteDataSourceImpl({
    required this.userService,
  });

  @override
  Future<BaseResponse<List<UserModel>>> searchUsers(String query) async {
    return await userService.searchUsers(query);
  }

  @override
  Future<BaseResponse<List<UserModel>>> getAllUsers() async {
    return await userService.getAllUsers();
  }
}
