// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TaskEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TaskEvent()';
  }
}

/// @nodoc
class $TaskEventCopyWith<$Res> {
  $TaskEventCopyWith(TaskEvent _, $Res Function(TaskEvent) __);
}

/// @nodoc

class LoadTasks implements TaskEvent {
  const LoadTasks();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadTasks);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TaskEvent.loadTasks()';
  }
}

/// @nodoc

class SelectUsers implements TaskEvent {
  const SelectUsers(final List<UserEntity> users) : _users = users;

  final List<UserEntity> _users;
  List<UserEntity> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectUsersCopyWith<SelectUsers> get copyWith =>
      _$SelectUsersCopyWithImpl<SelectUsers>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectUsers &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_users));

  @override
  String toString() {
    return 'TaskEvent.selectUsers(users: $users)';
  }
}

/// @nodoc
abstract mixin class $SelectUsersCopyWith<$Res>
    implements $TaskEventCopyWith<$Res> {
  factory $SelectUsersCopyWith(
          SelectUsers value, $Res Function(SelectUsers) _then) =
      _$SelectUsersCopyWithImpl;
  @useResult
  $Res call({List<UserEntity> users});
}

/// @nodoc
class _$SelectUsersCopyWithImpl<$Res> implements $SelectUsersCopyWith<$Res> {
  _$SelectUsersCopyWithImpl(this._self, this._then);

  final SelectUsers _self;
  final $Res Function(SelectUsers) _then;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? users = null,
  }) {
    return _then(SelectUsers(
      null == users
          ? _self._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<UserEntity>,
    ));
  }
}

/// @nodoc

class SelectStatuses implements TaskEvent {
  const SelectStatuses(final List<TaskStatus> statuses) : _statuses = statuses;

  final List<TaskStatus> _statuses;
  List<TaskStatus> get statuses {
    if (_statuses is EqualUnmodifiableListView) return _statuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_statuses);
  }

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectStatusesCopyWith<SelectStatuses> get copyWith =>
      _$SelectStatusesCopyWithImpl<SelectStatuses>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectStatuses &&
            const DeepCollectionEquality().equals(other._statuses, _statuses));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_statuses));

  @override
  String toString() {
    return 'TaskEvent.selectStatuses(statuses: $statuses)';
  }
}

/// @nodoc
abstract mixin class $SelectStatusesCopyWith<$Res>
    implements $TaskEventCopyWith<$Res> {
  factory $SelectStatusesCopyWith(
          SelectStatuses value, $Res Function(SelectStatuses) _then) =
      _$SelectStatusesCopyWithImpl;
  @useResult
  $Res call({List<TaskStatus> statuses});
}

/// @nodoc
class _$SelectStatusesCopyWithImpl<$Res>
    implements $SelectStatusesCopyWith<$Res> {
  _$SelectStatusesCopyWithImpl(this._self, this._then);

  final SelectStatuses _self;
  final $Res Function(SelectStatuses) _then;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statuses = null,
  }) {
    return _then(SelectStatuses(
      null == statuses
          ? _self._statuses
          : statuses // ignore: cast_nullable_to_non_nullable
              as List<TaskStatus>,
    ));
  }
}

/// @nodoc

class SelectDate implements TaskEvent {
  const SelectDate(this.date);

  final DateTime? date;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SelectDateCopyWith<SelectDate> get copyWith =>
      _$SelectDateCopyWithImpl<SelectDate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SelectDate &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @override
  String toString() {
    return 'TaskEvent.selectDate(date: $date)';
  }
}

/// @nodoc
abstract mixin class $SelectDateCopyWith<$Res>
    implements $TaskEventCopyWith<$Res> {
  factory $SelectDateCopyWith(
          SelectDate value, $Res Function(SelectDate) _then) =
      _$SelectDateCopyWithImpl;
  @useResult
  $Res call({DateTime? date});
}

/// @nodoc
class _$SelectDateCopyWithImpl<$Res> implements $SelectDateCopyWith<$Res> {
  _$SelectDateCopyWithImpl(this._self, this._then);

