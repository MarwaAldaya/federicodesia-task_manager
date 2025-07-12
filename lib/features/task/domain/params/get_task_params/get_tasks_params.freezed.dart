// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_tasks_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetTasksParams {
  FilterTaskParams? get filterParams;

  /// Create a copy of GetTasksParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetTasksParamsCopyWith<GetTasksParams> get copyWith =>
      _$GetTasksParamsCopyWithImpl<GetTasksParams>(
          this as GetTasksParams, _$identity);

  /// Serializes this GetTasksParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetTasksParams &&
            (identical(other.filterParams, filterParams) ||
                other.filterParams == filterParams));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, filterParams);

  @override
  String toString() {
    return 'GetTasksParams(filterParams: $filterParams)';
  }
}

/// @nodoc
abstract mixin class $GetTasksParamsCopyWith<$Res> {
  factory $GetTasksParamsCopyWith(
          GetTasksParams value, $Res Function(GetTasksParams) _then) =
      _$GetTasksParamsCopyWithImpl;
  @useResult
  $Res call({FilterTaskParams? filterParams});
}

/// @nodoc
class _$GetTasksParamsCopyWithImpl<$Res>
    implements $GetTasksParamsCopyWith<$Res> {
  _$GetTasksParamsCopyWithImpl(this._self, this._then);

  final GetTasksParams _self;
  final $Res Function(GetTasksParams) _then;

  /// Create a copy of GetTasksParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filterParams = freezed,
  }) {
    return _then(_self.copyWith(
      filterParams: freezed == filterParams
          ? _self.filterParams
          : filterParams // ignore: cast_nullable_to_non_nullable
              as FilterTaskParams?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GetTasksParams implements GetTasksParams {
  const _GetTasksParams({this.filterParams});
  factory _GetTasksParams.fromJson(Map<String, dynamic> json) =>
      _$GetTasksParamsFromJson(json);

  @override
  final FilterTaskParams? filterParams;

  /// Create a copy of GetTasksParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetTasksParamsCopyWith<_GetTasksParams> get copyWith =>
      __$GetTasksParamsCopyWithImpl<_GetTasksParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GetTasksParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetTasksParams &&
            (identical(other.filterParams, filterParams) ||
                other.filterParams == filterParams));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, filterParams);

  @override
  String toString() {
    return 'GetTasksParams(filterParams: $filterParams)';
  }
}

/// @nodoc
abstract mixin class _$GetTasksParamsCopyWith<$Res>
    implements $GetTasksParamsCopyWith<$Res> {
  factory _$GetTasksParamsCopyWith(
          _GetTasksParams value, $Res Function(_GetTasksParams) _then) =
      __$GetTasksParamsCopyWithImpl;
  @override
  @useResult
  $Res call({FilterTaskParams? filterParams});
}

/// @nodoc
class __$GetTasksParamsCopyWithImpl<$Res>
    implements _$GetTasksParamsCopyWith<$Res> {
  __$GetTasksParamsCopyWithImpl(this._self, this._then);

  final _GetTasksParams _self;
  final $Res Function(_GetTasksParams) _then;

  /// Create a copy of GetTasksParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filterParams = freezed,
  }) {
    return _then(_GetTasksParams(
      filterParams: freezed == filterParams
          ? _self.filterParams
          : filterParams // ignore: cast_nullable_to_non_nullable
              as FilterTaskParams?,
    ));
  }
}

// dart format on
