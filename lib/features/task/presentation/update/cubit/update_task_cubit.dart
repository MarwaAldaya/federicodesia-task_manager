import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_arch/features/task/domain/use_cases/update_task_usecase.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';

import 'package:bloc_arch/features/task/domain/params/update_task_params/update_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/create_task_params/create_task_params.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'update_task_state.dart';

/// Cubit for managing task update state and business logic
///
/// This cubit handles the UI state for updating tasks, including form validation,
/// field updates, and task submission using the UpdateTaskUseCase.
@injectable
class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  final UpdateTaskUseCase _updateTaskUseCase;

  UpdateTaskCubit(this._updateTaskUseCase)
      : super(UpdateTaskState.initial(UpdateTaskParams(
          id: '',
          title: '',
          status: TaskStatus.todo,
          updatedAt: DateTime(2000, 1, 1),
        )));

  // Form controllers
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  /// Initialize the cubit with task data
  void initializeWithTask(TaskEntity task) {
    titleController.text = task.title;
    descriptionController.text = task.description ?? '';

    final updateParams = UpdateTaskParams(
      id: task.id,
      title: task.title,
      status: task.status ?? TaskStatus.todo,
      updatedAt: task.updatedAt ?? DateTime(2000, 1, 1),
      description: task.description,
      dueDate: task.dueDate,
      priority: task.priority,
      assignee: task.assignee?.toParams(),
    );
    emit(UpdateTaskState.initial(updateParams));
  }

  /// Updates the due date field
  void updateDueDate(DateTime? dueDate) {
    emit(state.copyWith(params: state.params.copyWith(dueDate: dueDate)));
  }

  /// Updates the priority field
  void updatePriority(TaskPriority? priority) {
    emit(state.copyWith(params: state.params.copyWith(priority: priority)));
  }

  /// Clears the priority field
  void clearPriority() {
    emit(state.copyWith(params: state.params.copyWith(priority: null)));
  }

  /// Updates the status field
  void updateStatus(TaskStatus? status) {
    if (status != null) {
      emit(state.copyWith(params: state.params.copyWith(status: status)));
    }
  }

  /// Clears the status field (sets to default todo)
  void clearStatus() {
    emit(
        state.copyWith(params: state.params.copyWith(status: TaskStatus.todo)));
  }

  /// Updates the assignee field - converts UserEntity to UserParams
  void updateAssignee(UserEntity? assignee) {
    final userParams = assignee?.toParams();
    emit(state.copyWith(params: state.params.copyWith(assignee: userParams)));
  }

  /// Clears the assignee field
  void clearAssignee() {
    emit(state.copyWith(params: state.params.copyWith(assignee: null)));
  }

  /// Validates the form and submits if valid
  Future<TaskEntity?> submit() async {
    if (!_validateForm()) {
      return null;
    }
    try {
      final updatedParams = state.params.copyWith(
        title: titleController.text.trim(),
        description: descriptionController.text.trim().isEmpty
            ? null
            : descriptionController.text.trim(),
        updatedAt: DateTime.now(),
      );
      emit(UpdateTaskState.loading(updatedParams));
      final result = await _updateTaskUseCase(params: updatedParams);
      return result.fold(
        (error) {
          emit(UpdateTaskState.failure(state.params,
              error.failure.message ?? LocaleKeys.unknown_error.tr()));
          return null;
        },
        (updatedTask) {
          emit(UpdateTaskState.success(updatedTask, updatedParams));
          return updatedTask;
        },
      );
    } catch (e) {
      emit(UpdateTaskState.failure(state.params, e.toString()));
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
      emit(UpdateTaskState.failure(
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
