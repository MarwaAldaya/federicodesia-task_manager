// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncParams _$SyncParamsFromJson(Map json) => _SyncParams(
      id: json['id'] as String,
      recordId: json['recordId'] as String,
      feature: json['feature'] as String,
      operationType: json['operationType'] as String,
      syncStatus:
          const SyncStatusConverter().fromJson(json['syncStatus'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      operationParamsJson: (json['operationParamsJson'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e),
      ),
    );

Map<String, dynamic> _$SyncParamsToJson(_SyncParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordId': instance.recordId,
      'feature': instance.feature,
      'operationType': instance.operationType,
      'syncStatus': const SyncStatusConverter().toJson(instance.syncStatus),
      'createdAt': instance.createdAt.toIso8601String(),
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updatedAt': value,
      'operationParamsJson': instance.operationParamsJson,
    };
