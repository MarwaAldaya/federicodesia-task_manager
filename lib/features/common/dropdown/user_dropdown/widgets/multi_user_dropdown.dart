import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';
import 'package:bloc_arch/core/app/injectable_config.dart';
import '../cubit/user_dropdown_cubit.dart';
import '../cubit/user_dropdown_state.dart';
import '../../../widgets/dropdown_common_widgets.dart';

class MultiUserDropdown extends StatelessWidget {
  final Function(List<UserEntity>) onUsersSelected;
  final List<UserEntity>? initiallySelectedUsers;
  final String? hintText;
  final String? title;
  final bool searchable;
  final bool allowMultipleSelection;
  final double? dialogHeight;
  final double? dialogWidth;

  const MultiUserDropdown({
    super.key,
    required this.onUsersSelected,
    this.initiallySelectedUsers,
    this.hintText,
    this.title,
    this.searchable = true,
    this.allowMultipleSelection = true,
    this.dialogHeight,
    this.dialogWidth,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = getIt<UserDropdownCubit>();
        // Load all users on initialization
        cubit.loadAllUsers();
        return cubit;
      },
      child: BlocBuilder<UserDropdownCubit, UserDropdownState>(
        builder: (context, state) {
          return switch (state) {
            Loading() => DropdownLoadingWidget(
                loadingText: LocaleKeys.loading_users.tr(),
              ),
            Success(users: final users) => _buildDropdownWidget(context, users),
            Failure(message: final message) => DropdownErrorWidget(
                message: message,
              ),
            Initial() => DropdownLoadingWidget(
                loadingText: LocaleKeys.loading_users.tr(),
              ),
          };
        },
      ),
    );
  }

  Widget _buildDropdownWidget(BuildContext context, List<UserEntity> users) {
    final hasSelectedValues = (initiallySelectedUsers?.isNotEmpty ?? false);

    return MultiSelectDialogField<UserEntity>(
        items:
            users.map((user) => MultiSelectItem(user, user.username)).toList(),
        initialValue: initiallySelectedUsers ?? [],
        searchable: searchable,
        title: Text(title ?? hintText ?? 'Select Users'),
        buttonText: Text(
          hintText ?? 'Select Users...',
          style: hasSelectedValues
              ? context.textStyles.headlineSmall
                  ?.copyWith(color: context.colors.primary)
              : context.textStyles.headlineSmall,
        ),
        onConfirm: (values) {
          onUsersSelected(values);
        },
        chipDisplay: MultiSelectChipDisplay.none(),
        // MultiSelectChipDisplay(
        //   onTap: (user) {
        //     if (allowMultipleSelection) {
        //       final newList = List<UserEntity>.from(initiallySelectedUsers ?? []);
        //       newList.remove(user);
        //       onUsersSelected(newList);
        //     }
        //   },
        // ),
        dialogHeight: dialogHeight ?? 0.3.sh,
        dialogWidth: dialogWidth ?? 0.3.sw,
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
