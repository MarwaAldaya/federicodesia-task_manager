// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterParams {
  String get email;
  String get password;
  WorkSpaceParams get workspace;

  /// Create a copy of RegisterParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RegisterParamsCopyWith<RegisterParams> get copyWith =>
      _$RegisterParamsCopyWithImpl<RegisterParams>(
          this as RegisterParams, _$identity);

  /// Serializes this RegisterParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RegisterParams &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.workspace, workspace) ||
                other.workspace == workspace));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, workspace);

  @override
  String toString() {
    return 'RegisterParams(email: $email, password: $password, workspace: $workspace)';
  }
}

/// @nodoc
abstract mixin class $RegisterParamsCopyWith<$Res> {
  factory $RegisterParamsCopyWith(
          RegisterParams value, $Res Function(RegisterParams) _then) =
      _$RegisterParamsCopyWithImpl;
  @useResult
  $Res call({String email, String password, WorkSpaceParams workspace});

  $WorkSpaceParamsCopyWith<$Res> get workspace;
}

/// @nodoc
class _$RegisterParamsCopyWithImpl<$Res>
    implements $RegisterParamsCopyWith<$Res> {
  _$RegisterParamsCopyWithImpl(this._self, this._then);

  final RegisterParams _self;
  final $Res Function(RegisterParams) _then;

  /// Create a copy of RegisterParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? workspace = null,
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
      workspace: null == workspace
          ? _self.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as WorkSpaceParams,
    ));
  }

  /// Create a copy of RegisterParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkSpaceParamsCopyWith<$Res> get workspace {
    return $WorkSpaceParamsCopyWith<$Res>(_self.workspace, (value) {
      return _then(_self.copyWith(workspace: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _RegisterParams implements RegisterParams {
  const _RegisterParams(
      {required this.email, required this.password, required this.workspace});
  factory _RegisterParams.fromJson(Map<String, dynamic> json) =>
      _$RegisterParamsFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final WorkSpaceParams workspace;

  /// Create a copy of RegisterParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RegisterParamsCopyWith<_RegisterParams> get copyWith =>
      __$RegisterParamsCopyWithImpl<_RegisterParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RegisterParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RegisterParams &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.workspace, workspace) ||
                other.workspace == workspace));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, workspace);

  @override
  String toString() {
    return 'RegisterParams(email: $email, password: $password, workspace: $workspace)';
  }
}

/// @nodoc
abstract mixin class _$RegisterParamsCopyWith<$Res>
    implements $RegisterParamsCopyWith<$Res> {
  factory _$RegisterParamsCopyWith(
          _RegisterParams value, $Res Function(_RegisterParams) _then) =
      __$RegisterParamsCopyWithImpl;
  @override
  @useResult
  $Res call({String email, String password, WorkSpaceParams workspace});

  @override
  $WorkSpaceParamsCopyWith<$Res> get workspace;
}

/// @nodoc
class __$RegisterParamsCopyWithImpl<$Res>
    implements _$RegisterParamsCopyWith<$Res> {
  __$RegisterParamsCopyWithImpl(this._self, this._then);

  final _RegisterParams _self;
  final $Res Function(_RegisterParams) _then;

  /// Create a copy of RegisterParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? workspace = null,
  }) {
    return _then(_RegisterParams(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      workspace: null == workspace
          ? _self.workspace
          : workspace // ignore: cast_nullable_to_non_nullable
              as WorkSpaceParams,
    ));
  }

  /// Create a copy of RegisterParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkSpaceParamsCopyWith<$Res> get workspace {
    return $WorkSpaceParamsCopyWith<$Res>(_self.workspace, (value) {
      return _then(_self.copyWith(workspace: value));
    });
  }
}

// dart format on
