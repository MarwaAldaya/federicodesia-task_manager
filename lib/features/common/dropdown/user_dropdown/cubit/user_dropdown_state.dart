import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/user/domain/entities/user_entity.dart';

part 'user_dropdown_state.freezed.dart';

@freezed
sealed class UserDropdownState with _$UserDropdownState {
  const factory UserDropdownState.initial() = Initial;
  const factory UserDropdownState.loading() = Loading;
  const factory UserDropdownState.success(List<UserEntity> users) = Success;
  const factory UserDropdownState.failure(String message) = Failure;
}
