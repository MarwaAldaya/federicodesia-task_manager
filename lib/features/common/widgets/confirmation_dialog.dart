import 'package:flutter/material.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

/// A reusable confirmation dialog widget
class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String? confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;
  final bool isDestructive;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
    this.isDestructive = false,
  });

  /// Factory constructor for delete confirmation
  factory ConfirmationDialog.delete({
    required String itemName,
    required VoidCallback onDelete,
  }) {
    return ConfirmationDialog(
      title: LocaleKeys.delete_task.tr(),
      message: LocaleKeys.task_delete_confirm.tr(namedArgs: {'task': itemName}),
      confirmText: LocaleKeys.delete.tr(),
      cancelText: LocaleKeys.cancel.tr(),
      onConfirm: onDelete,
      isDestructive: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: context.textStyles.titleMedium,
      ),
      content: Text(
        message,
        style: context.textStyles.bodyMedium,
      ),
      actions: [
        TextButton(
          onPressed: onCancel ?? () => Navigator.of(context).pop(),
          child: Text(
            cancelText ?? LocaleKeys.cancel.tr(),
            style: TextStyle(color: context.colors.primary),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm?.call();
          },
          style: TextButton.styleFrom(
            foregroundColor:
                isDestructive ? context.colors.error : context.colors.primary,
          ),
          child: Text(confirmText ?? LocaleKeys.confirm.tr()),
        ),
      ],
    );
  }
}
