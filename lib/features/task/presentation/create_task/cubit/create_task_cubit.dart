import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_arch/features/task/domain/use_cases/create_task_usecase.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';

import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'create_task_state.dart';

/// Cubit for managing task creation state and business logic
///
/// This cubit handles the UI state for creating tasks, including form validation,
/// field updates, and task submission using the CreateTaskUseCase.
@injectable
class CreateTaskCubit extends Cubit<CreateTaskState> {
  final CreateTaskUseCase _createTaskUseCase;

  CreateTaskCubit(this._createTaskUseCase) : super(CreateTaskState.initial());

  // Form controllers
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  /// Updates the due date field
  void updateDueDate(DateTime? dueDate) {
    final updatedParams = state.params.copyWith(dueDate: dueDate);
    emit(state.copyWith(params: updatedParams));
  }

  /// Updates the priority field
  void updatePriority(TaskPriority? priority) {
    final updatedParams = state.params.copyWith(priority: priority);
    emit(state.copyWith(params: updatedParams));
  }

  /// Clears the priority field
  void clearPriority() {
    final updatedParams = state.params.copyWith(priority: null);
    emit(state.copyWith(params: updatedParams));
  }

  /// Updates the status field
  void updateStatus(TaskStatus? status) {
    if (status != null) {
      final updatedParams = state.params.copyWith(status: status);
      emit(state.copyWith(params: updatedParams));
    }
  }

  /// Clears the status field (sets to default todo)
  void clearStatus() {
    final updatedParams = state.params.copyWith(status: TaskStatus.todo);
    emit(state.copyWith(params: updatedParams));
  }

  /// Updates the assignee field - converts UserEntity to UserParams
  void updateAssignee(UserEntity? assignee) {
    final userParams = assignee?.toParams();
    final updatedParams = state.params.copyWith(assignee: userParams);
    emit(state.copyWith(params: updatedParams));
  }

  /// Clears the assignee field
  void clearAssignee() {
    final updatedParams = state.params.copyWith(assignee: null);
    emit(state.copyWith(params: updatedParams));
  }

  /// Validates the form and submits if valid
  Future<TaskEntity?> submit() async {
    if (!_validateForm()) {
      return null;
    }

    try {
      // Update state with form values
      final updatedParams = state.params.copyWith(
          title: titleController.text.trim(),
          description: descriptionController.text.trim().isEmpty
              ? null
              : descriptionController.text.trim());

      emit(CreateTaskState.loading(updatedParams));

      // Create the task using the use case
      final result = await _createTaskUseCase(params: updatedParams);

      return result.fold(
        (error) {
          emit(CreateTaskState.failure(state.params,
              error.failure.message ?? LocaleKeys.unknown_error.tr()));
          return null;
        },
        (createdTask) {
          emit(CreateTaskState.success(createdTask, updatedParams));
          return createdTask;
        },
      );
    } catch (e) {
      emit(CreateTaskState.failure(state.params, e.toString()));
      return null;
    }
  }

  /// Validates the form fields
  bool _validateForm() {
    if (!(formKey.currentState?.validate() ?? false)) {
      return false;
    }

    // Validate priority is selected
    if (state.params.status == null) {
      emit(CreateTaskState.failure(
          state.params, LocaleKeys.status_required.tr()));
      return false;
    }

    return true;
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    return super.close();
  }

  /// Converts UserParams to UserEntity for UI widgets
  UserEntity? getAssigneeEntity() {
    return state.params.assignee?.toEntity();
  }
}
