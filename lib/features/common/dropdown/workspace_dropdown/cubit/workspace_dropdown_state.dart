import 'package:bloc_arch/features/workspace/domain/entities/workspace_entity.dart';
import 'package:bloc_arch/core/domain/entities/failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workspace_dropdown_state.freezed.dart';

enum WorkspaceDropdownStatus {
  initial,
  loading,
  success,
  error,
  requiredFieldError,
}

@freezed
abstract class WorkspaceDropdownState with _$WorkspaceDropdownState {
  const factory WorkspaceDropdownState({
    @Default([]) List<WorkspaceEntity> allWorkspaces,
    @Default([]) List<String> items,
    @Default('') String selectedWorkspaceId,
    @Default(WorkspaceDropdownStatus.initial) WorkspaceDropdownStatus status,
    Failure? failure,
  }) = _WorkspaceDropdownState;

  const WorkspaceDropdownState._();

  bool get isLoading => status == WorkspaceDropdownStatus.loading;
  bool get isSuccess => status == WorkspaceDropdownStatus.success;
  bool get isError => status == WorkspaceDropdownStatus.error;
  bool get isRequiredFieldError =>
      status == WorkspaceDropdownStatus.requiredFieldError;
  bool get isInitial => status == WorkspaceDropdownStatus.initial;
}
