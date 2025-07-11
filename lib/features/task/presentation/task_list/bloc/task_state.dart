import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/filter_task_params.dart';

part 'task_state.freezed.dart';

enum StateStatus { initial, loading, refreshing, success, failure }

@freezed
abstract class TaskState with _$TaskState {
  const factory TaskState({
    @Default(StateStatus.initial) StateStatus status,
    @Default([]) List<TaskEntity> tasks,
    @Default([]) List<UserEntity> selectedUsers,
    FilterTaskParams? currentFilter,
    String? errorMessage,
  }) = _TaskState;

  const TaskState._();

  bool get isLoading => status == StateStatus.loading;
  bool get isRefreshing => status == StateStatus.refreshing;
  bool get isSuccess => status == StateStatus.success;
  bool get isFailure => status == StateStatus.failure;
}
