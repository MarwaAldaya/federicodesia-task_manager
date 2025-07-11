// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkSpaceParams {
  String get id;
  String get name;

  /// Create a copy of WorkSpaceParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkSpaceParamsCopyWith<WorkSpaceParams> get copyWith =>
      _$WorkSpaceParamsCopyWithImpl<WorkSpaceParams>(
          this as WorkSpaceParams, _$identity);

  /// Serializes this WorkSpaceParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkSpaceParams &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'WorkSpaceParams(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $WorkSpaceParamsCopyWith<$Res> {
  factory $WorkSpaceParamsCopyWith(
          WorkSpaceParams value, $Res Function(WorkSpaceParams) _then) =
      _$WorkSpaceParamsCopyWithImpl;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$WorkSpaceParamsCopyWithImpl<$Res>
    implements $WorkSpaceParamsCopyWith<$Res> {
  _$WorkSpaceParamsCopyWithImpl(this._self, this._then);

  final WorkSpaceParams _self;
  final $Res Function(WorkSpaceParams) _then;

  /// Create a copy of WorkSpaceParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WorkSpaceParams extends WorkSpaceParams {
  const _WorkSpaceParams({required this.id, required this.name}) : super._();
  factory _WorkSpaceParams.fromJson(Map<String, dynamic> json) =>
      _$WorkSpaceParamsFromJson(json);

  @override
  final String id;
  @override
  final String name;

  /// Create a copy of WorkSpaceParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkSpaceParamsCopyWith<_WorkSpaceParams> get copyWith =>
      __$WorkSpaceParamsCopyWithImpl<_WorkSpaceParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkSpaceParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkSpaceParams &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'WorkSpaceParams(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$WorkSpaceParamsCopyWith<$Res>
    implements $WorkSpaceParamsCopyWith<$Res> {
  factory _$WorkSpaceParamsCopyWith(
          _WorkSpaceParams value, $Res Function(_WorkSpaceParams) _then) =
      __$WorkSpaceParamsCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$WorkSpaceParamsCopyWithImpl<$Res>
    implements _$WorkSpaceParamsCopyWith<$Res> {
  __$WorkSpaceParamsCopyWithImpl(this._self, this._then);

  final _WorkSpaceParams _self;
  final $Res Function(_WorkSpaceParams) _then;

  /// Create a copy of WorkSpaceParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_WorkSpaceParams(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
