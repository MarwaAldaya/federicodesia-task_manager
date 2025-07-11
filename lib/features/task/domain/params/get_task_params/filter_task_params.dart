import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';

class FilterTaskParams {
  final List<String>? userIds;
  final List<TaskStatus>? statuses;
  final DateTime? dueDate;

  FilterTaskParams({
    this.userIds,
    this.statuses,
    this.dueDate,
  });

  factory FilterTaskParams.fromJson(Map<String, dynamic> json) =>
      FilterTaskParams(
        userIds: (json['userIds'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
        statuses: (json['statuses'] as List<dynamic>?)
            ?.map((e) => TaskStatus.values.firstWhere((s) => s.name == e))
            .toList(),
        dueDate: json['dueDate'] != null
            ? DateTime.parse(json['dueDate'] as String)
            : null,
      );

  Map<String, dynamic> toJson() => {
        'userIds': userIds,
        'statuses': statuses?.map((e) => e.name).toList(),
        'dueDate': dueDate?.toIso8601String(),
      };
}
