import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/task/domain/params/update_task_params/update_task_params.dart';
import 'package:bloc_arch/features/common/enums/enums.dart';

part 'update_task_state.freezed.dart';

@freezed
abstract class UpdateTaskState with _$UpdateTaskState {
  const factory UpdateTaskState({
    @Default(CycleStatus.initial) CycleStatus status,
    required UpdateTaskParams params,
    TaskEntity? taskEntity,
    String? errorMessage,
  }) = _UpdateTaskState;

  factory UpdateTaskState.initial(UpdateTaskParams params) =>
      UpdateTaskState(params: params);

  factory UpdateTaskState.loading(UpdateTaskParams params) =>
      UpdateTaskState(status: CycleStatus.loading, params: params);

  factory UpdateTaskState.success(
          TaskEntity taskEntity, UpdateTaskParams params) =>
      UpdateTaskState(
          status: CycleStatus.success, taskEntity: taskEntity, params: params);

  factory UpdateTaskState.failure(
          UpdateTaskParams params, String errorMessage) =>
      UpdateTaskState(
        status: CycleStatus.failure,
        params: params,
        errorMessage: errorMessage,
      );
}
