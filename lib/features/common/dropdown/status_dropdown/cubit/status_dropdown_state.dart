import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';

part 'status_dropdown_state.freezed.dart';

@freezed
sealed class StatusDropdownState with _$StatusDropdownState {
  const factory StatusDropdownState.initial() = Initial;
  const factory StatusDropdownState.success(List<TaskStatus> statuses) =
      Success;
  const factory StatusDropdownState.failure(String message) = Failure;
}
