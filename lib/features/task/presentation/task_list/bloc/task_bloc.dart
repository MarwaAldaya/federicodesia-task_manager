import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_arch/features/task/domain/use_cases/get_tasks_usecase.dart';
import 'package:bloc_arch/features/task/domain/use_cases/delete_task_usecase.dart';
import 'package:bloc_arch/features/task/presentation/task_list/bloc/task_state.dart';
import 'package:bloc_arch/features/task/presentation/task_list/bloc/task_event.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/filter_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/get_tasks_params.dart';
import 'package:bloc_arch/features/task/domain/params/delete_task_params/delete_task_params.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';

/// Bloc for managing task list state and business logic
///
/// This bloc handles the UI state for task lists, including loading tasks,
/// filtering, and task operations using the appropriate use cases.
@injectable
class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final GetTasksUseCase _getTasksUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;

  TaskBloc(
    this._getTasksUseCase,
    this._deleteTaskUseCase,
  ) : super(TaskState(status: StateStatus.initial)) {
    on<LoadTasks>(_onLoadTasks);
    on<SelectUsers>(_onSelectUsers);
    on<SelectStatuses>(_onSelectStatuses);
    on<SelectDate>(_onSelectDate);
    on<RefreshTasks>(_onRefreshTasks);
    on<AddTaskLocally>(_onAddTaskLocally);
    on<UpdateTaskLocally>(_onUpdateTaskLocally);
    on<DeleteTask>(_onDeleteTask);

    // Load initial tasks using internal event
    add(const TaskEvent.loadTasks());
  }

  /// Internal event handler for loading tasks with current filter parameters
  Future<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    try {
      emit(state.copyWith(status: StateStatus.loading));

      final params = GetTasksParams(filterParams: state.currentFilter);
      final result = await _getTasksUseCase(params: params);

      result.fold(
        (error) {
          emit(state.copyWith(
            status: StateStatus.failure,
            errorMessage:
                error.failure.message ?? LocaleKeys.failed_to_load_tasks.tr(),
          ));
        },
        (tasks) {
          emit(state.copyWith(
            status: StateStatus.success,
            tasks: tasks,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: StateStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }

  void _onSelectUsers(SelectUsers event, Emitter<TaskState> emit) {
    // Update selected users in state
    emit(state.copyWith(selectedUsers: event.users));

    // Create new filter params with updated users
    final filterParams = FilterTaskParams(
      dueDate: state.currentFilter?.dueDate,
      userIds: event.users.isNotEmpty
          ? event.users.map((user) => user.id).toList()
          : null,
      statuses: state.currentFilter?.statuses,
    );

    // Update current filter and load tasks using internal event
    emit(state.copyWith(currentFilter: filterParams));
    add(const TaskEvent.loadTasks());
  }

  void _onSelectStatuses(SelectStatuses event, Emitter<TaskState> emit) {
    // Create new filter params with updated statuses
    final filterParams = FilterTaskParams(
      dueDate: state.currentFilter?.dueDate,
      userIds: state.currentFilter?.userIds,
      statuses: event.statuses.isNotEmpty ? event.statuses : null,
    );

    // Update current filter and load tasks using internal event
    emit(state.copyWith(currentFilter: filterParams));
    add(const TaskEvent.loadTasks());
  }

  void _onSelectDate(SelectDate event, Emitter<TaskState> emit) {
    // Create new filter params with updated date
    final filterParams = FilterTaskParams(
      dueDate: event.date,
      userIds: state.currentFilter?.userIds,
      statuses: state.currentFilter?.statuses,
    );

    // Update current filter and load tasks using internal event
    emit(state.copyWith(currentFilter: filterParams));
    add(const TaskEvent.loadTasks());
  }

  void _onRefreshTasks(RefreshTasks event, Emitter<TaskState> emit) {
    // Load tasks using internal event to preserve current filters
    add(const TaskEvent.loadTasks());
  }

  void _onAddTaskLocally(AddTaskLocally event, Emitter<TaskState> emit) {
    // Add the task directly to the list without making a network request
    emit(state.copyWith(
      status: StateStatus.success,
      tasks: [event.task, ...state.tasks],
    ));
  }

  void _onUpdateTaskLocally(UpdateTaskLocally event, Emitter<TaskState> emit) {
    final updatedTasks = state.tasks.map((task) {
      return task.id == event.task.id ? event.task : task;
    }).toList();
    emit(state.copyWith(
      status: StateStatus.success,
      tasks: updatedTasks,
    ));
  }

  Future<void> _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    try {
      emit(state.copyWith(status: StateStatus.loading));

      // Only pass the taskId to the use case. The repository will handle syncParams.
      final result = await _deleteTaskUseCase(
          params: DeleteTaskParams(
        id: event.taskId,
      ));

      result.fold(
        (error) {
          emit(state.copyWith(
            status: StateStatus.failure,
            errorMessage:
                error.failure.message ?? LocaleKeys.failed_to_load_tasks.tr(),
          ));
        },
        (_) {
          final updatedTasks =
              state.tasks.where((task) => task.id != event.taskId).toList();

          emit(state.copyWith(
            status: StateStatus.success,
            tasks: updatedTasks,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        status: StateStatus.failure,
        errorMessage: e.toString(),
      ));
    }
  }
}
