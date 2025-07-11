import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/features/user/domain/params/user_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_task_params.freezed.dart';
part 'update_task_params.g.dart';

@freezed
abstract class UpdateTaskParams with _$UpdateTaskParams {
  const factory UpdateTaskParams({
    required String id,
    required String title,
    String? description,
    DateTime? dueDate,
    TaskPriority? priority,
    required TaskStatus status,
    UserParams? assignee,
    required DateTime updatedAt,
  }) = _UpdateTaskParams;

  factory UpdateTaskParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskParamsFromJson(json);
}

extension UpdateTaskParamsFirestore on UpdateTaskParams {
  /// Converts the params to a Firestore-compatible JSON format for updates
  Map<String, dynamic> toFirestoreJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    if (description != null) json['description'] = description;
    if (dueDate != null) json['dueDate'] = dueDate!.toIso8601String();
    if (priority != null) json['priority'] = priority!.name;
    json['status'] = status.name;
    if (assignee != null) {
      final assigneeJson = <String, dynamic>{};
      if (assignee!.id != null) assigneeJson['id'] = assignee!.id;
      if (assignee!.username != null)
        assigneeJson['username'] = assignee!.username;
      if (assignee!.email != null) assigneeJson['email'] = assignee!.email;
      // workspaces omitted (not present in params)
      json['assignee'] = assigneeJson;
    }
    json['updatedAt'] = updatedAt.toIso8601String();
    return json;
  }
}
