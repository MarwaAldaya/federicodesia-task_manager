import 'package:bloc_arch/features/common/enums/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
sealed class SplashState with _$SplashState {
  const factory SplashState({
    required CycleStatus status,

    /// You can add more shared fields here if needed
  }) = _SplashState;

  factory SplashState.initial() =>
      const SplashState(status: CycleStatus.initial);

  factory SplashState.loading() =>
      const SplashState(status: CycleStatus.loading);

  factory SplashState.success() =>
      const SplashState(status: CycleStatus.success);
}
