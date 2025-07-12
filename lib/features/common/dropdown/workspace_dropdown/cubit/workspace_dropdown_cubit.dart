import 'package:bloc_arch/features/workspace/domain/entities/workspace_entity.dart';
import 'package:bloc_arch/features/workspace/domain/use_cases/get_all_workspaces_usecase.dart';
import 'package:bloc_arch/features/workspace/domain/use_cases/get_workspaces_for_user_usecase.dart';
import 'package:bloc_arch/core/domain/use_cases/usecase.dart';
import 'package:bloc_arch/core/domain/entities/failure.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'workspace_dropdown_state.dart';

@injectable
class WorkspaceDropdownCubit extends Cubit<WorkspaceDropdownState> {
  final GetAllWorkspacesUseCase _getAllWorkspacesUseCase;
  final GetWorkspacesForUserUseCase _getWorkspacesForUserUseCase;

  WorkspaceDropdownCubit(
    this._getAllWorkspacesUseCase,
    this._getWorkspacesForUserUseCase,
  ) : super(const WorkspaceDropdownState());

  Future<void> fetchWorkspaces({bool isForUser = false, String? email}) async {
    // Only call the request if both items and allWorkspaces are empty
    // if (state.items.isNotEmpty || state.allWorkspaces.isNotEmpty) {
    //   return;
    // }

    emit(state.copyWith(status: WorkspaceDropdownStatus.loading));

    try {
      final result = isForUser && email != null
          ? await _getWorkspacesForUserUseCase(params: email)
          : await _getAllWorkspacesUseCase(params: NoParams());

      result.fold(
        (failure) => emit(state.copyWith(
            failure: Failure(
                0, failure.failure.message ?? 'Failed to fetch workspaces'),
            status: WorkspaceDropdownStatus.error)),
        (workspaces) {
          emit(state.copyWith(
            allWorkspaces: workspaces,
            items: workspaces.map((e) => e.name).toList(),
            status: WorkspaceDropdownStatus.success,
          ));
        },
      );
    } catch (e) {
      emit(state.copyWith(
        failure: Failure(0, e.toString()),
        status: WorkspaceDropdownStatus.error,
      ));
    }
  }

  void selectWorkspace(String? workspaceId) {
    emit(state.copyWith(selectedWorkspaceId: workspaceId ?? ""));
  }

  void selectWorkspaceByName(String? workspaceName) {
    if (workspaceName == null) {
      selectWorkspace(null);
      return;
    }

    final workspace = _findWorkspaceByName(workspaceName);
    if (workspace != null) {
      selectWorkspace(workspace.id);
      checkIfValid();
    }
  }

  WorkspaceEntity? _findWorkspaceByName(String name) {
    try {
      return state.allWorkspaces.firstWhere((w) => w.name == name);
    } catch (e) {
      return null;
    }
  }

  bool checkIfValid({bool isFieldRequired = true}) {
    final valid = !isFieldRequired || state.selectedWorkspaceId.isNotEmpty;
    final status = valid
        ? WorkspaceDropdownStatus.success
        : WorkspaceDropdownStatus.requiredFieldError;
    emit(state.copyWith(status: status));
    return valid;
  }

  WorkspaceEntity? getSelectedWorkspace() {
    final index = state.allWorkspaces
        .indexWhere((w) => w.id == state.selectedWorkspaceId);
    return index != -1 ? state.allWorkspaces[index] : null;
  }

  String? getSelectedWorkspaceName() {
    final selectedWorkspace = getSelectedWorkspace();
    return selectedWorkspace?.name;
  }

  List<String> getWorkspaceNames() {
    return state.allWorkspaces.map((e) => e.name).toList();
  }

  bool get isReadOnly => false; // Can be made configurable if needed

  Future<bool> onBeforePopupOpening() async {
    if (state.allWorkspaces.isEmpty) {
      await fetchWorkspaces();
    }
    return true;
  }
}
