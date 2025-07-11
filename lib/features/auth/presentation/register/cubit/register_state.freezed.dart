// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterState {
  WorkspaceEntity? get selectedWorkspace;
  CycleStatus get status;
  Failure? get failure;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterStateCopyWith<RegisterState> get copyWith =>
      _$RegisterStateCopyWithImpl<RegisterState>(
          this as RegisterState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterState &&
            (identical(other.selectedWorkspace, selectedWorkspace) ||
                other.selectedWorkspace == selectedWorkspace) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedWorkspace, status, failure);

  @override
  String toString() {
    return 'RegisterState(selectedWorkspace: $selectedWorkspace, status: $status, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) _then) =
      _$RegisterStateCopyWithImpl;
  @useResult
  $Res call(
      {WorkspaceEntity? selectedWorkspace,
      CycleStatus status,
      Failure? failure});

  $WorkspaceEntityCopyWith<$Res>? get selectedWorkspace;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._self, this._then);

  final RegisterState _self;
  final $Res Function(RegisterState) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedWorkspace = freezed,
    Object? status = null,
    Object? failure = freezed,
  }) {
    return _then(_self.copyWith(
      selectedWorkspace: freezed == selectedWorkspace
          ? _self.selectedWorkspace
          : selectedWorkspace // ignore: cast_nullable_to_non_nullable
              as WorkspaceEntity?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CycleStatus,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkspaceEntityCopyWith<$Res>? get selectedWorkspace {
    if (_self.selectedWorkspace == null) {
      return null;
    }

    return $WorkspaceEntityCopyWith<$Res>(_self.selectedWorkspace!, (value) {
      return _then(_self.copyWith(selectedWorkspace: value));
    });
  }
}

/// @nodoc

class _RegisterState implements RegisterState {
  const _RegisterState(
      {this.selectedWorkspace, required this.status, this.failure});

  @override
  final WorkspaceEntity? selectedWorkspace;
  @override
  final CycleStatus status;
  @override
  final Failure? failure;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterStateCopyWith<_RegisterState> get copyWith =>
      __$RegisterStateCopyWithImpl<_RegisterState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterState &&
            (identical(other.selectedWorkspace, selectedWorkspace) ||
                other.selectedWorkspace == selectedWorkspace) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedWorkspace, status, failure);

  @override
  String toString() {
    return 'RegisterState(selectedWorkspace: $selectedWorkspace, status: $status, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class _$RegisterStateCopyWith<$Res>
    implements $RegisterStateCopyWith<$Res> {
  factory _$RegisterStateCopyWith(
          _RegisterState value, $Res Function(_RegisterState) _then) =
      __$RegisterStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {WorkspaceEntity? selectedWorkspace,
      CycleStatus status,
      Failure? failure});

  @override
  $WorkspaceEntityCopyWith<$Res>? get selectedWorkspace;
}

/// @nodoc
class __$RegisterStateCopyWithImpl<$Res>
    implements _$RegisterStateCopyWith<$Res> {
  __$RegisterStateCopyWithImpl(this._self, this._then);

  final _RegisterState _self;
  final $Res Function(_RegisterState) _then;

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedWorkspace = freezed,
    Object? status = null,
    Object? failure = freezed,
  }) {
    return _then(_RegisterState(
      selectedWorkspace: freezed == selectedWorkspace
          ? _self.selectedWorkspace
          : selectedWorkspace // ignore: cast_nullable_to_non_nullable
              as WorkspaceEntity?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CycleStatus,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }

  /// Create a copy of RegisterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkspaceEntityCopyWith<$Res>? get selectedWorkspace {
    if (_self.selectedWorkspace == null) {
      return null;
    }

    return $WorkspaceEntityCopyWith<$Res>(_self.selectedWorkspace!, (value) {
      return _then(_self.copyWith(selectedWorkspace: value));
    });
  }
}

// dart format on
