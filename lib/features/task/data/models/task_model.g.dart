// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskModel _$TaskModelFromJson(Map json) => _TaskModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String?,
      dueDate: const TimestampOrStringConverter().fromJson(json['dueDate']),
      priority: json['priority'] as String?,
      status: json['status'] as String,
      assignee: json['assignee'] == null
          ? null
          : UserModel.fromJson(
              Map<String, dynamic>.from(json['assignee'] as Map)),
      createdAt: const TimestampOrStringConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampOrStringConverter().fromJson(json['updatedAt']),
      syncStatus: json['syncStatus'] as String?,
    );

Map<String, dynamic> _$TaskModelToJson(_TaskModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      if (instance.description case final value?) 'description': value,
      if (const TimestampOrStringConverter().toJson(instance.dueDate)
          case final value?)
        'dueDate': value,
      if (instance.priority case final value?) 'priority': value,
      'status': instance.status,
      if (instance.assignee?.toJson() case final value?) 'assignee': value,
      if (const TimestampOrStringConverter().toJson(instance.createdAt)
          case final value?)
        'createdAt': value,
      if (const TimestampOrStringConverter().toJson(instance.updatedAt)
          case final value?)
        'updatedAt': value,
      if (instance.syncStatus case final value?) 'syncStatus': value,
    };
