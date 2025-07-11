import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';

class DatePickerWidget extends StatefulWidget {
  final DateTime? selectedDate;
  final Function(DateTime?) onDateSelected;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? title;
  final String? cancelText;
  final String? confirmText;

  const DatePickerWidget({
    super.key,
    this.selectedDate,
    required this.onDateSelected,
    this.firstDate,
    this.lastDate,
    this.title,
    this.cancelText,
    this.confirmText,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    DateTime initialDate = widget.selectedDate ?? DateTime.now();
    // Ensure the initial date respects the minimumDate constraint
    if (widget.firstDate != null && initialDate.isBefore(widget.firstDate!)) {
      initialDate = widget.firstDate!;
    }
    _selectedDate = initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return Theme.of(context).platform == TargetPlatform.iOS
        ? _buildCupertinoDatePicker(context)
        : _buildMaterialDatePicker(context);
  }

  Widget _buildCupertinoDatePicker(BuildContext context) {
    // Calculate a valid initial date that respects minimumDate constraint
    DateTime validInitialDate = widget.selectedDate ?? DateTime.now();
    if (widget.firstDate != null &&
        validInitialDate.isBefore(widget.firstDate!)) {
      validInitialDate = widget.firstDate!;
    }

    return Container(
      height: 300,
      color: context.colors.surface,
      child: Column(
        children: [
          Container(
            height: 50,
            color: context.colors.primary,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    widget.onDateSelected(null);
                  },
                  child: Text(
                    widget.cancelText ?? LocaleKeys.cancel.tr(),
                    style: TextStyle(
                      color: context.colors.onPrimary,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                Text(
                  widget.title ?? LocaleKeys.select_date.tr(),
                  style: TextStyle(
                    color: context.colors.onPrimary,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    widget.onDateSelected(_selectedDate);
                  },
                  child: Text(
                    widget.confirmText ?? LocaleKeys.confirm.tr(),
                    style: TextStyle(
                      color: context.colors.onPrimary,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              initialDateTime: validInitialDate,
              minimumDate: widget.firstDate,
              maximumDate: widget.lastDate,
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  _selectedDate =
                      DateTime(newDate.year, newDate.month, newDate.day);
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMaterialDatePicker(BuildContext context) {
    return FutureBuilder<DateTime?>(
      future: showDatePicker(
        context: context,
        initialDate: widget.selectedDate ?? DateTime.now(),
        firstDate: widget.firstDate ?? DateTime(2020),
        lastDate:
            widget.lastDate ?? DateTime.now().add(const Duration(days: 365)),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: context.colors.primary,
                    onPrimary: context.colors.onPrimary,
                    surface: context.colors.surface,
                    onSurface: context.colors.onSurface,
                  ),
            ),
            child: child!,
          );
        },
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          widget.onDateSelected(snapshot.data);
        }
        return const SizedBox.shrink();
      },
    );
  }
}

// Extension to add missing locale keys
