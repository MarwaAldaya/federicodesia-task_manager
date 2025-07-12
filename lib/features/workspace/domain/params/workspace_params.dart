import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/workspace/domain/entities/workspace_entity.dart';

part 'workspace_params.freezed.dart';
part 'workspace_params.g.dart';

@freezed
abstract class WorkSpaceParams with _$WorkSpaceParams {
  const factory WorkSpaceParams({
    required String id,
    required String name,
  }) = _WorkSpaceParams;

  factory WorkSpaceParams.fromJson(Map<String, dynamic> json) =>
      _$WorkSpaceParamsFromJson(json);

  const WorkSpaceParams._();

  /// Converts the params to a WorkspaceEntity
  WorkspaceEntity toEntity() {
    return WorkspaceEntity(
      id: id,
      name: name,
    );
  }
}