  final SelectDate _self;
  final $Res Function(SelectDate) _then;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? date = freezed,
  }) {
    return _then(SelectDate(
      freezed == date
          ? _self.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class RefreshTasks implements TaskEvent {
  const RefreshTasks();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is RefreshTasks);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TaskEvent.refreshTasks()';
  }
}

/// @nodoc

class AddTaskLocally implements TaskEvent {
  const AddTaskLocally(this.task);

  final TaskEntity task;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddTaskLocallyCopyWith<AddTaskLocally> get copyWith =>
      _$AddTaskLocallyCopyWithImpl<AddTaskLocally>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddTaskLocally &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  @override
  String toString() {
    return 'TaskEvent.addTaskLocally(task: $task)';
  }
}

/// @nodoc
abstract mixin class $AddTaskLocallyCopyWith<$Res>
    implements $TaskEventCopyWith<$Res> {
  factory $AddTaskLocallyCopyWith(
          AddTaskLocally value, $Res Function(AddTaskLocally) _then) =
      _$AddTaskLocallyCopyWithImpl;
  @useResult
  $Res call({TaskEntity task});

  $TaskEntityCopyWith<$Res> get task;
}

/// @nodoc
class _$AddTaskLocallyCopyWithImpl<$Res>
    implements $AddTaskLocallyCopyWith<$Res> {
  _$AddTaskLocallyCopyWithImpl(this._self, this._then);

  final AddTaskLocally _self;
  final $Res Function(AddTaskLocally) _then;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? task = null,
  }) {
    return _then(AddTaskLocally(
      null == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskEntity,
    ));
  }

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskEntityCopyWith<$Res> get task {
    return $TaskEntityCopyWith<$Res>(_self.task, (value) {
      return _then(_self.copyWith(task: value));
    });
  }
}

/// @nodoc

class UpdateTaskLocally implements TaskEvent {
  const UpdateTaskLocally(this.task);

  final TaskEntity task;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateTaskLocallyCopyWith<UpdateTaskLocally> get copyWith =>
      _$UpdateTaskLocallyCopyWithImpl<UpdateTaskLocally>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateTaskLocally &&
            (identical(other.task, task) || other.task == task));
  }

  @override
  int get hashCode => Object.hash(runtimeType, task);

  @override
  String toString() {
    return 'TaskEvent.updateTaskLocally(task: $task)';
  }
}

/// @nodoc
abstract mixin class $UpdateTaskLocallyCopyWith<$Res>
    implements $TaskEventCopyWith<$Res> {
  factory $UpdateTaskLocallyCopyWith(
          UpdateTaskLocally value, $Res Function(UpdateTaskLocally) _then) =
      _$UpdateTaskLocallyCopyWithImpl;
  @useResult
  $Res call({TaskEntity task});

  $TaskEntityCopyWith<$Res> get task;
}

/// @nodoc
class _$UpdateTaskLocallyCopyWithImpl<$Res>
    implements $UpdateTaskLocallyCopyWith<$Res> {
  _$UpdateTaskLocallyCopyWithImpl(this._self, this._then);

  final UpdateTaskLocally _self;
  final $Res Function(UpdateTaskLocally) _then;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? task = null,
  }) {
    return _then(UpdateTaskLocally(
      null == task
          ? _self.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskEntity,
    ));
  }

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TaskEntityCopyWith<$Res> get task {
    return $TaskEntityCopyWith<$Res>(_self.task, (value) {
      return _then(_self.copyWith(task: value));
    });
  }
}

/// @nodoc

class DeleteTask implements TaskEvent {
  const DeleteTask(this.taskId);

  final String taskId;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DeleteTaskCopyWith<DeleteTask> get copyWith =>
      _$DeleteTaskCopyWithImpl<DeleteTask>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DeleteTask &&
            (identical(other.taskId, taskId) || other.taskId == taskId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taskId);

  @override
  String toString() {
    return 'TaskEvent.deleteTask(taskId: $taskId)';
  }
}

/// @nodoc
abstract mixin class $DeleteTaskCopyWith<$Res>
    implements $TaskEventCopyWith<$Res> {
  factory $DeleteTaskCopyWith(
          DeleteTask value, $Res Function(DeleteTask) _then) =
      _$DeleteTaskCopyWithImpl;
  @useResult
  $Res call({String taskId});
}

/// @nodoc
class _$DeleteTaskCopyWithImpl<$Res> implements $DeleteTaskCopyWith<$Res> {
  _$DeleteTaskCopyWithImpl(this._self, this._then);

  final DeleteTask _self;
  final $Res Function(DeleteTask) _then;

  /// Create a copy of TaskEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? taskId = null,
  }) {
    return _then(DeleteTask(
      null == taskId
          ? _self.taskId
          : taskId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
