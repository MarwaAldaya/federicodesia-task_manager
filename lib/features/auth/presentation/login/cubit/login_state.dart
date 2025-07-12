import 'package:bloc_arch/core/domain/entities/failure.dart';
import 'package:bloc_arch/features/common/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
abstract class LoginState with _$LoginState {
  const factory LoginState({
    required String email,
    required String password,
    required bool isEmailValid,
    required bool isPasswordValid,
    required CycleStatus status,
    String? workspaceId,
    String? errorMessage,
  }) = _LoginState;

  factory LoginState.initial() => LoginState(
        email: '',
        password: '',
        isEmailValid: false,
        isPasswordValid: false,
        status: CycleStatus.initial,
        workspaceId: null,
        errorMessage: null,
      );
}
