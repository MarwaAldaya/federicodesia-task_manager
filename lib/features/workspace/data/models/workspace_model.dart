import 'package:bloc_arch/features/workspace/domain/entities/workspace_entity.dart';
import 'package:bloc_arch/features/workspace/domain/params/workspace_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_model.freezed.dart';
part 'workspace_model.g.dart';

@freezed
abstract class WorkspaceModel with _$WorkspaceModel {
  const factory WorkspaceModel({
    required String id,
    required String name,
  }) = _WorkspaceModel;

  factory WorkspaceModel.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceModelFromJson(json);

  factory WorkspaceModel.fromEntity(WorkspaceEntity entity) => WorkspaceModel(
        id: entity.id,
        name: entity.name,
      );

  factory WorkspaceModel.fromParams(WorkSpaceParams params) => WorkspaceModel(
        id: params.id,
        name: params.name,
      );
}

// Custom serialization functions
List<Map<String, dynamic>>? workspacesToJson(List<WorkspaceModel>? workspaces) {
  return workspaces?.map((w) => w.toJson()).toList();
}

List<WorkspaceModel>? workspacesFromJson(List<dynamic>? json) {
  return json
      ?.map((w) => WorkspaceModel.fromJson(w as Map<String, dynamic>))
      .toList();
}

extension WorkspaceModelExtension on WorkspaceModel {
  WorkspaceEntity toEntity() => WorkspaceEntity(
        id: id,
        name: name,
      );
}
