import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/features/auth/domain/entities/register_param.dart';
import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';
import 'package:bloc_arch/features/user/domain/params/user_params.dart';
import 'package:bloc_arch/features/workspace/data/models/workspace_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    String? username,
    String? email,
    @JsonKey(
      name: 'workspaces',
      toJson: workspacesToJson,
      fromJson: workspacesFromJson,
    )
    List<WorkspaceModel>? workspaces,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromEntity(UserEntity entity) => UserModel(
        id: entity.id,
        username: entity.username,
        email: entity.email,
        workspaces: entity.workspaces
            ?.map((w) => WorkspaceModel.fromEntity(w))
            .toList(),
      );

  factory UserModel.fromParams(UserParams params) {
    return UserModel(
      id: params.id!,
      username: params.username,
      email: params.email,
      workspaces: [], // Params do not have workspaces
    );
  }
}

extension UserModelExtension on UserModel {
  UserEntity toEntity() => UserEntity(
        id: id,
        username: username.orEmpty(),
        email: email.orEmpty(),
        workspaces: (workspaces?.map((w) => w.toEntity()) ?? []).toList(),
      );
}
