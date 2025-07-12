import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Common loading widget for dropdowns
class DropdownLoadingWidget extends StatelessWidget {
  final String? loadingText;
  final double? width;
  final double? height;

  const DropdownLoadingWidget({
    super.key,
    this.loadingText,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      constraints: BoxConstraints(
        minWidth: width ?? 0.4.sw,
        minHeight: height ?? 50.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.outline),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // SizedBox(
          //   width: 16.w,
          //   height: 16.h,
          //   child: CircularProgressIndicator(
          //     strokeWidth: 2,
          //     color: context.colors.primary,
          //   ),
          // ),
          // SizedBox(width: 8.w),
          Text(
            loadingText ?? LocaleKeys.loading_users.tr(),
            style: context.textStyles.bodyMedium,
          ),
        ],
      ),
    );
  }
}

/// Common error widget for dropdowns
class DropdownErrorWidget extends StatelessWidget {
  final String message;
  final double? width;
  final double? height;

  const DropdownErrorWidget({
    super.key,
    required this.message,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      constraints: BoxConstraints(
        // minWidth: width ?? 120.w,
        minHeight: height ?? 40.h,
      ),
      // width: 120.w, // or a specific width

      decoration: BoxDecoration(
        border: Border.all(color: Colors.red.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.error, color: Colors.red, size: 16.w),
          SizedBox(width: 8.w),
          Flexible(
            fit: FlexFit.loose,
            child: Text(
              '${LocaleKeys.error_prefix.tr()} $message',
              style: TextStyle(color: Colors.red, fontSize: 12.sp),
            ),
          ),
        ],
      ),
    );
  }
}

/// Common empty state widget for dropdowns
class DropdownEmptyWidget extends StatelessWidget {
  final String? emptyText;
  final double? width;
  final double? height;

  const DropdownEmptyWidget({
    super.key,
    this.emptyText,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      constraints: BoxConstraints(
        minWidth: width ?? 120.w,
        minHeight: height ?? 40.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: context.colors.outline),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.info_outline,
            color: context.colors.onSurface.withValues(alpha: 0.6),
            size: 16.w,
          ),
          SizedBox(width: 8.w),
          Text(
            emptyText ?? LocaleKeys.no_data_available.tr(),
            style: context.textStyles.bodyMedium?.copyWith(
              color: context.colors.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}

/// Common dropdown container with consistent styling
class DropdownContainer extends StatelessWidget {
  final Widget child;
  final bool hasError;
  final double? minWidth;
  final double? minHeight;

  const DropdownContainer({
    super.key,
    required this.child,
    this.hasError = false,
    this.minWidth,
    this.minHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      constraints: BoxConstraints(
        minWidth: minWidth ?? 120.w,
        minHeight: minHeight ?? 40.h,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: hasError ? context.colors.error : context.colors.outline,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: child,
    );
  }
}
