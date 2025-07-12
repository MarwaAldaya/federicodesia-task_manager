import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/task/domain/params/create_task_params/create_task_params.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/features/common/enums/enums.dart';

part 'create_task_state.freezed.dart';

@freezed
sealed class CreateTaskState with _$CreateTaskState {
  const factory CreateTaskState({
    required CycleStatus status,
    required CreateTaskParams params,
    TaskEntity? taskEntity,
    String? errorMessage,
  }) = _CreateTaskState;

  factory CreateTaskState.initial() => CreateTaskState(
        status: CycleStatus.initial,
        params: CreateTaskParams(
          title: '',
          description: '',
          dueDate: null,
          priority: null,
          status: TaskStatus.todo,
          assignee: null,
        ),
      );

  factory CreateTaskState.loading(CreateTaskParams params) => CreateTaskState(
        status: CycleStatus.loading,
        params: params,
      );

  factory CreateTaskState.success(TaskEntity task, CreateTaskParams params) =>
      CreateTaskState(
          status: CycleStatus.success, taskEntity: task, params: params);

  factory CreateTaskState.failure(
          CreateTaskParams params, String errorMessage) =>
      CreateTaskState(
        status: CycleStatus.failure,
        params: params,
        errorMessage: errorMessage,
      );
}
