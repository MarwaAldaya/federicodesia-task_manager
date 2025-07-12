import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_entity.freezed.dart';
part 'sync_entity.g.dart';

@freezed
abstract class SyncEntity with _$SyncEntity {
  const factory SyncEntity({
    required String id, // sync op id (UUID)
    required String recordId, // task id
    required String feature, // e.g., 'task'
    required String operationType, // create/update/delete
    required String syncStatus, // needSync, failed, etc.
    required DateTime createdAt,
    required DateTime? updatedAt,
    @JsonKey(includeIfNull: true) Map<String, dynamic>? operationParamsJson,
  }) = _SyncEntity;

  factory SyncEntity.fromJson(Map<String, dynamic> json) =>
      _$SyncEntityFromJson(json);
}
