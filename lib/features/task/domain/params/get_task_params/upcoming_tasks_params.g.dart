// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_tasks_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpcomingTasksParams _$UpcomingTasksParamsFromJson(Map json) =>
    _UpcomingTasksParams(
      userId: json['userId'] as String,
      dueDate: DateTime.parse(json['dueDate'] as String),
    );

Map<String, dynamic> _$UpcomingTasksParamsToJson(
        _UpcomingTasksParams instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'dueDate': instance.dueDate.toIso8601String(),
    };
