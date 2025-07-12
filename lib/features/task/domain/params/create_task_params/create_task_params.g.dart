// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateTaskParams _$CreateTaskParamsFromJson(Map json) => _CreateTaskParams(
      id: json['id'] as String?,
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
    );

Map<String, dynamic> _$CreateTaskParamsToJson(_CreateTaskParams instance) =>
    <String, dynamic>{
      if (instance.id case final value?) 'id': value,
      'title': instance.title,
      if (instance.description case final value?) 'description': value,
      if (instance.dueDate?.toIso8601String() case final value?)
        'dueDate': value,
      if (_$TaskPriorityEnumMap[instance.priority] case final value?)
        'priority': value,
      'status': _$TaskStatusEnumMap[instance.status]!,
      if (instance.assignee?.toJson() case final value?) 'assignee': value,
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
