import 'package:bloc_arch/core/app/injectable_config.dart';
import 'package:bloc_arch/features/common/widgets/filter_date_widget/filter_date_cubit/filter_date_button_cubit.dart';
import 'package:bloc_arch/features/common/widgets/filter_date_widget/filter_date_cubit/filter_date_button_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_arch/core/widgets/date_picker_widget.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

/// A reusable filter button widget that manages its own date selection state.
///
/// Features:
/// - Built-in state management using FilterButtonCubit
/// - Cross-platform date picker (iOS Cupertino, Android Material)
/// - Visual feedback when a date is selected
/// - Clear filter functionality
/// - Customizable date range, titles, and button text
/// - Dynamic width sizing based on selection state
/// - Customizable height that matches dropdown form fields
/// - Dynamic border color (primary when selected, custom/default when not)
///
/// Usage:
/// ```dart
/// // Basic usage
/// FilterDateButton(
///   onDateSelected: (date) {
///     // Handle date selection
///     print('Selected date: $date');
///   },
///   onClearFilter: () {
///     // Handle filter clearing
///     print('Filter cleared');
///   },
/// )
///
/// // With custom width sizing, border color, and height
/// FilterDateButton(
///   onDateSelected: (date) => print('Selected: $date'),
///   onClearFilter: () => print('Cleared'),
///   // Default state (no date selected)
///   minWidth: 100.w,
///   borderColor: Colors.grey[300], // Custom border color
///   height: 48.h, // Custom height
///   // Selected state (date selected)
///   minWidthWhenSelected: 150.w,
/// )
///
/// // Fixed width with custom border and height
/// FilterDateButton(
///   onDateSelected: (date) => print('Selected: $date'),
///   onClearFilter: () => print('Cleared'),
///   minWidth: 120.w,
///   maxWidth: 120.w, // Fixed width
///   borderColor: Colors.blue[200], // Custom border color
///   height: 56.h, // Custom height
/// )
/// ```
class FilterDateButton extends StatelessWidget {
  final Function(DateTime?) onDateSelected;
  final VoidCallback? onClearFilter;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateTime? initialDate;
  final String? title;
  final String? cancelText;
  final String? confirmText;

  // Size control parameters
  final double? minWidth;
  final double? maxWidth;
  final double? minWidthWhenSelected;
  final double? maxWidthWhenSelected;

  // Border styling
  final Color? borderColor;

  // Height control
  final double? height;

  const FilterDateButton({
    super.key,
    required this.onDateSelected,
    this.onClearFilter,
    this.firstDate,
    this.lastDate,
    this.initialDate,
    this.title,
    this.cancelText,
    this.confirmText,
    // Size control parameters
    this.minWidth,
    this.maxWidth,
    this.minWidthWhenSelected,
    this.maxWidthWhenSelected,
    // Border styling
    this.borderColor,
    // Height control
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<FilterDateButtonCubit>();
        // Initialize with initial date if provided
        if (initialDate != null) {
          cubit.selectDate(initialDate);
        }
        return cubit;
      },
      child: BlocBuilder<FilterDateButtonCubit, FilterDateButtonState>(
        builder: (context, state) {
          final hasDateSelected = state.selectedDate != null;

          // Determine dimensions based on selection state
          final currentMinWidth = hasDateSelected
              ? (minWidthWhenSelected ?? minWidth ?? 0.36.sw)
              : (minWidth ?? 0.35.sw);
          final currentMaxWidth =
              hasDateSelected ? (maxWidthWhenSelected ?? maxWidth) : maxWidth;

          // Determine border color based on selection state
          final currentBorderColor = hasDateSelected
              ? context.colors.primary
              : (borderColor ?? context.colors.surfaceContainer);

          return SizedBox(
            height: height ?? 50.h,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 12.w, vertical: 8.h), // Match dropdown padding
              constraints: BoxConstraints(
                minWidth: currentMinWidth,
                maxWidth: currentMaxWidth ?? double.infinity,
              ),
              decoration: BoxDecoration(
                  border: Border.all(color: currentBorderColor),
                  borderRadius: BorderRadius.circular(8),
                  color: context.colors.surface),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Date Text and Dropdown Icon
                  InkWell(
                    onTap: () => _showDatePicker(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          state.selectedDate != null
                              ? state.selectedDate!.formatDate()
                              : LocaleKeys.select_date.tr(),
                          style: context.textStyles.headlineSmall?.copyWith(
                            color: state.selectedDate != null
                                ? context.colors.primary
                                : null,
                          ),
                        ),
                        // SizedBox(width: 8.w),

                        // Icon(
                        //   Icons.keyboard_arrow_down,
                        //   size: state.selectedDate == null ? 23.w : 15.w,
                        //   color: context.colors.surfaceContainer,
                        // ),
                      ],
                    ),
                  ),

                  // Clear Button (only show if date is selected)
                  if (state.selectedDate != null) ...[
                    // SizedBox(width: 2.w),
                    IconButton(
                      icon: Icon(
                        Icons.clear,
                        size: 18.w,
                        color: context.colors.onSurface.withValues(alpha: 0.6),
                      ),
                      onPressed: () {
                        context.read<FilterDateButtonCubit>().clearFilter();
                        onClearFilter?.call();
                      },
                      tooltip: LocaleKeys.clear.tr(),
                      padding: EdgeInsets.zero,
                      constraints: BoxConstraints(
                        minWidth: 24.w,
                        minHeight: 24.h,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showDatePicker(BuildContext context) {
    // Get the cubit instance before showing the modal
    final cubit = context.read<FilterDateButtonCubit>();

    if (Theme.of(context).platform == TargetPlatform.iOS) {
      showCupertinoModalPopup(
        context: context,
        builder: (context) => DatePickerWidget(
          selectedDate: cubit.state.selectedDate ?? initialDate,
          onDateSelected: (date) {
            cubit.selectDate(date);
            onDateSelected(date);
          },
          firstDate: firstDate ?? DateTime.now(),
          lastDate: lastDate ?? DateTime.now().add(const Duration(days: 730)),
          title: title,
          cancelText: cancelText,
          confirmText: confirmText,
        ),
      );
    } else {
      showDatePicker(
        context: context,
        initialDate: cubit.state.selectedDate ?? initialDate ?? DateTime.now(),
        firstDate: firstDate ?? DateTime.now(),
        lastDate: lastDate ?? DateTime.now().add(const Duration(days: 730)),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: context.colors.copyWith(
                primary: context.colors.primary,
                onPrimary: context.colors.onPrimary,
                surface: context.colors.surface,
                onSurface: context.colors.onSurface,
              ),
            ),
            child: child!,
          );
        },
      ).then((date) {
        if (date != null) {
          cubit.selectDate(date);
          onDateSelected(date);
        }
      });
    }
  }
}
