import 'package:bloc_arch/core/const/data_store_keys.dart';
import 'package:bloc_arch/core/utils/text_fields_validation.dart';
import 'package:bloc_arch/features/auth/domain/entities/login_param.dart';
import 'package:bloc_arch/features/auth/domain/use_cases/login_usecase.dart';
import 'package:bloc_arch/features/common/enums/enums.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';

import 'package:injectable/injectable.dart';
import 'package:easy_localization/easy_localization.dart';

import 'login_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_arch/core/app/app_preferences.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  LoginCubit(this.loginUseCase) : super(LoginState.initial());

  void emailChanged(String value) {
    final isValid = Validator.validateEmail(value) == null;
    emit(state.copyWith(
      email: value,
      isEmailValid: isValid,
      status: CycleStatus.initial,
      errorMessage: null,
    ));
  }

  void passwordChanged(String value) {
    final isValid = Validator.validatePassword(value) == null;
    emit(state.copyWith(
      password: value,
      isPasswordValid: isValid,
      status: CycleStatus.initial,
      errorMessage: null,
    ));
  }

  void workspaceChanged(String? workspaceId) {
    emit(state.copyWith(workspaceId: workspaceId));
  }

  Future<void> loginSubmitted() async {
    if (!state.isEmailValid ||
        !state.isPasswordValid ||
        state.workspaceId == null) {
      emit(state.copyWith(
        status: CycleStatus.failure,
        errorMessage: LocaleKeys.error_invalid_email_password_workspace.tr(),
      ));
      return;
    }
    emit(state.copyWith(status: CycleStatus.loading, errorMessage: null));
    final result = await loginUseCase(
      params: LoginParams(
        email: state.email,
        password: state.password,
        workspaceId: state.workspaceId!,
      ),
    );
    result.fold(
        (failure) => emit(state.copyWith(
              status: CycleStatus.failure,
              errorMessage: failure.failure.message,
            )), (authModel) async {
      emit(state.copyWith(
        status: CycleStatus.success,
        errorMessage: null,
      ));
      await AppPreferences.setValue<String>(
          DataStoreKeys.userId, authModel.user!.id);
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
