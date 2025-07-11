import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/workspace/domain/params/workspace_params.dart';
import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';

part 'user_params.freezed.dart';
part 'user_params.g.dart';

@freezed
abstract class UserParams with _$UserParams {
  const factory UserParams({
    required String id,
    required String username,
    required String? email,
  }) = _UserParams;

  factory UserParams.fromJson(Map<String, dynamic> json) =>
      _$UserParamsFromJson(json);

  const UserParams._();

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      email: email ?? '',
      workspaces: [],
    );
  }
}
