import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../widgets/app_toast.dart';

class Toaster {
  static FToast fToast = FToast();

  /// Show a success toast with green color
  static void showSuccess(
    BuildContext context, {
    required String message,
    String? title,
    int duration = 2,
  }) {
    _showToast(
      context,
      message: message,
      title: title ?? LocaleKeys.success.tr(),
      status: ToastStatus.success,
      duration: duration,
    );
  }

  /// Show an error toast with red color
  static void showError(
    BuildContext context, {
    required String message,
    String? title,
    int duration = 3,
  }) {
    _showToast(
      context,
      message: message,
      title: title ?? LocaleKeys.error_prefix.tr(),
      status: ToastStatus.fail,
      duration: duration,
    );
  }

  /// Show a warning toast with amber color
  static void showWarning(
    BuildContext context, {
    required String message,
    String? title,
    int duration = 2,
  }) {
    _showToast(
      context,
      message: message,
      title: title ?? LocaleKeys.warning.tr(),
      status: ToastStatus.warning,
      duration: duration,
    );
  }

  /// Legacy method for backward compatibility
  static void showToast(
    BuildContext context, {
    String? title,
    required String message,
    int duration = 2,
    ToastStatus status = ToastStatus.fail,
  }) {
    _showToast(
      context,
      message: message,
      title: title,
      status: status,
      duration: duration,
    );
  }

  /// Internal method to show toast
  static void _showToast(
    BuildContext context, {
    required String message,
    String? title,
    required ToastStatus status,
    int duration = 2,
  }) {
    fToast.init(context);
    try {
      fToast.removeCustomToast();
    } catch (_) {}

    FocusManager.instance.primaryFocus?.unfocus();

    fToast.showToast(
      child: AppToast(
        title: title ?? _getDefaultTitle(status),
        message: message,
        status: status,
      ),
      toastDuration: Duration(seconds: duration),
    );
  }

  /// Get default title based on status
  static String _getDefaultTitle(ToastStatus status) {
    switch (status) {
      case ToastStatus.success:
        return LocaleKeys.success.tr();
      case ToastStatus.warning:
        return LocaleKeys.warning.tr();
      case ToastStatus.fail:
        return LocaleKeys.error_prefix.tr();
    }
  }
}
