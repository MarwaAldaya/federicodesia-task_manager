import 'package:bloc_arch/core/data_sources/utils/custom_date_converter.dart';
import 'package:bloc_arch/features/sync/domain/params/sync_params.dart';
import 'package:bloc_arch/features/user/data/models/user_model.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'task_model.freezed.dart';
part 'task_model.g.dart';

@freezed
abstract class TaskModel with _$TaskModel {
  const factory TaskModel({
    required String id,
    required String title,
    String? description,
    @TimestampOrStringConverter() DateTime? dueDate,
    String? priority,
    required String status,
    UserModel? assignee,
    @TimestampOrStringConverter() DateTime? createdAt,
    @TimestampOrStringConverter() DateTime? updatedAt,
    String? syncStatus,
    // Remove syncModel
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  factory TaskModel.fromParams(dynamic params) {
    return TaskModel(
      id: params.id,
      title: params.title,
      description: params.description,
      dueDate: params.dueDate,
      priority: params.priority?.name,
      status: params.status.name,
      assignee: params.assignee != null
          ? UserModel.fromParams(params.assignee)
          : null,
      createdAt: params.createdAt ?? DateTime.now(),
      updatedAt: params.updatedAt ?? DateTime.now(),
      syncStatus: null,
    );
  }
}

extension TaskModelExtension on TaskModel {
  TaskEntity toEntity() => TaskEntity(
        id: id,
        title: title,
        description: description,
        dueDate: dueDate,
        priority: priority != null
            ? TaskPriority.values.firstWhere((e) => e.name == priority)
            : null,
        status: TaskStatus.values.firstWhere((e) => e.name == status),
        assignee: assignee?.toEntity(),
        syncStatus: syncStatus != null
            ? SyncStatus.values.firstWhere((e) => e.name == syncStatus)
            : null,
        createdAt: _timestampFromJson(createdAt),
        updatedAt: _timestampFromJson(updatedAt),
      );
}

// Helper functions to convert between Firestore Timestamp and DateTime
DateTime? _timestampFromJson(dynamic timestamp) {
  if (timestamp == null) return null;
  if (timestamp is Timestamp) {
    return timestamp.toDate();
  }
  if (timestamp is String) {
    return DateTime.parse(timestamp);
  }
  return null;
}
