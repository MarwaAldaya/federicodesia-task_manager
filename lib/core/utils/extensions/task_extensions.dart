import 'package:bloc_arch/features/sync/domain/params/sync_params.dart';
import 'package:flutter/material.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';

/// Extension methods for TaskPriority to provide consistent label and color logic
extension TaskPriorityExtension on TaskPriority {
  /// Get the localized label for the priority
  String get localizedLabel {
    switch (this) {
      case TaskPriority.high:
        return LocaleKeys.high.tr();
      case TaskPriority.medium:
        return LocaleKeys.medium.tr();
      case TaskPriority.low:
        return LocaleKeys.low.tr();
    }
  }

  /// Get the color for the priority chip
  Color getColor(BuildContext context) {
    switch (this) {
      case TaskPriority.high:
        return context.colors.tertiary; // Red from theme
      case TaskPriority.medium:
        return context.colors.secondary; // Amber from theme
      case TaskPriority.low:
        return context.colors
            .inversePrimary; // Green from theme (using inversePrimary for low priority)
    }
  }

  /// Get the text color for the priority chip
  Color getTextColor(BuildContext context) {
    switch (this) {
      case TaskPriority.high:
        return context.colors.tertiary; // Text color for tertiary
      case TaskPriority.medium:
        return context.colors.onSecondary; // Text color for secondary
      case TaskPriority.low:
        return context.colors
            .onSurface; // Text color for low priority (using onSurface for contrast)
    }
  }
}

/// Extension methods for TaskStatus to provide consistent label and color logic
extension TaskStatusExtension on TaskStatus {
  /// Get the localized label for the status
  String get localizedLabel {
    switch (this) {
      case TaskStatus.todo:
        return LocaleKeys.to_do.tr();
      case TaskStatus.inProgress:
        return LocaleKeys.in_progress.tr();
      case TaskStatus.done:
        return LocaleKeys.done.tr();
    }
  }

  /// Get the color for the status chip
  Color getColor(BuildContext context) {
    switch (this) {
      case TaskStatus.todo:
        return context.colors.surfaceVariant; // Gray from theme
      case TaskStatus.inProgress:
        return context.colors.inverseSurface; // Blue from theme
      case TaskStatus.done:
        return context.colors.inversePrimary; // Green from theme
    }
  }
}

/// Extension methods for SyncStatus to provide consistent icon logic
extension SyncStatusExtension on SyncStatus {
  /// Get the icon for the sync status
  Widget getIcon(BuildContext context) {
    switch (this) {
      case SyncStatus.needSync:
        return Icon(Icons.sync,
            color: context.colors.secondary,
            size: 24); // Amber for pending sync
      case SyncStatus.synced:
        return Icon(Icons.check_circle,
            color: context.colors.inversePrimary, size: 24); // Green for synced
      case SyncStatus.failed:
        return Icon(Icons.error, color: context.colors.error, size: 24);
      // Red for failed
      case SyncStatus.syncing:
        return Icon(Icons.autorenew, color: context.colors.primary, size: 24);
    }
  }
}

/// Extension methods for building hint text with selected items
extension HintTextBuilder on Object {
  /// Build hint text for users with count
  static String buildUserHintText(List<UserEntity> users) {
    if (users.isEmpty) {
      return LocaleKeys.assignee.tr();
    }

    String hintText = users.first.username;
    if (users.length > 1) {
      hintText += ' +${users.length - 1}';
    }
    return hintText;
  }

  /// Build hint text for statuses with count
  static String buildStatusHintText(List<TaskStatus> statuses) {
    if (statuses.isEmpty) {
      return LocaleKeys.status.tr();
    }

    String hintText = statuses.first.localizedLabel;
    if (statuses.length > 1) {
      hintText += ' +${statuses.length - 1}';
    }
    return hintText;
  }
}

/// Extension methods for common UI patterns
extension UIHelpers on BuildContext {
  /// Show error snackbar with consistent styling
  void showErrorSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: colors.error,
      ),
    );
  }

  /// Show success snackbar with consistent styling
  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: colors.primary,
      ),
    );
  }

  /// Get consistent empty state icon color
  Color get emptyStateIconColor => colors.onSurface.withValues(alpha: 0.4);

  /// Get consistent empty state text color
  Color get emptyStateTextColor => colors.onSurface.withValues(alpha: 0.6);

  /// Get consistent empty state subtitle color
  Color get emptyStateSubtitleColor => colors.onSurface.withValues(alpha: 0.5);
}
