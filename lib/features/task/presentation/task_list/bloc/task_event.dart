import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';

part 'task_event.freezed.dart';

@freezed
abstract class TaskEvent with _$TaskEvent {
  // Internal event for loading tasks (should only be used within the bloc)
  const factory TaskEvent.loadTasks() = LoadTasks;

  // Public events for UI interactions
  const factory TaskEvent.selectUsers(List<UserEntity> users) = SelectUsers;
  const factory TaskEvent.selectStatuses(List<TaskStatus> statuses) =
      SelectStatuses;
  const factory TaskEvent.selectDate(DateTime? date) = SelectDate;
  const factory TaskEvent.refreshTasks() = RefreshTasks;
  const factory TaskEvent.addTaskLocally(TaskEntity task) = AddTaskLocally;
  const factory TaskEvent.updateTaskLocally(TaskEntity task) =
      UpdateTaskLocally;
  const factory TaskEvent.deleteTask(String taskId) = DeleteTask;
}
