import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import '../../base_dropdown/widgets/base_dropdown.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';

class PriorityDropdown extends StatelessWidget {
  final TaskPriority? selectedPriority;
  final Function(TaskPriority?) onPriorityChanged;
  final String? hintText;
  final String? title;
  final VoidCallback? onClear;

  const PriorityDropdown({
    super.key,
    required this.selectedPriority,
    required this.onPriorityChanged,
    this.hintText,
    this.title,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return BaseDropdown<TaskPriority>(
      items: TaskPriority.values,
      selectedValue: selectedPriority,
      onChanged: onPriorityChanged,
      displayText: (priority) => priority.localizedLabel,
      hintText: hintText ?? LocaleKeys.select_priority.tr(),
      title: title ?? LocaleKeys.priority.tr(),
      onClear: onClear,
    );
  }
}
