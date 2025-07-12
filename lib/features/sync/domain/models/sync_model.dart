import 'package:bloc_arch/features/sync/domain/params/sync_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sync_model.freezed.dart';
part 'sync_model.g.dart';

class SyncStatusConverter implements JsonConverter<SyncStatus, String> {
  const SyncStatusConverter();
  @override
  SyncStatus fromJson(String json) =>
      SyncStatus.values.firstWhere((e) => e.toString().split('.').last == json);
  @override
  String toJson(SyncStatus object) => object.toString().split('.').last;
}

@freezed
abstract class SyncModel with _$SyncModel {
  const factory SyncModel({
    required String id, // sync op id (UUID)
    required String recordId, // task id
    required String feature, // e.g., 'task'
    required String operationType, // create/update/delete
    // @SyncStatusConverter() required String syncStatus, // needSync, failed, etc.
    required String syncStatus,
    required DateTime createdAt,
    required DateTime? updatedAt,
    @JsonKey(includeIfNull: true) Map<String, dynamic>? operationParamsJson,
  }) = _SyncModel;

  factory SyncModel.fromJson(Map<String, dynamic> json) =>
      _$SyncModelFromJson(json);

  factory SyncModel.fromParams(SyncParams params) {
    return SyncModel(
      id: params.id,
      recordId: params.recordId,
      feature: params.feature,
      operationType: params.operationType,
      syncStatus: params.syncStatus.name,
      createdAt: params.createdAt,
      updatedAt: params.updatedAt,
      operationParamsJson: params.operationParamsJson,
    );
  }
}

extension SyncModelToParams on SyncModel {
  SyncParams toParams() {
    return SyncParams(
      id: id,
      recordId: recordId,
      feature: feature,
      operationType: operationType,
      syncStatus: SyncStatus.values.firstWhere((e) => e.name == syncStatus),
      createdAt: createdAt,
      updatedAt: updatedAt,
      operationParamsJson: operationParamsJson,
    );
  }
}
