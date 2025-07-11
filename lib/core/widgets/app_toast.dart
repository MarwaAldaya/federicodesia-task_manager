import 'package:flutter/material.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';

enum ToastStatus { success, fail, warning }

class AppToast extends StatelessWidget {
  final String title;
  final String message;
  final ToastStatus status;

  const AppToast({
    super.key,
    required this.title,
    required this.message,
    this.status = ToastStatus.success,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: _getBackgroundColor(context),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white.withOpacity(0.1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.textStyles.titleSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              message,
              style: context.textStyles.bodyMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    switch (status) {
      case ToastStatus.success:
        return context.colors.primary;
      case ToastStatus.warning:
        return context.colors.tertiary;
      case ToastStatus.fail:
        return context.colors.error;
    }
  }
}
