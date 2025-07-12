import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/workspace/domain/params/workspace_params.dart';

part 'workspace_entity.freezed.dart';
part 'workspace_entity.g.dart';

@freezed
abstract class WorkspaceEntity with _$WorkspaceEntity {
  const factory WorkspaceEntity({
    required String id,
    required String name,
  }) = _WorkspaceEntity;

  factory WorkspaceEntity.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceEntityFromJson(json);
}
