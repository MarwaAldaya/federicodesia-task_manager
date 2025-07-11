// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTaskState {
  CycleStatus get status;
  CreateTaskParams get params;
  TaskEntity? get taskEntity;
  String? get errorMessage;

  /// Create a copy of CreateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateTaskStateCopyWith<CreateTaskState> get copyWith =>
      _$CreateTaskStateCopyWithImpl<CreateTaskState>(
          this as CreateTaskState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateTaskState &&
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
    return 'CreateTaskState(status: $status, params: $params, taskEntity: $taskEntity, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $CreateTaskStateCopyWith<$Res> {
  factory $CreateTaskStateCopyWith(
          CreateTaskState value, $Res Function(CreateTaskState) _then) =
      _$CreateTaskStateCopyWithImpl;
  @useResult
  $Res call(
      {CycleStatus status,
      CreateTaskParams params,
      TaskEntity? taskEntity,
      String? errorMessage});

  $CreateTaskParamsCopyWith<$Res> get params;
  $TaskEntityCopyWith<$Res>? get taskEntity;
}

/// @nodoc
class _$CreateTaskStateCopyWithImpl<$Res>
    implements $CreateTaskStateCopyWith<$Res> {
  _$CreateTaskStateCopyWithImpl(this._self, this._then);

  final CreateTaskState _self;
  final $Res Function(CreateTaskState) _then;

  /// Create a copy of CreateTaskState
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
              as CreateTaskParams,
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

  /// Create a copy of CreateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateTaskParamsCopyWith<$Res> get params {
    return $CreateTaskParamsCopyWith<$Res>(_self.params, (value) {
      return _then(_self.copyWith(params: value));
    });
  }

  /// Create a copy of CreateTaskState
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

class _CreateTaskState implements CreateTaskState {
  const _CreateTaskState(
      {required this.status,
      required this.params,
      this.taskEntity,
      this.errorMessage});

  @override
  final CycleStatus status;
  @override
  final CreateTaskParams params;
  @override
  final TaskEntity? taskEntity;
  @override
  final String? errorMessage;

  /// Create a copy of CreateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateTaskStateCopyWith<_CreateTaskState> get copyWith =>
      __$CreateTaskStateCopyWithImpl<_CreateTaskState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateTaskState &&
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
    return 'CreateTaskState(status: $status, params: $params, taskEntity: $taskEntity, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$CreateTaskStateCopyWith<$Res>
    implements $CreateTaskStateCopyWith<$Res> {
  factory _$CreateTaskStateCopyWith(
          _CreateTaskState value, $Res Function(_CreateTaskState) _then) =
      __$CreateTaskStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CycleStatus status,
      CreateTaskParams params,
      TaskEntity? taskEntity,
      String? errorMessage});

  @override
  $CreateTaskParamsCopyWith<$Res> get params;
  @override
  $TaskEntityCopyWith<$Res>? get taskEntity;
}

/// @nodoc
class __$CreateTaskStateCopyWithImpl<$Res>
    implements _$CreateTaskStateCopyWith<$Res> {
  __$CreateTaskStateCopyWithImpl(this._self, this._then);

  final _CreateTaskState _self;
  final $Res Function(_CreateTaskState) _then;

  /// Create a copy of CreateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? params = null,
    Object? taskEntity = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_CreateTaskState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CycleStatus,
      params: null == params
          ? _self.params
          : params // ignore: cast_nullable_to_non_nullable
              as CreateTaskParams,
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

  /// Create a copy of CreateTaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CreateTaskParamsCopyWith<$Res> get params {
    return $CreateTaskParamsCopyWith<$Res>(_self.params, (value) {
      return _then(_self.copyWith(params: value));
    });
  }

  /// Create a copy of CreateTaskState
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
