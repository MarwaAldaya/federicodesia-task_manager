// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_task_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreateTaskParams {
  String? get id;
  String get title;
  String? get description;
  DateTime? get dueDate;
  TaskPriority? get priority;
  TaskStatus get status;
  UserParams? get assignee;

  /// Create a copy of CreateTaskParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CreateTaskParamsCopyWith<CreateTaskParams> get copyWith =>
      _$CreateTaskParamsCopyWithImpl<CreateTaskParams>(
          this as CreateTaskParams, _$identity);

  /// Serializes this CreateTaskParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CreateTaskParams &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignee, assignee) ||
                other.assignee == assignee));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, dueDate, priority, status, assignee);

  @override
  String toString() {
    return 'CreateTaskParams(id: $id, title: $title, description: $description, dueDate: $dueDate, priority: $priority, status: $status, assignee: $assignee)';
  }
}

/// @nodoc
abstract mixin class $CreateTaskParamsCopyWith<$Res> {
  factory $CreateTaskParamsCopyWith(
          CreateTaskParams value, $Res Function(CreateTaskParams) _then) =
      _$CreateTaskParamsCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String title,
      String? description,
      DateTime? dueDate,
      TaskPriority? priority,
      TaskStatus status,
      UserParams? assignee});

  $UserParamsCopyWith<$Res>? get assignee;
}

/// @nodoc
class _$CreateTaskParamsCopyWithImpl<$Res>
    implements $CreateTaskParamsCopyWith<$Res> {
  _$CreateTaskParamsCopyWithImpl(this._self, this._then);

  final CreateTaskParams _self;
  final $Res Function(CreateTaskParams) _then;

  /// Create a copy of CreateTaskParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? dueDate = freezed,
    Object? priority = freezed,
    Object? status = null,
    Object? assignee = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }

  /// Create a copy of CreateTaskParams
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
class _CreateTaskParams extends CreateTaskParams {
  const _CreateTaskParams(
      {this.id,
      required this.title,
      this.description,
      this.dueDate,
      this.priority,
      required this.status,
      this.assignee})
      : super._();
  factory _CreateTaskParams.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskParamsFromJson(json);

  @override
  final String? id;
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

  /// Create a copy of CreateTaskParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CreateTaskParamsCopyWith<_CreateTaskParams> get copyWith =>
      __$CreateTaskParamsCopyWithImpl<_CreateTaskParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CreateTaskParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CreateTaskParams &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignee, assignee) ||
                other.assignee == assignee));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, description, dueDate, priority, status, assignee);

  @override
  String toString() {
    return 'CreateTaskParams(id: $id, title: $title, description: $description, dueDate: $dueDate, priority: $priority, status: $status, assignee: $assignee)';
  }
}

/// @nodoc
abstract mixin class _$CreateTaskParamsCopyWith<$Res>
    implements $CreateTaskParamsCopyWith<$Res> {
  factory _$CreateTaskParamsCopyWith(
          _CreateTaskParams value, $Res Function(_CreateTaskParams) _then) =
      __$CreateTaskParamsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String title,
      String? description,
      DateTime? dueDate,
      TaskPriority? priority,
      TaskStatus status,
      UserParams? assignee});

  @override
  $UserParamsCopyWith<$Res>? get assignee;
}

/// @nodoc
class __$CreateTaskParamsCopyWithImpl<$Res>
    implements _$CreateTaskParamsCopyWith<$Res> {
  __$CreateTaskParamsCopyWithImpl(this._self, this._then);

  final _CreateTaskParams _self;
  final $Res Function(_CreateTaskParams) _then;

  /// Create a copy of CreateTaskParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? dueDate = freezed,
    Object? priority = freezed,
    Object? status = null,
    Object? assignee = freezed,
  }) {
    return _then(_CreateTaskParams(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
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
    ));
  }

  /// Create a copy of CreateTaskParams
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
