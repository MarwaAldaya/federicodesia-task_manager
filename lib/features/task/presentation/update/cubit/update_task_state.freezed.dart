// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateTaskState {
  CycleStatus get status;
  UpdateTaskParams get params;
  TaskEntity? get taskEntity;
  String? get errorMessage;

  /// Create a copy of UpdateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateTaskStateCopyWith<UpdateTaskState> get copyWith =>
      _$UpdateTaskStateCopyWithImpl<UpdateTaskState>(
          this as UpdateTaskState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateTaskState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.params, params) || other.params == params) &&
            (identical(other.taskEntity, taskEntity) ||
                other.taskEntity == taskEntity) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, params, taskEntity, errorMessage);

  @override
  String toString() {
    return 'UpdateTaskState(status: $status, params: $params, taskEntity: $taskEntity, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $UpdateTaskStateCopyWith<$Res> {
  factory $UpdateTaskStateCopyWith(
          UpdateTaskState value, $Res Function(UpdateTaskState) _then) =
      _$UpdateTaskStateCopyWithImpl;
  @useResult
  $Res call(
      {CycleStatus status,
      UpdateTaskParams params,
      TaskEntity? taskEntity,
      String? errorMessage});

  $UpdateTaskParamsCopyWith<$Res> get params;
  $TaskEntityCopyWith<$Res>? get taskEntity;
}

/// @nodoc
class _$UpdateTaskStateCopyWithImpl<$Res>
    implements $UpdateTaskStateCopyWith<$Res> {
  _$UpdateTaskStateCopyWithImpl(this._self, this._then);

  final UpdateTaskState _self;
  final $Res Function(UpdateTaskState) _then;

  /// Create a copy of UpdateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? params = null,
    Object? taskEntity = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CycleStatus,
      params: null == params
          ? _self.params
          : params // ignore: cast_nullable_to_non_nullable
              as UpdateTaskParams,
      taskEntity: freezed == taskEntity
          ? _self.taskEntity
          : taskEntity // ignore: cast_nullable_to_non_nullable
              as TaskEntity?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of UpdateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdateTaskParamsCopyWith<$Res> get params {
    return $UpdateTaskParamsCopyWith<$Res>(_self.params, (value) {
      return _then(_self.copyWith(params: value));
    });
  }

  /// Create a copy of UpdateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskEntityCopyWith<$Res>? get taskEntity {
    if (_self.taskEntity == null) {
      return null;
    }

    return $TaskEntityCopyWith<$Res>(_self.taskEntity!, (value) {
      return _then(_self.copyWith(taskEntity: value));
    });
  }
}

/// @nodoc

class _UpdateTaskState implements UpdateTaskState {
  const _UpdateTaskState(
      {this.status = CycleStatus.initial,
      required this.params,
      this.taskEntity,
      this.errorMessage});

  @override
  @JsonKey()
  final CycleStatus status;
  @override
  final UpdateTaskParams params;
  @override
  final TaskEntity? taskEntity;
  @override
  final String? errorMessage;

  /// Create a copy of UpdateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTaskStateCopyWith<_UpdateTaskState> get copyWith =>
      __$UpdateTaskStateCopyWithImpl<_UpdateTaskState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTaskState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.params, params) || other.params == params) &&
            (identical(other.taskEntity, taskEntity) ||
                other.taskEntity == taskEntity) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, status, params, taskEntity, errorMessage);

  @override
  String toString() {
    return 'UpdateTaskState(status: $status, params: $params, taskEntity: $taskEntity, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTaskStateCopyWith<$Res>
    implements $UpdateTaskStateCopyWith<$Res> {
  factory _$UpdateTaskStateCopyWith(
          _UpdateTaskState value, $Res Function(_UpdateTaskState) _then) =
      __$UpdateTaskStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CycleStatus status,
      UpdateTaskParams params,
      TaskEntity? taskEntity,
      String? errorMessage});

  @override
  $UpdateTaskParamsCopyWith<$Res> get params;
  @override
  $TaskEntityCopyWith<$Res>? get taskEntity;
}

/// @nodoc
class __$UpdateTaskStateCopyWithImpl<$Res>
    implements _$UpdateTaskStateCopyWith<$Res> {
  __$UpdateTaskStateCopyWithImpl(this._self, this._then);

  final _UpdateTaskState _self;
  final $Res Function(_UpdateTaskState) _then;

  /// Create a copy of UpdateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? params = null,
    Object? taskEntity = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_UpdateTaskState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CycleStatus,
      params: null == params
          ? _self.params
          : params // ignore: cast_nullable_to_non_nullable
              as UpdateTaskParams,
      taskEntity: freezed == taskEntity
          ? _self.taskEntity
          : taskEntity // ignore: cast_nullable_to_non_nullable
              as TaskEntity?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of UpdateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdateTaskParamsCopyWith<$Res> get params {
    return $UpdateTaskParamsCopyWith<$Res>(_self.params, (value) {
      return _then(_self.copyWith(params: value));
    });
  }

  /// Create a copy of UpdateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskEntityCopyWith<$Res>? get taskEntity {
    if (_self.taskEntity == null) {
      return null;
    }

    return $TaskEntityCopyWith<$Res>(_self.taskEntity!, (value) {
      return _then(_self.copyWith(taskEntity: value));
    });
  }
}

// dart format on
