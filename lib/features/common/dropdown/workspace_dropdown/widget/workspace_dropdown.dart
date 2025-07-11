import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/features/common/dropdown/workspace_dropdown/cubit/workspace_dropdown_cubit.dart';
import 'package:bloc_arch/features/common/dropdown/workspace_dropdown/cubit/workspace_dropdown_state.dart';
import 'package:bloc_arch/features/common/dropdown/base_dropdown/drop_down_search.dart';
import 'package:bloc_arch/features/workspace/domain/entities/workspace_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import '../../../widgets/dropdown_common_widgets.dart';

/// WorkspaceDropdown Widget
///
/// A clean, OOP dropdown widget for workspace selection with built-in loading states.
///
/// Features:
/// - Shows loading hint and spinner when fetching workspaces
/// - Disabled during loading to prevent interaction
/// - Error handling with localized messages
/// - Customizable hint text
/// - Follows theme colors and text styles
///
/// Usage:
/// ```dart
/// WorkspaceDropdown(
///   hint: "Select your workspace", // Optional custom hint
///   onWorkspaceSelected: (workspace) {
///     // Handle workspace selection
///   },
/// )
/// ```
class WorkspaceDropdown extends StatelessWidget {
  final bool readOnly;
  final bool showSearchBox;
  final String? hint;
  final void Function(WorkspaceEntity?)? onWorkspaceSelected;

  const WorkspaceDropdown({
    super.key,
    this.readOnly = false,
    this.showSearchBox = true,
    this.hint,
    this.onWorkspaceSelected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkspaceDropdownCubit, WorkspaceDropdownState>(
      builder: (context, state) {
        return Column(
          children: [
            _WorkspaceDropdownContainer(
              state: state,
              child: _WorkspaceDropdownContent(
                state: state,
                readOnly: readOnly,
                showSearchBox: showSearchBox,
                hint: hint,
                onWorkspaceSelected: onWorkspaceSelected,
              ),
            ),
            if (state.isRequiredFieldError) _WorkspaceErrorText(),
          ],
        );
      },
    );
  }
}

class _WorkspaceDropdownContainer extends StatelessWidget {
  final WorkspaceDropdownState state;
  final Widget child;

  const _WorkspaceDropdownContainer({
    required this.state,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    // Get the cubit to check if there's a selected workspace
    final cubit = context.read<WorkspaceDropdownCubit>();
    final selectedName = cubit.getSelectedWorkspaceName();
    final hasSelectedValue = selectedName != null && selectedName.isNotEmpty;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: state.isRequiredFieldError
              ? context.colors.error
              : context.colors.outline,
        ),
      ),
      child: child,
    );
  }
}

class _WorkspaceDropdownContent extends StatelessWidget {
  final WorkspaceDropdownState state;
  final bool readOnly;
  final bool showSearchBox;
  final String? hint;
  final void Function(WorkspaceEntity?)? onWorkspaceSelected;

  const _WorkspaceDropdownContent({
    required this.state,
    required this.readOnly,
    this.showSearchBox = true,
    this.hint,
    this.onWorkspaceSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (state.isError && state.failure?.message != null) {
      return DropdownErrorWidget(message: state.failure!.message!);
    }

    return _DropdownWidget(
      state: state,
      readOnly: readOnly,
      showSearchBox: showSearchBox,
      hint: hint,
      onWorkspaceSelected: onWorkspaceSelected,
    );
  }
}

class _DropdownWidget extends StatelessWidget {
  final WorkspaceDropdownState state;
  final bool readOnly;
  final bool showSearchBox;
  final String? hint;
  final void Function(WorkspaceEntity?)? onWorkspaceSelected;

  const _DropdownWidget({
    required this.state,
    required this.readOnly,
    this.onWorkspaceSelected,
    required this.showSearchBox,
    this.hint,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkspaceDropdownCubit>();
    final selectedName = cubit.getSelectedWorkspaceName();
    final items = cubit.getWorkspaceNames();

    // Determine if dropdown should be enabled
    final isEnabled = state.isSuccess && !readOnly && !state.isLoading;

    // Determine the hint text based on state
    final hintText = _getHintText(context);

    // Add loading suffix icon when loading
    final suffixIcon = state.isLoading
        ? CircularProgressIndicator(
            strokeWidth: 2,
            padding: EdgeInsets.all(8),
            valueColor: AlwaysStoppedAnimation<Color>(context.colors.primary),
          )
        : null;

    return CustomDropDownSearch(
      selectedItem: selectedName,
      enabled: isEnabled,
      showSearchBox: showSearchBox,
      hint: hintText,
      suffixIcon: suffixIcon,
      onChanged: isEnabled
          ? (value) => _handleWorkspaceSelection(context, value)
          : (_) {},
      textStyle: context.textStyles.bodySmall,
      items: items,
    );
  }

  String _getHintText(BuildContext context) {
    if (state.isLoading) {
      return LocaleKeys.loading_workspaces.tr();
    }
    return hint ?? LocaleKeys.workspace_hint.tr();
  }

  void _handleWorkspaceSelection(BuildContext context, String? value) {
    final cubit = context.read<WorkspaceDropdownCubit>();

    cubit.selectWorkspaceByName(value);

    if (onWorkspaceSelected != null) {
      final selectedWorkspace = cubit.getSelectedWorkspace();
      onWorkspaceSelected!(selectedWorkspace);
    }
  }
}

class _WorkspaceErrorText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              LocaleKeys.workspace_required.tr(),
              style: context.textStyles.bodySmall?.copyWith(
                color: context.colors.error,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
