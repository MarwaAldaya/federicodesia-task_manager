// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskState {
  StateStatus get status;
  List<TaskEntity> get tasks;
  List<UserEntity> get selectedUsers;
  FilterTaskParams? get currentFilter;
  String? get errorMessage;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskStateCopyWith<TaskState> get copyWith =>
      _$TaskStateCopyWithImpl<TaskState>(this as TaskState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.tasks, tasks) &&
            const DeepCollectionEquality()
                .equals(other.selectedUsers, selectedUsers) &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(tasks),
      const DeepCollectionEquality().hash(selectedUsers),
      currentFilter,
      errorMessage);

  @override
  String toString() {
    return 'TaskState(status: $status, tasks: $tasks, selectedUsers: $selectedUsers, currentFilter: $currentFilter, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $TaskStateCopyWith<$Res> {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) _then) =
      _$TaskStateCopyWithImpl;
  @useResult
  $Res call(
      {StateStatus status,
      List<TaskEntity> tasks,
      List<UserEntity> selectedUsers,
      FilterTaskParams? currentFilter,
      String? errorMessage});
}

/// @nodoc
class _$TaskStateCopyWithImpl<$Res> implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._self, this._then);

  final TaskState _self;
  final $Res Function(TaskState) _then;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? tasks = null,
    Object? selectedUsers = null,
    Object? currentFilter = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      tasks: null == tasks
          ? _self.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      selectedUsers: null == selectedUsers
          ? _self.selectedUsers
          : selectedUsers // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
      currentFilter: freezed == currentFilter
          ? _self.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as FilterTaskParams?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _TaskState extends TaskState {
  const _TaskState(
      {this.status = StateStatus.initial,
      final List<TaskEntity> tasks = const [],
      final List<UserEntity> selectedUsers = const [],
      this.currentFilter,
      this.errorMessage})
      : _tasks = tasks,
        _selectedUsers = selectedUsers,
        super._();

  @override
  @JsonKey()
  final StateStatus status;
  final List<TaskEntity> _tasks;
  @override
  @JsonKey()
  List<TaskEntity> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  final List<UserEntity> _selectedUsers;
  @override
  @JsonKey()
  List<UserEntity> get selectedUsers {
    if (_selectedUsers is EqualUnmodifiableListView) return _selectedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedUsers);
  }

  @override
  final FilterTaskParams? currentFilter;
  @override
  final String? errorMessage;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskStateCopyWith<_TaskState> get copyWith =>
      __$TaskStateCopyWithImpl<_TaskState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskState &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            const DeepCollectionEquality()
                .equals(other._selectedUsers, _selectedUsers) &&
            (identical(other.currentFilter, currentFilter) ||
                other.currentFilter == currentFilter) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      status,
      const DeepCollectionEquality().hash(_tasks),
      const DeepCollectionEquality().hash(_selectedUsers),
      currentFilter,
      errorMessage);

  @override
  String toString() {
    return 'TaskState(status: $status, tasks: $tasks, selectedUsers: $selectedUsers, currentFilter: $currentFilter, errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class _$TaskStateCopyWith<$Res>
    implements $TaskStateCopyWith<$Res> {
  factory _$TaskStateCopyWith(
          _TaskState value, $Res Function(_TaskState) _then) =
      __$TaskStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {StateStatus status,
      List<TaskEntity> tasks,
      List<UserEntity> selectedUsers,
      FilterTaskParams? currentFilter,
      String? errorMessage});
}

/// @nodoc
class __$TaskStateCopyWithImpl<$Res> implements _$TaskStateCopyWith<$Res> {
  __$TaskStateCopyWithImpl(this._self, this._then);

  final _TaskState _self;
  final $Res Function(_TaskState) _then;

  /// Create a copy of TaskState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? tasks = null,
    Object? selectedUsers = null,
    Object? currentFilter = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_TaskState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as StateStatus,
      tasks: null == tasks
          ? _self._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<TaskEntity>,
      selectedUsers: null == selectedUsers
          ? _self._selectedUsers
          : selectedUsers // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
      currentFilter: freezed == currentFilter
          ? _self.currentFilter
          : currentFilter // ignore: cast_nullable_to_non_nullable
              as FilterTaskParams?,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
