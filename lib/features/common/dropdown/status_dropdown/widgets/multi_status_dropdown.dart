import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:bloc_arch/core/app/injectable_config.dart';
import '../cubit/status_dropdown_cubit.dart';
import '../cubit/status_dropdown_state.dart';
import '../../../widgets/dropdown_common_widgets.dart';

class MultiStatusDropdown extends StatelessWidget {
  final Function(List<TaskStatus>) onStatusesSelected;
  final List<TaskStatus>? initiallySelectedStatuses;
  final String? hintText;
  final String? title;
  final bool searchable;
  final bool allowMultipleSelection;
  final double? dialogHeight;
  final double? dialogWidth;

  const MultiStatusDropdown({
    Key? key,
    required this.onStatusesSelected,
    this.initiallySelectedStatuses,
    this.hintText,
    this.title,
    this.searchable = false,
    this.allowMultipleSelection = true,
    this.dialogHeight,
    this.dialogWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<StatusDropdownCubit>(),
      child: BlocBuilder<StatusDropdownCubit, StatusDropdownState>(
        builder: (context, state) {
          return switch (state) {
            Success(statuses: final statuses) =>
              _buildDropdownWidget(context, statuses),
            Failure(message: final message) => DropdownErrorWidget(
                message: message,
              ),
            Initial() => DropdownLoadingWidget(
                loadingText: LocaleKeys.loading_statuses.tr(),
              ),
          };
        },
      ),
    );
  }

  Widget _buildDropdownWidget(BuildContext context, List<TaskStatus> statuses) {
    final hasSelectedValues = (initiallySelectedStatuses?.isNotEmpty ?? false);

    return MultiSelectDialogField<TaskStatus>(
        items: statuses
            .map((status) => MultiSelectItem(status, status.name))
            .toList(),
        initialValue: initiallySelectedStatuses ?? [],
        searchable: searchable,
        title: Text(title ?? hintText ?? 'Select Statuses'),
        buttonText: Text(
          hintText ?? 'Select Statuses...',
          style: hasSelectedValues
              ? context.textStyles.headlineSmall
                  ?.copyWith(color: context.colors.primary)
              : context.textStyles.headlineSmall,
        ),
        onConfirm: (values) {
          onStatusesSelected(values);
        },
        chipDisplay: MultiSelectChipDisplay.none(),
        dialogHeight: dialogHeight,
        dialogWidth: dialogWidth,
        confirmText: Text(LocaleKeys.confirm.tr()),
        cancelText: Text(LocaleKeys.cancel.tr()),
        buttonIcon: Icon(
          Icons.keyboard_arrow_down,
          color: context.colors.surfaceContainer,
        ),
        isDismissible: true,
        decoration: BoxDecoration(
          border: Border.all(
            color: hasSelectedValues
                ? context.colors.primary
                : context.colors.outline,
          ),
          borderRadius: BorderRadius.circular(8),
        ));
  }
}
