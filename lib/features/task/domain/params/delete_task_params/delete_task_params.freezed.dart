// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_task_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeleteTaskParams {
  String get id;

  /// Create a copy of DeleteTaskParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteTaskParamsCopyWith<DeleteTaskParams> get copyWith =>
      _$DeleteTaskParamsCopyWithImpl<DeleteTaskParams>(
          this as DeleteTaskParams, _$identity);

  /// Serializes this DeleteTaskParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteTaskParams &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'DeleteTaskParams(id: $id)';
  }
}

/// @nodoc
abstract mixin class $DeleteTaskParamsCopyWith<$Res> {
  factory $DeleteTaskParamsCopyWith(
          DeleteTaskParams value, $Res Function(DeleteTaskParams) _then) =
      _$DeleteTaskParamsCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$DeleteTaskParamsCopyWithImpl<$Res>
    implements $DeleteTaskParamsCopyWith<$Res> {
  _$DeleteTaskParamsCopyWithImpl(this._self, this._then);

  final DeleteTaskParams _self;
  final $Res Function(DeleteTaskParams) _then;

  /// Create a copy of DeleteTaskParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _DeleteTaskParams implements DeleteTaskParams {
  const _DeleteTaskParams({required this.id});
  factory _DeleteTaskParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteTaskParamsFromJson(json);

  @override
  final String id;

  /// Create a copy of DeleteTaskParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteTaskParamsCopyWith<_DeleteTaskParams> get copyWith =>
      __$DeleteTaskParamsCopyWithImpl<_DeleteTaskParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DeleteTaskParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteTaskParams &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'DeleteTaskParams(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$DeleteTaskParamsCopyWith<$Res>
    implements $DeleteTaskParamsCopyWith<$Res> {
  factory _$DeleteTaskParamsCopyWith(
          _DeleteTaskParams value, $Res Function(_DeleteTaskParams) _then) =
      __$DeleteTaskParamsCopyWithImpl;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$DeleteTaskParamsCopyWithImpl<$Res>
    implements _$DeleteTaskParamsCopyWith<$Res> {
  __$DeleteTaskParamsCopyWithImpl(this._self, this._then);

  final _DeleteTaskParams _self;
  final $Res Function(_DeleteTaskParams) _then;

  /// Create a copy of DeleteTaskParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_DeleteTaskParams(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
