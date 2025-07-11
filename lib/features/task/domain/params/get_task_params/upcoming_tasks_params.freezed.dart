// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upcoming_tasks_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpcomingTasksParams {
  String get userId;
  DateTime get dueDate;

  /// Create a copy of UpcomingTasksParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpcomingTasksParamsCopyWith<UpcomingTasksParams> get copyWith =>
      _$UpcomingTasksParamsCopyWithImpl<UpcomingTasksParams>(
          this as UpcomingTasksParams, _$identity);

  /// Serializes this UpcomingTasksParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpcomingTasksParams &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, dueDate);

  @override
  String toString() {
    return 'UpcomingTasksParams(userId: $userId, dueDate: $dueDate)';
  }
}

/// @nodoc
abstract mixin class $UpcomingTasksParamsCopyWith<$Res> {
  factory $UpcomingTasksParamsCopyWith(
          UpcomingTasksParams value, $Res Function(UpcomingTasksParams) _then) =
      _$UpcomingTasksParamsCopyWithImpl;
  @useResult
  $Res call({String userId, DateTime dueDate});
}

/// @nodoc
class _$UpcomingTasksParamsCopyWithImpl<$Res>
    implements $UpcomingTasksParamsCopyWith<$Res> {
  _$UpcomingTasksParamsCopyWithImpl(this._self, this._then);

  final UpcomingTasksParams _self;
  final $Res Function(UpcomingTasksParams) _then;

  /// Create a copy of UpcomingTasksParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? dueDate = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UpcomingTasksParams implements UpcomingTasksParams {
  const _UpcomingTasksParams({required this.userId, required this.dueDate});
  factory _UpcomingTasksParams.fromJson(Map<String, dynamic> json) =>
      _$UpcomingTasksParamsFromJson(json);

  @override
  final String userId;
  @override
  final DateTime dueDate;

  /// Create a copy of UpcomingTasksParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpcomingTasksParamsCopyWith<_UpcomingTasksParams> get copyWith =>
      __$UpcomingTasksParamsCopyWithImpl<_UpcomingTasksParams>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpcomingTasksParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpcomingTasksParams &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, dueDate);

  @override
  String toString() {
    return 'UpcomingTasksParams(userId: $userId, dueDate: $dueDate)';
  }
}

/// @nodoc
abstract mixin class _$UpcomingTasksParamsCopyWith<$Res>
    implements $UpcomingTasksParamsCopyWith<$Res> {
  factory _$UpcomingTasksParamsCopyWith(_UpcomingTasksParams value,
          $Res Function(_UpcomingTasksParams) _then) =
      __$UpcomingTasksParamsCopyWithImpl;
  @override
  @useResult
  $Res call({String userId, DateTime dueDate});
}

/// @nodoc
class __$UpcomingTasksParamsCopyWithImpl<$Res>
    implements _$UpcomingTasksParamsCopyWith<$Res> {
  __$UpcomingTasksParamsCopyWithImpl(this._self, this._then);

  final _UpcomingTasksParams _self;
  final $Res Function(_UpcomingTasksParams) _then;

  /// Create a copy of UpcomingTasksParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? dueDate = null,
  }) {
    return _then(_UpcomingTasksParams(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      dueDate: null == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
