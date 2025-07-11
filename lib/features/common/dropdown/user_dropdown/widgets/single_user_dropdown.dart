import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';
import 'package:bloc_arch/core/app/injectable_config.dart';
import '../cubit/user_dropdown_cubit.dart';
import '../cubit/user_dropdown_state.dart';
import '../../base_dropdown/widgets/base_dropdown.dart';
import '../../../widgets/dropdown_common_widgets.dart';

class SingleUserDropdown extends StatelessWidget {
  final UserEntity? selectedUser;
  final Function(UserEntity?) onUserChanged;
  final String? hintText;
  final String? title;
  final VoidCallback? onClear;

  const SingleUserDropdown({
    super.key,
    required this.selectedUser,
    required this.onUserChanged,
    this.hintText,
    this.title,
    this.onClear,
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
    return BaseDropdown<UserEntity>(
      items: users,
      selectedValue: selectedUser,
      onChanged: onUserChanged,
      displayText: (user) => user.username,
      getId: (user) => user.id, // Use ID for comparison
      hintText: hintText ?? LocaleKeys.select_assignee.tr(),
      title: title ?? LocaleKeys.assignee.tr(),
      onClear: onClear,
    );
  }
}
