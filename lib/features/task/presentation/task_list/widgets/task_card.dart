import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskCard extends StatelessWidget {
  final TaskEntity task;
  final VoidCallback? onTap;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const TaskCard({
    super.key,
    required this.task,
    this.onTap,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      elevation: 2,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header row with sync status and title
            Row(
              children: [
                // Sync status icon
                task.syncStatus?.getIcon(context) ?? SizedBox.shrink(),
                SizedBox(width: 8.w),
                // Title
                Expanded(
                  child: Text(
                    task.title,
                    style: context.textStyles.titleLarge?.copyWith(
                      fontSize: 22.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8.h),
            // Description
            if (task.description != null && task.description!.isNotEmpty)
              Text(
                task.description!,
                style: context.textStyles.headlineSmall?.copyWith(
                  fontSize: 16.sp,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            SizedBox(height: 16.h),
            // Row: Due date, Priority, Status
            if (task.dueDate != null)
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calendar_today,
                      size: 18.sp,
                      color: context.colors.onSurface.withValues(alpha: 0.6)),
                  SizedBox(width: 4.w),
                  Text(
                    task.dueDate!.formatDateShort(),
                    style: context.textStyles.titleMedium?.copyWith(
                      color: context.colors.onSurface.withValues(alpha: 0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            SizedBox(height: 12.h),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (task.priority != null) ...[
                  _PriorityChip(priority: task.priority!),
                  10.horizontalSpace
                ],
                _StatusChip(status: task.status),
              ],
            ),
            // Status chip

            SizedBox(height: 8.h),
            // Divider
            Divider(
                color: context.colors.outline.withValues(alpha: 0.2),
                height: 24.h),
            // Edit/Delete row
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: TextButton(
                    onPressed: onEdit,
                    child: Text(
                      LocaleKeys.edit.tr(),
                      style: context.textStyles.titleMedium?.copyWith(
                        color: context.colors.primary,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
                Flexible(
                  child: TextButton(
                    onPressed: onDelete,
                    style: TextButton.styleFrom(
                        foregroundColor: context.colors.error),
                    child: Text(
                      LocaleKeys.delete.tr(),
                      style: context.textStyles.titleMedium?.copyWith(
                        color: context.colors.error,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PriorityChip extends StatelessWidget {
  final TaskPriority priority;
  const _PriorityChip({required this.priority});

  @override
  Widget build(BuildContext context) {
    final color = priority.getColor(context);
    final textColor = priority.getTextColor(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 10.sp, color: color),
          SizedBox(width: 4.w),
          Flexible(
            child: Text(
              priority.localizedLabel,
              style: context.textStyles.labelMedium?.copyWith(
                color: textColor,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final TaskStatus status;
  const _StatusChip({required this.status});

  @override
  Widget build(BuildContext context) {
    final color = status.getColor(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 10.sp, color: color),
          SizedBox(width: 4.w),
          Flexible(
            child: Text(
              status.localizedLabel,
              style: context.textStyles.labelMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
