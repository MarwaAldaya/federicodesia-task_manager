// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskEntity _$TaskEntityFromJson(Map json) => _TaskEntity(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      priority: $enumDecodeNullable(_$TaskPriorityEnumMap, json['priority']),
      status: $enumDecode(_$TaskStatusEnumMap, json['status']),
      assignee: json['assignee'] == null
          ? null
          : UserEntity.fromJson(
              Map<String, dynamic>.from(json['assignee'] as Map)),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      syncStatus: $enumDecodeNullable(_$SyncStatusEnumMap, json['syncStatus']),
    );

Map<String, dynamic> _$TaskEntityToJson(_TaskEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      if (instance.description case final value?) 'description': value,
      if (instance.dueDate?.toIso8601String() case final value?)
        'dueDate': value,
      if (_$TaskPriorityEnumMap[instance.priority] case final value?)
        'priority': value,
      'status': _$TaskStatusEnumMap[instance.status]!,
      if (instance.assignee?.toJson() case final value?) 'assignee': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'createdAt': value,
      if (instance.updatedAt?.toIso8601String() case final value?)
        'updatedAt': value,
      if (_$SyncStatusEnumMap[instance.syncStatus] case final value?)
        'syncStatus': value,
    };

const _$TaskPriorityEnumMap = {
  TaskPriority.low: 'low',
  TaskPriority.medium: 'medium',
  TaskPriority.high: 'high',
};

const _$TaskStatusEnumMap = {
  TaskStatus.todo: 'todo',
  TaskStatus.inProgress: 'inProgress',
  TaskStatus.done: 'done',
};

const _$SyncStatusEnumMap = {
  SyncStatus.needSync: 'needSync',
  SyncStatus.syncing: 'syncing',
  SyncStatus.synced: 'synced',
  SyncStatus.failed: 'failed',
};
