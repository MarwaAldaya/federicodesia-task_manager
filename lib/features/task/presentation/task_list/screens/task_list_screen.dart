import 'package:auto_route/auto_route.dart';
import 'package:bloc_arch/core/widgets/list_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_arch/features/task/presentation/task_list/bloc/task_bloc.dart';
import 'package:bloc_arch/features/task/presentation/task_list/bloc/task_event.dart';
import 'package:bloc_arch/features/task/presentation/task_list/bloc/task_state.dart';
import 'package:bloc_arch/features/task/presentation/task_list/widgets/task_card.dart';
import 'package:bloc_arch/features/common/widgets/filter_date_widget/filter_date_button.dart';
import 'package:bloc_arch/features/common/dropdown/user_dropdown/widgets/multi_user_dropdown.dart';
import 'package:bloc_arch/core/utils/resources/value_manager.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bloc_arch/features/common/dropdown/status_dropdown/widgets/multi_status_dropdown.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/core/utils/routes/app_router.dart';
import 'package:bloc_arch/features/common/widgets/empty_state_widget.dart';
import 'package:bloc_arch/features/common/widgets/confirmation_dialog.dart';
import 'package:bloc_arch/core/utils/toaster.dart';
import 'package:bloc_arch/core/app/app_notification_service.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({super.key});

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  @override
  void initState() {
    super.initState();
    AppNotificationService.scheduleTomorrowTaskSummaryForCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        title: Text(
          LocaleKeys.tasks_title.tr(),
          style: context.textStyles.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: context.colors.primary,
        foregroundColor: context.colors.onPrimary,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final result = await context.router.push(CreateTaskRoute());
              if (result != null && result is TaskEntity) {
                context.read<TaskBloc>().add(TaskEvent.addTaskLocally(result));
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          _buildFilterRow(),
          Expanded(
            child: BlocConsumer<TaskBloc, TaskState>(
              listener: (context, state) {
                if (state.isFailure) {
                  Toaster.showError(
                    context,
                    message:
                        state.errorMessage ?? LocaleKeys.error_occured.tr(),
                  );
                }
              },
              builder: (context, state) {
                if (state.isLoading) {
                  return ListLoading();
                }

                if (state.isFailure) {
                  return EmptyStateWidget.error(
                    title: LocaleKeys.failed_to_load_tasks.tr(),
                    onRetry: () {
                      context.read<TaskBloc>().add(TaskEvent.refreshTasks());
                    },
                  );
                }

                if (state.tasks.isEmpty) {
                  return EmptyStateWidget.tasks(
                    onCreateTask: () async {
                      final result =
                          await context.router.push(CreateTaskRoute());
                      if (result != null && result is TaskEntity) {
                        context
                            .read<TaskBloc>()
                            .add(TaskEvent.addTaskLocally(result));
                      }
                    },
                  );
                }

                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<TaskBloc>().add(TaskEvent.refreshTasks());
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(vertical: AppSize.s8),
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      final task = state.tasks[index];
                      return TaskCard(
                        task: task,
                        onTap: () {
                          // TODO: Navigate to task detail screen
                        },
                        onEdit: () async {
                          final result = await context.router
                              .push(UpdateTaskRoute(task: task));
                          if (result != null && result is TaskEntity) {
                            context
                                .read<TaskBloc>()
                                .add(TaskEvent.updateTaskLocally(result));
                          }
                        },
                        onDelete: () {
                          _showDeleteConfirmation(task.id, task.title);
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _buildUserFilter(),
            _buildStatusFilter(),
            _buildDateFilter(),
          ],
        ),
      ),
    );
  }

  Widget _buildUserFilter() {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          final userHintText =
              HintTextBuilder.buildUserHintText(state.selectedUsers);
          return MultiUserDropdown(
            onUsersSelected: (users) {
              context.read<TaskBloc>().add(TaskEvent.selectUsers(users));
            },
            initiallySelectedUsers: state.selectedUsers,
            hintText: userHintText,
            title: LocaleKeys.assignee.tr(),
          );
        },
      ),
    );
  }

  Widget _buildStatusFilter() {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          final selectedStatuses = state.currentFilter?.statuses ?? [];
          final statusHintText =
              HintTextBuilder.buildStatusHintText(selectedStatuses);
          return MultiStatusDropdown(
            onStatusesSelected: (statuses) {
              context.read<TaskBloc>().add(TaskEvent.selectStatuses(statuses));
            },
            initiallySelectedStatuses: selectedStatuses,
            hintText: statusHintText,
            title: LocaleKeys.status.tr(),
          );
        },
      ),
    );
  }

  Widget _buildDateFilter() {
    return FilterDateButton(
      onDateSelected: (date) {
        context.read<TaskBloc>().add(TaskEvent.selectDate(date));
      },
      onClearFilter: () {
        context.read<TaskBloc>().add(TaskEvent.selectDate(null));
      },
      minWidth: 85.w,
      minWidthWhenSelected: 90.w,
      height: 45.h,
      borderColor: context.colors.outline,
    );
  }

  void _showDeleteConfirmation(String taskId, String taskTitle) {
    showDialog(
      context: context,
      builder: (dialogContext) => ConfirmationDialog.delete(
        itemName: taskTitle,
        onDelete: () {
          context.read<TaskBloc>().add(TaskEvent.deleteTask(taskId));
        },
      ),
    );
  }
}
