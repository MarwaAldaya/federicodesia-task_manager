// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserParams {
  String get id;
  String get username;
  String? get email;

  /// Create a copy of UserParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserParamsCopyWith<UserParams> get copyWith =>
      _$UserParamsCopyWithImpl<UserParams>(this as UserParams, _$identity);

  /// Serializes this UserParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserParams &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, email);

  @override
  String toString() {
    return 'UserParams(id: $id, username: $username, email: $email)';
  }
}

/// @nodoc
abstract mixin class $UserParamsCopyWith<$Res> {
  factory $UserParamsCopyWith(
          UserParams value, $Res Function(UserParams) _then) =
      _$UserParamsCopyWithImpl;
  @useResult
  $Res call({String id, String username, String? email});
}

/// @nodoc
class _$UserParamsCopyWithImpl<$Res> implements $UserParamsCopyWith<$Res> {
  _$UserParamsCopyWithImpl(this._self, this._then);

  final UserParams _self;
  final $Res Function(UserParams) _then;

  /// Create a copy of UserParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserParams extends UserParams {
  const _UserParams(
      {required this.id, required this.username, required this.email})
      : super._();
  factory _UserParams.fromJson(Map<String, dynamic> json) =>
      _$UserParamsFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String? email;

  /// Create a copy of UserParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserParamsCopyWith<_UserParams> get copyWith =>
      __$UserParamsCopyWithImpl<_UserParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserParams &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, email);

  @override
  String toString() {
    return 'UserParams(id: $id, username: $username, email: $email)';
  }
}

/// @nodoc
abstract mixin class _$UserParamsCopyWith<$Res>
    implements $UserParamsCopyWith<$Res> {
  factory _$UserParamsCopyWith(
          _UserParams value, $Res Function(_UserParams) _then) =
      __$UserParamsCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String username, String? email});
}

/// @nodoc
class __$UserParamsCopyWithImpl<$Res> implements _$UserParamsCopyWith<$Res> {
  __$UserParamsCopyWithImpl(this._self, this._then);

  final _UserParams _self;
  final $Res Function(_UserParams) _then;

  /// Create a copy of UserParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = freezed,
  }) {
    return _then(_UserParams(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
