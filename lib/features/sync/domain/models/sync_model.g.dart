// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sync_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SyncModel _$SyncModelFromJson(Map json) => _SyncModel(
      id: json['id'] as String,
      recordId: json['recordId'] as String,
      feature: json['feature'] as String,
      operationType: json['operationType'] as String,
      syncStatus: json['syncStatus'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      operationParamsJson: (json['operationParamsJson'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e),
      ),
    );

Map<String, dynamic> _$SyncModelToJson(_SyncModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'recordId': instance.recordId,
      'feature': instance.feature,
      'operationType': instance.operationType,
      'syncStatus': instance.syncStatus,
      'createdAt': instance.createdAt.toIso8601String(),
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updatedAt': value,
      'operationParamsJson': instance.operationParamsJson,
    };
