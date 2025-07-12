import 'package:bloc_arch/core/domain/entities/failure.dart';
import 'package:bloc_arch/features/common/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/workspace/domain/entities/workspace_entity.dart';

part 'register_state.freezed.dart';

@freezed
abstract class RegisterState with _$RegisterState {
  const factory RegisterState({
    WorkspaceEntity? selectedWorkspace,
    required CycleStatus status,
    Failure? failure,
  }) = _RegisterState;

  factory RegisterState.initial() =>
      const RegisterState(status: CycleStatus.initial);
  factory RegisterState.loading() =>
      const RegisterState(status: CycleStatus.loading);
  factory RegisterState.success() =>
      const RegisterState(status: CycleStatus.success);
  factory RegisterState.failure(Failure failure) =>
      RegisterState(status: CycleStatus.failure, failure: failure);
}
