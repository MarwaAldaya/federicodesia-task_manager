import 'package:auto_route/auto_route.dart';
import 'package:bloc_arch/core/utils/text_fields_validation.dart';
import 'package:bloc_arch/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bloc_arch/core/app/injectable_config.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:bloc_arch/features/common/text_fields/custom_text_field.dart';
import 'package:bloc_arch/features/common/button/custom_elevated_button.dart';
import 'package:bloc_arch/features/common/widgets/filter_date_widget/filter_date_button.dart';
import 'package:bloc_arch/features/common/dropdown/user_dropdown/widgets/single_user_dropdown.dart';
import 'package:bloc_arch/features/common/dropdown/status_dropdown/widgets/single_status_dropdown.dart';
import 'package:bloc_arch/features/common/dropdown/priority_dropdown/widgets/priority_dropdown.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/core/utils/toaster.dart';
import 'package:bloc_arch/features/common/enums/enums.dart';
import '../cubit/update_task_cubit.dart';
import '../cubit/update_task_state.dart';

@RoutePage()
class UpdateTaskScreen extends StatelessWidget {
  final TaskEntity task;

  const UpdateTaskScreen({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<UpdateTaskCubit>();
        cubit.initializeWithTask(task);
        return cubit;
      },
      child: BlocConsumer<UpdateTaskCubit, UpdateTaskState>(
        listener: (context, state) {
          switch (state.status) {
            case CycleStatus.success:
              Toaster.showSuccess(
                context,
                message: LocaleKeys.task_updated_successfully.tr(),
              );
              // Pop with the updated task entity
              // final taskEntity = state.params.toEntity();
              context.router.pop(state.taskEntity);
            case CycleStatus.failure:
              Toaster.showError(
                context,
                message:
                    state.errorMessage ?? LocaleKeys.failed_to_update_task.tr(),
              );
            case CycleStatus.initial:
            case CycleStatus.loading:
              break;
          }
        },
        builder: (context, state) {
          final cubit = context.read<UpdateTaskCubit>();

          return Scaffold(
            appBar: AppBar(
              title: Text(
                LocaleKeys.update_task.tr(),
                style: context.textStyles.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              backgroundColor: context.colors.primary,
              foregroundColor: context.colors.onPrimary,
              elevation: 0,
            ),
            body: Form(
              key: cubit.formKey,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title TextField
                    Text(
                      LocaleKeys.title.tr(),
                      style: context.textStyles.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colors.onSurface,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: cubit.titleController,
                      hintText: LocaleKeys.title.tr(),
                      validator: Validator.notNullValidation,
                    ),
                    SizedBox(height: 16.h),

                    // Description TextField
                    Text(
                      LocaleKeys.description.tr(),
                      style: context.textStyles.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: context.colors.onSurface,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomTextField(
                      controller: cubit.descriptionController,
                      hintText: LocaleKeys.description.tr(),
                      maxLines: 4,
                    ),
                    SizedBox(height: 16.h),

                    // Row: DatePicker and PriorityDropdown
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.due_date.tr(),
                                style: context.textStyles.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.colors.onSurface,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              FilterDateButton(
                                onDateSelected: cubit.updateDueDate,
                                onClearFilter: () => cubit.updateDueDate(null),
                                initialDate:
                                    state.params.dueDate, // Pass initial date
                                title: LocaleKeys.due_date.tr(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.priority.tr(),
                                style: context.textStyles.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.colors.onSurface,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              PriorityDropdown(
                                selectedPriority: state.params.priority,
                                onPriorityChanged: cubit.updatePriority,
                                onClear: cubit.clearPriority,
                                hintText: LocaleKeys.select_priority.tr(),
                                title: LocaleKeys.priority.tr(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),

                    // Row: StatusDropdown and UserDropdown
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.status.tr(),
                                style: context.textStyles.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.colors.onSurface,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              SingleStatusDropdown(
                                selectedStatus: state.params.status,
                                onStatusChanged: cubit.updateStatus,
                                onClear: cubit.clearStatus,
                                hintText: LocaleKeys.select_status.tr(),
                                title: LocaleKeys.status.tr(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LocaleKeys.assignee.tr(),
                                style: context.textStyles.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: context.colors.onSurface,
                                ),
                              ),
                              SizedBox(height: 8.h),
                              SingleUserDropdown(
                                selectedUser: cubit.getAssigneeEntity(),
                                onUserChanged: cubit.updateAssignee,
                                onClear: cubit.clearAssignee,
                                hintText: LocaleKeys.select_assignee.tr(),
                                title: LocaleKeys.assignee.tr(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),

                    // Submit Button or Loading Indicator
                    if (state.status == CycleStatus.loading)
                      Center(child: LoadingWidget())
                    else
                      CustomElevatedButton(
                        onPressed: () async {
                          await cubit.submit();
                        },
                        text: LocaleKeys.update.tr(),
                        isExpanded: true,
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
