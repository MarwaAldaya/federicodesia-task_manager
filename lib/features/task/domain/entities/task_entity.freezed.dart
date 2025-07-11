// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskEntity {
  String get id;
  String get title;
  String? get description;
  DateTime? get dueDate;
  TaskPriority? get priority;
  TaskStatus get status;
  UserEntity? get assignee;
  DateTime? get createdAt;
  DateTime? get updatedAt;
  SyncStatus? get syncStatus;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TaskEntityCopyWith<TaskEntity> get copyWith =>
      _$TaskEntityCopyWithImpl<TaskEntity>(this as TaskEntity, _$identity);

  /// Serializes this TaskEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TaskEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignee, assignee) ||
                other.assignee == assignee) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, dueDate,
      priority, status, assignee, createdAt, updatedAt, syncStatus);

  @override
  String toString() {
    return 'TaskEntity(id: $id, title: $title, description: $description, dueDate: $dueDate, priority: $priority, status: $status, assignee: $assignee, createdAt: $createdAt, updatedAt: $updatedAt, syncStatus: $syncStatus)';
  }
}

/// @nodoc
abstract mixin class $TaskEntityCopyWith<$Res> {
  factory $TaskEntityCopyWith(
          TaskEntity value, $Res Function(TaskEntity) _then) =
      _$TaskEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      DateTime? dueDate,
      TaskPriority? priority,
      TaskStatus status,
      UserEntity? assignee,
      DateTime? createdAt,
      DateTime? updatedAt,
      SyncStatus? syncStatus});

  $UserEntityCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$TaskEntityCopyWithImpl<$Res> implements $TaskEntityCopyWith<$Res> {
  _$TaskEntityCopyWithImpl(this._self, this._then);

  final TaskEntity _self;
  final $Res Function(TaskEntity) _then;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? dueDate = freezed,
    Object? priority = freezed,
    Object? status = null,
    Object? assignee = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? syncStatus = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      assignee: freezed == assignee
          ? _self.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      syncStatus: freezed == syncStatus
          ? _self.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus?,
    ));
  }

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get assignee {
    if (_self.assignee == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_self.assignee!, (value) {
      return _then(_self.copyWith(assignee: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _TaskEntity implements TaskEntity {
  const _TaskEntity(
      {required this.id,
      required this.title,
      this.description,
      this.dueDate,
      this.priority,
      required this.status,
      this.assignee,
      this.createdAt,
      this.updatedAt,
      this.syncStatus});
  factory _TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final DateTime? dueDate;
  @override
  final TaskPriority? priority;
  @override
  final TaskStatus status;
  @override
  final UserEntity? assignee;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final SyncStatus? syncStatus;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TaskEntityCopyWith<_TaskEntity> get copyWith =>
      __$TaskEntityCopyWithImpl<_TaskEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TaskEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignee, assignee) ||
                other.assignee == assignee) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, dueDate,
      priority, status, assignee, createdAt, updatedAt, syncStatus);

  @override
  String toString() {
    return 'TaskEntity(id: $id, title: $title, description: $description, dueDate: $dueDate, priority: $priority, status: $status, assignee: $assignee, createdAt: $createdAt, updatedAt: $updatedAt, syncStatus: $syncStatus)';
  }
}

/// @nodoc
abstract mixin class _$TaskEntityCopyWith<$Res>
    implements $TaskEntityCopyWith<$Res> {
  factory _$TaskEntityCopyWith(
          _TaskEntity value, $Res Function(_TaskEntity) _then) =
      __$TaskEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      DateTime? dueDate,
      TaskPriority? priority,
      TaskStatus status,
      UserEntity? assignee,
      DateTime? createdAt,
      DateTime? updatedAt,
      SyncStatus? syncStatus});

  @override
  $UserEntityCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$TaskEntityCopyWithImpl<$Res> implements _$TaskEntityCopyWith<$Res> {
  __$TaskEntityCopyWithImpl(this._self, this._then);

  final _TaskEntity _self;
  final $Res Function(_TaskEntity) _then;

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? dueDate = freezed,
    Object? priority = freezed,
    Object? status = null,
    Object? assignee = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? syncStatus = freezed,
  }) {
    return _then(_TaskEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _self.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      priority: freezed == priority
          ? _self.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as TaskPriority?,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as TaskStatus,
      assignee: freezed == assignee
          ? _self.assignee
          : assignee // ignore: cast_nullable_to_non_nullable
              as UserEntity?,
      createdAt: freezed == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      syncStatus: freezed == syncStatus
          ? _self.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as SyncStatus?,
    ));
  }

  /// Create a copy of TaskEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserEntityCopyWith<$Res>? get assignee {
    if (_self.assignee == null) {
      return null;
    }

    return $UserEntityCopyWith<$Res>(_self.assignee!, (value) {
      return _then(_self.copyWith(assignee: value));
    });
  }
}

// dart format on
