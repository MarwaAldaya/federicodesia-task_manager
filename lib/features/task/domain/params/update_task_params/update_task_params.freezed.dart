// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_task_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateTaskParams {
  String get id;
  String get title;
  String? get description;
  DateTime? get dueDate;
  TaskPriority? get priority;
  TaskStatus get status;
  UserParams? get assignee;
  DateTime get updatedAt;

  /// Create a copy of UpdateTaskParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateTaskParamsCopyWith<UpdateTaskParams> get copyWith =>
      _$UpdateTaskParamsCopyWithImpl<UpdateTaskParams>(
          this as UpdateTaskParams, _$identity);

  /// Serializes this UpdateTaskParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateTaskParams &&
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
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, dueDate,
      priority, status, assignee, updatedAt);

  @override
  String toString() {
    return 'UpdateTaskParams(id: $id, title: $title, description: $description, dueDate: $dueDate, priority: $priority, status: $status, assignee: $assignee, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class $UpdateTaskParamsCopyWith<$Res> {
  factory $UpdateTaskParamsCopyWith(
          UpdateTaskParams value, $Res Function(UpdateTaskParams) _then) =
      _$UpdateTaskParamsCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      DateTime? dueDate,
      TaskPriority? priority,
      TaskStatus status,
      UserParams? assignee,
      DateTime updatedAt});

  $UserParamsCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$UpdateTaskParamsCopyWithImpl<$Res>
    implements $UpdateTaskParamsCopyWith<$Res> {
  _$UpdateTaskParamsCopyWithImpl(this._self, this._then);

  final UpdateTaskParams _self;
  final $Res Function(UpdateTaskParams) _then;

  /// Create a copy of UpdateTaskParams
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
    Object? updatedAt = null,
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
              as UserParams?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of UpdateTaskParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserParamsCopyWith<$Res>? get assignee {
    if (_self.assignee == null) {
      return null;
    }

    return $UserParamsCopyWith<$Res>(_self.assignee!, (value) {
      return _then(_self.copyWith(assignee: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UpdateTaskParams implements UpdateTaskParams {
  const _UpdateTaskParams(
      {required this.id,
      required this.title,
      this.description,
      this.dueDate,
      this.priority,
      required this.status,
      this.assignee,
      required this.updatedAt});
  factory _UpdateTaskParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateTaskParamsFromJson(json);

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
  final UserParams? assignee;
  @override
  final DateTime updatedAt;

  /// Create a copy of UpdateTaskParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTaskParamsCopyWith<_UpdateTaskParams> get copyWith =>
      __$UpdateTaskParamsCopyWithImpl<_UpdateTaskParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UpdateTaskParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTaskParams &&
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
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, dueDate,
      priority, status, assignee, updatedAt);

  @override
  String toString() {
    return 'UpdateTaskParams(id: $id, title: $title, description: $description, dueDate: $dueDate, priority: $priority, status: $status, assignee: $assignee, updatedAt: $updatedAt)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTaskParamsCopyWith<$Res>
    implements $UpdateTaskParamsCopyWith<$Res> {
  factory _$UpdateTaskParamsCopyWith(
          _UpdateTaskParams value, $Res Function(_UpdateTaskParams) _then) =
      __$UpdateTaskParamsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String? description,
      DateTime? dueDate,
      TaskPriority? priority,
      TaskStatus status,
      UserParams? assignee,
      DateTime updatedAt});

  @override
  $UserParamsCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$UpdateTaskParamsCopyWithImpl<$Res>
    implements _$UpdateTaskParamsCopyWith<$Res> {
  __$UpdateTaskParamsCopyWithImpl(this._self, this._then);

  final _UpdateTaskParams _self;
  final $Res Function(_UpdateTaskParams) _then;

  /// Create a copy of UpdateTaskParams
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
    Object? updatedAt = null,
  }) {
    return _then(_UpdateTaskParams(
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
              as UserParams?,
      updatedAt: null == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of UpdateTaskParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserParamsCopyWith<$Res>? get assignee {
    if (_self.assignee == null) {
      return null;
    }

    return $UserParamsCopyWith<$Res>(_self.assignee!, (value) {
      return _then(_self.copyWith(assignee: value));
    });
  }
}

// dart format on
