// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkspaceEntity {
  String get id;
  String get name;

  /// Create a copy of WorkspaceEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkspaceEntityCopyWith<WorkspaceEntity> get copyWith =>
      _$WorkspaceEntityCopyWithImpl<WorkspaceEntity>(
          this as WorkspaceEntity, _$identity);

  /// Serializes this WorkspaceEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkspaceEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'WorkspaceEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class $WorkspaceEntityCopyWith<$Res> {
  factory $WorkspaceEntityCopyWith(
          WorkspaceEntity value, $Res Function(WorkspaceEntity) _then) =
      _$WorkspaceEntityCopyWithImpl;
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class _$WorkspaceEntityCopyWithImpl<$Res>
    implements $WorkspaceEntityCopyWith<$Res> {
  _$WorkspaceEntityCopyWithImpl(this._self, this._then);

  final WorkspaceEntity _self;
  final $Res Function(WorkspaceEntity) _then;

  /// Create a copy of WorkspaceEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WorkspaceEntity implements WorkspaceEntity {
  const _WorkspaceEntity({required this.id, required this.name});
  factory _WorkspaceEntity.fromJson(Map<String, dynamic> json) =>
      _$WorkspaceEntityFromJson(json);

  @override
  final String id;
  @override
  final String name;

  /// Create a copy of WorkspaceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkspaceEntityCopyWith<_WorkspaceEntity> get copyWith =>
      __$WorkspaceEntityCopyWithImpl<_WorkspaceEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WorkspaceEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkspaceEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @override
  String toString() {
    return 'WorkspaceEntity(id: $id, name: $name)';
  }
}

/// @nodoc
abstract mixin class _$WorkspaceEntityCopyWith<$Res>
    implements $WorkspaceEntityCopyWith<$Res> {
  factory _$WorkspaceEntityCopyWith(
          _WorkspaceEntity value, $Res Function(_WorkspaceEntity) _then) =
      __$WorkspaceEntityCopyWithImpl;
  @override
  @useResult
  $Res call({String id, String name});
}

/// @nodoc
class __$WorkspaceEntityCopyWithImpl<$Res>
    implements _$WorkspaceEntityCopyWith<$Res> {
  __$WorkspaceEntityCopyWithImpl(this._self, this._then);

  final _WorkspaceEntity _self;
  final $Res Function(_WorkspaceEntity) _then;

  /// Create a copy of WorkspaceEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_WorkspaceEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
