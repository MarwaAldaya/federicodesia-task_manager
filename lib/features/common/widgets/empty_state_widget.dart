import 'package:flutter/material.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bloc_arch/core/utils/resources/value_manager.dart';

/// A reusable empty state widget for consistent empty state display
class EmptyStateWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  final String? actionButtonText;
  final VoidCallback? onActionPressed;
  final IconData? actionIcon;

  const EmptyStateWidget({
    super.key,
    required this.icon,
    required this.title,
    this.subtitle,
    this.actionButtonText,
    this.onActionPressed,
    this.actionIcon,
  });

  /// Factory constructor for tasks empty state
  factory EmptyStateWidget.tasks({
    VoidCallback? onCreateTask,
  }) {
    return EmptyStateWidget(
      icon: Icons.task_alt,
      title: LocaleKeys.no_tasks.tr(),
      subtitle: LocaleKeys.create_first_task.tr(),
      actionButtonText: LocaleKeys.create_task.tr(),
      onActionPressed: onCreateTask,
      actionIcon: Icons.add,
    );
  }

  /// Factory constructor for error state
  factory EmptyStateWidget.error({
    required String title,
    required VoidCallback onRetry,
  }) {
    return EmptyStateWidget(
      icon: Icons.error_outline,
      title: title,
      actionButtonText: LocaleKeys.retry.tr(),
      onActionPressed: onRetry,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: context.emptyStateIconColor,
          ),
          const SizedBox(height: AppSize.s16),
          Text(
            title,
            style: context.textStyles.titleMedium?.copyWith(
              color: context.emptyStateTextColor,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: AppSize.s8),
            Text(
              subtitle!,
              style: context.textStyles.bodyMedium?.copyWith(
                color: context.emptyStateSubtitleColor,
              ),
            ),
          ],
          if (actionButtonText != null && onActionPressed != null) ...[
            const SizedBox(height: AppSize.s16),
            if (actionIcon != null)
              ElevatedButton.icon(
                onPressed: onActionPressed,
                icon: Icon(actionIcon),
                label: Text(actionButtonText!),
              )
            else
              ElevatedButton(
                onPressed: onActionPressed,
                child: Text(actionButtonText!),
              ),
          ],
        ],
      ),
    );
  }
}
