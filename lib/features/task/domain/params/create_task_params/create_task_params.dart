import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';

import 'package:bloc_arch/features/user/domain/params/user_params.dart';
import 'package:bloc_arch/features/sync/domain/params/sync_params.dart';

part 'create_task_params.freezed.dart';
part 'create_task_params.g.dart';

@freezed
abstract class CreateTaskParams with _$CreateTaskParams {
  const factory CreateTaskParams({
    String? id,
    required String title,
    String? description,
    DateTime? dueDate,
    TaskPriority? priority,
    required TaskStatus status,
    UserParams? assignee,
  }) = _CreateTaskParams;

  factory CreateTaskParams.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskParamsFromJson(json);

  const CreateTaskParams._();

  /// Converts the params to a Firestore-compatible JSON format
  Map<String, dynamic> toFirestoreJson() {
    final json = <String, dynamic>{};
    if (id != null) json['id'] = id;
    json['title'] = title;
    if (description != null) json['description'] = description;
    if (dueDate != null) json['dueDate'] = dueDate!.toIso8601String();
    if (priority != null) json['priority'] = priority!.name;
    json['status'] = status.name;
    if (assignee != null) {
      // UserModel expects 'name', UserParams has 'username'
      final assigneeJson = assignee!.toJson();
      json['assignee'] = {
        'id': assigneeJson['id'],
        'username': assigneeJson['username'],
        'email': assigneeJson['email'],
        // workspaces omitted (not present in params)
      };
    }
    // syncModel expects id, operationType, syncStatus
    // json['syncModel'] = {
    //   'id': syncParams.id,
    //   'operationType': syncParams.operationType.name,
    //   'syncStatus': syncParams.syncStatus,
    // };
    // Firestore timestamps placeholders
    json['createdAt'] = null;
    json['updatedAt'] = null;
    return json;
  }
}

Map<String, dynamic> _syncParamsToJson(SyncParams params) => params.toJson();
