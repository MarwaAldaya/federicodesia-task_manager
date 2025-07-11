// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
AuthModel _$AuthModelFromJson(Map<String, dynamic> json) {
  return _LoginModel.fromJson(json);
}

/// @nodoc
mixin _$AuthModel {
  UserModel? get user;
  String? get token;

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AuthModelCopyWith<AuthModel> get copyWith =>
      _$AuthModelCopyWithImpl<AuthModel>(this as AuthModel, _$identity);

  /// Serializes this AuthModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AuthModel &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, token);

  @override
  String toString() {
    return 'AuthModel(user: $user, token: $token)';
  }
}

/// @nodoc
abstract mixin class $AuthModelCopyWith<$Res> {
  factory $AuthModelCopyWith(AuthModel value, $Res Function(AuthModel) _then) =
      _$AuthModelCopyWithImpl;
  @useResult
  $Res call({UserModel? user, String? token});

  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthModelCopyWithImpl<$Res> implements $AuthModelCopyWith<$Res> {
  _$AuthModelCopyWithImpl(this._self, this._then);

  final AuthModel _self;
  final $Res Function(AuthModel) _then;

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_self.copyWith(
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _LoginModel implements AuthModel {
  _LoginModel({this.user, this.token});
  factory _LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  @override
  final UserModel? user;
  @override
  final String? token;

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginModelCopyWith<_LoginModel> get copyWith =>
      __$LoginModelCopyWithImpl<_LoginModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoginModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginModel &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, user, token);

  @override
  String toString() {
    return 'AuthModel(user: $user, token: $token)';
  }
}

/// @nodoc
abstract mixin class _$LoginModelCopyWith<$Res>
    implements $AuthModelCopyWith<$Res> {
  factory _$LoginModelCopyWith(
          _LoginModel value, $Res Function(_LoginModel) _then) =
      __$LoginModelCopyWithImpl;
  @override
  @useResult
  $Res call({UserModel? user, String? token});

  @override
  $UserModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$LoginModelCopyWithImpl<$Res> implements _$LoginModelCopyWith<$Res> {
  __$LoginModelCopyWithImpl(this._self, this._then);

  final _LoginModel _self;
  final $Res Function(_LoginModel) _then;

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = freezed,
    Object? token = freezed,
  }) {
    return _then(_LoginModel(
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      token: freezed == token
          ? _self.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of AuthModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }
}

// dart format on
