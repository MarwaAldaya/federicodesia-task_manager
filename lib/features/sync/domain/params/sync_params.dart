import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/sync/domain/models/sync_model.dart';
import 'package:bloc_arch/features/sync/domain/entities/sync_entity.dart';

part 'sync_params.freezed.dart';
part 'sync_params.g.dart';

enum SyncStatus { needSync, syncing, synced, failed }

class SyncStatusConverter implements JsonConverter<SyncStatus, String> {
  const SyncStatusConverter();
  @override
  SyncStatus fromJson(String json) =>
      SyncStatus.values.firstWhere((e) => e.toString().split('.').last == json);
  @override
  String toJson(SyncStatus object) => object.toString().split('.').last;
}

@freezed
abstract class SyncParams with _$SyncParams {
  const factory SyncParams({
    required String id, // sync op id (UUID)
    required String recordId, // task id
    required String feature, // e.g., FeatureNames.task
    required String operationType, // OperationTypes.create/update/delete
    @SyncStatusConverter()
    required SyncStatus syncStatus, // needSync, failed, etc.
    required DateTime createdAt,
    DateTime? updatedAt,
    @JsonKey(includeIfNull: true) Map<String, dynamic>? operationParamsJson,
  }) = _SyncParams;

  factory SyncParams.fromJson(Map<String, dynamic> json) =>
      _$SyncParamsFromJson(json);
}

extension SyncParamsX on SyncParams {
  SyncModel toModel() => SyncModel(
        id: id,
        recordId: recordId,
        feature: feature,
        operationType: operationType,
        syncStatus: syncStatus.name,
        createdAt: createdAt,
        updatedAt: updatedAt,
        operationParamsJson: operationParamsJson,
      );
  SyncEntity toEntity() => SyncEntity(
        id: id,
        recordId: recordId,
        feature: feature,
        operationType: operationType,
        syncStatus: syncStatus.name,
        createdAt: createdAt,
        updatedAt: updatedAt,
        operationParamsJson: operationParamsJson,
      );
}
