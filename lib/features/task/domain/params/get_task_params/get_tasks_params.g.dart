// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tasks_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetTasksParams _$GetTasksParamsFromJson(Map json) => _GetTasksParams(
      filterParams: json['filterParams'] == null
          ? null
          : FilterTaskParams.fromJson(
              Map<String, dynamic>.from(json['filterParams'] as Map)),
    );

Map<String, dynamic> _$GetTasksParamsToJson(_GetTasksParams instance) =>
    <String, dynamic>{
      if (instance.filterParams?.toJson() case final value?)
        'filterParams': value,
    };
