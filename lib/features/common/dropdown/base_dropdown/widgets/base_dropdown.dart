import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BaseDropdown<T> extends StatelessWidget {
  final List<T> items;
  final T? selectedValue;
  final Function(T?) onChanged;
  final String Function(T) displayText;
  final String? hintText;
  final String? title;
  final String Function(T)? getId; // Optional function to get ID for comparison
  final VoidCallback? onClear; // Callback for clear button

  const BaseDropdown({
    Key? key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    required this.displayText,
    this.hintText,
    this.title,
    this.getId,
    this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Find the matching item by ID if getId is provided, otherwise use direct equality
    final actualSelectedValue = _findMatchingValue();

    return DropdownButtonFormField<T>(
      value: actualSelectedValue,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: actualSelectedValue != null
                ? context.colors.primary
                : context.colors.outline,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: actualSelectedValue != null
                ? context.colors.primary
                : context.colors.outline,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: context.colors.primary,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        hintText: hintText ?? LocaleKeys.select_item.tr(),
        hintStyle: context.textStyles.bodyMedium?.copyWith(
          color: context.colors.onSurface.withValues(alpha: 0.6),
        ),
        suffixIcon: actualSelectedValue != null && onClear != null
            ? IconButton(
                icon: Icon(
                  Icons.clear,
                  size: 18.w,
                  color: context.colors.onSurface.withValues(alpha: 0.6),
                ),
                onPressed: onClear,
                tooltip: LocaleKeys.clear.tr(),
              )
            : null,
      ),
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(
            displayText(item),
            style: context.textStyles.bodyMedium,
          ),
        );
      }).toList(),
      onChanged: onChanged,
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: context.colors.surfaceContainer,
      ),
      dropdownColor: context.colors.surface,
      style: context.textStyles.bodyMedium?.copyWith(
        color: context.colors.onSurface,
      ),
      isExpanded: true,
    );
  }

  T? _findMatchingValue() {
    if (selectedValue == null) return null;

    if (getId != null) {
      // Use ID-based comparison
      final selectedId = getId!(selectedValue!);
      try {
        return items.firstWhere((item) => getId!(item) == selectedId);
      } catch (e) {
        return null; // No matching item found
      }
    } else {
      // Use direct equality (for primitive types or properly implemented equality)
      return items.contains(selectedValue) ? selectedValue : null;
    }
  }
}
