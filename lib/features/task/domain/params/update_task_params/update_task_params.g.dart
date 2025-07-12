// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_task_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateTaskParams _$UpdateTaskParamsFromJson(Map json) => _UpdateTaskParams(
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
          : UserParams.fromJson(
              Map<String, dynamic>.from(json['assignee'] as Map)),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$UpdateTaskParamsToJson(_UpdateTaskParams instance) =>
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
      'updatedAt': instance.updatedAt.toIso8601String(),
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
