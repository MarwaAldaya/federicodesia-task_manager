import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/workspace/domain/entities/workspace_entity.dart';
import 'package:bloc_arch/features/user/domain/params/user_params.dart';
import 'package:bloc_arch/features/workspace/domain/params/workspace_params.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String id,
    required String username,
    required String email,
    List<WorkspaceEntity>? workspaces,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  const UserEntity._();

  UserParams toParams() {
    return UserParams(
      id: id,
      username: username,
      email: email,
    );
  }
}
