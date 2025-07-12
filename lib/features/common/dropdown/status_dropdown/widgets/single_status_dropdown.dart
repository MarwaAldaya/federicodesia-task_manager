import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import '../../base_dropdown/widgets/base_dropdown.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';

class SingleStatusDropdown extends StatelessWidget {
  final TaskStatus? selectedStatus;
  final Function(TaskStatus?) onStatusChanged;
  final String? hintText;
  final String? title;
  final VoidCallback? onClear;

  const SingleStatusDropdown({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
    this.hintText,
    this.title,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return BaseDropdown<TaskStatus>(
      items: TaskStatus.values,
      selectedValue: selectedStatus,
      onChanged: onStatusChanged,
      displayText: (status) => status.localizedLabel,
      hintText: hintText ?? LocaleKeys.select_status.tr(),
      title: title ?? LocaleKeys.status.tr(),
      onClear: onClear,
    );
  }
}
