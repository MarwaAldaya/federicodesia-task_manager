// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginState {
  String get email;
  String get password;
  bool get isEmailValid;
  bool get isPasswordValid;
  CycleStatus get status;
  String? get workspaceId;
  String? get errorMessage;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginStateCopyWith<LoginState> get copyWith =>
      _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isEmailValid, isEmailValid) ||
                other.isEmailValid == isEmailValid) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                other.isPasswordValid == isPasswordValid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, isEmailValid,
      isPasswordValid, status, workspaceId, errorMessage);

  @override
  String toString() {
    return 'LoginState(email: $email, password: $password, isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, status: $status, workspaceId: $workspaceId, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) _then) =
      _$LoginStateCopyWithImpl;
  @useResult
  $Res call(
      {String email,
      String password,
      bool isEmailValid,
      bool isPasswordValid,
      CycleStatus status,
      String? workspaceId,
      String? errorMessage});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isEmailValid = null,
    Object? isPasswordValid = null,
    Object? status = null,
    Object? workspaceId = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isEmailValid: null == isEmailValid
          ? _self.isEmailValid
          : isEmailValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordValid: null == isPasswordValid
          ? _self.isPasswordValid
          : isPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CycleStatus,
      workspaceId: freezed == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _LoginState implements LoginState {
  const _LoginState(
      {required this.email,
      required this.password,
      required this.isEmailValid,
      required this.isPasswordValid,
      required this.status,
      this.workspaceId,
      this.errorMessage});

  @override
  final String email;
  @override
  final String password;
  @override
  final bool isEmailValid;
  @override
  final bool isPasswordValid;
  @override
  final CycleStatus status;
  @override
  final String? workspaceId;
  @override
  final String? errorMessage;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isEmailValid, isEmailValid) ||
                other.isEmailValid == isEmailValid) &&
            (identical(other.isPasswordValid, isPasswordValid) ||
                other.isPasswordValid == isPasswordValid) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.workspaceId, workspaceId) ||
                other.workspaceId == workspaceId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password, isEmailValid,
      isPasswordValid, status, workspaceId, errorMessage);

  @override
  String toString() {
    return 'LoginState(email: $email, password: $password, isEmailValid: $isEmailValid, isPasswordValid: $isPasswordValid, status: $status, workspaceId: $workspaceId, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) _then) =
      __$LoginStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      bool isEmailValid,
      bool isPasswordValid,
      CycleStatus status,
      String? workspaceId,
      String? errorMessage});
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? isEmailValid = null,
    Object? isPasswordValid = null,
    Object? status = null,
    Object? workspaceId = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_LoginState(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isEmailValid: null == isEmailValid
          ? _self.isEmailValid
          : isEmailValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isPasswordValid: null == isPasswordValid
          ? _self.isPasswordValid
          : isPasswordValid // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CycleStatus,
      workspaceId: freezed == workspaceId
          ? _self.workspaceId
          : workspaceId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
