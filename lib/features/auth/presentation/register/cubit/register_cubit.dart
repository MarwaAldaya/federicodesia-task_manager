import 'package:bloc_arch/core/const/data_store_keys.dart';
import 'package:bloc_arch/features/common/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_arch/features/workspace/domain/entities/workspace_entity.dart';
import 'package:bloc_arch/features/auth/domain/entities/register_param.dart';
import 'package:bloc_arch/features/workspace/domain/params/workspace_params.dart';
import 'package:bloc_arch/features/auth/domain/use_cases/signup_usecase.dart';
import 'package:bloc_arch/core/app/app_preferences.dart';

import 'register_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

@injectable
class RegisterCubit extends Cubit<RegisterState> {
  final SignupUseCase signupUseCase;
  RegisterCubit(this.signupUseCase) : super(RegisterState.initial());

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void updateWorkspace(WorkspaceEntity? workspace) {
    emit(state.copyWith(selectedWorkspace: workspace));
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate() || state.selectedWorkspace == null)
      return;
    emit(state.copyWith(status: CycleStatus.loading));
    final params = RegisterParams(
      email: emailController.text,
      password: passwordController.text,
      workspace: WorkSpaceParams(
        id: state.selectedWorkspace!.id,
        name: state.selectedWorkspace!.name,
      ),
    );
    final result = await signupUseCase(
      params: params,
    );
    result.fold(
      (failure) {
        emit(state.copyWith(
            status: CycleStatus.failure, failure: failure.failure));
      },
      (authModel) async {
        if (authModel.user != null) {
          await AppPreferences.setValue<String>(
              DataStoreKeys.userId, authModel.user!.id);
        }
        emit(state.copyWith(
          status: CycleStatus.success,
        ));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
