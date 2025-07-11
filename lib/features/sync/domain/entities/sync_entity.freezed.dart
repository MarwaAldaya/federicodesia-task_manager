// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncEntity {
  String get id; // sync op id (UUID)
  String get recordId; // task id
  String get feature; // e.g., 'task'
  String get operationType; // create/update/delete
  String get syncStatus; // needSync, failed, etc.
  DateTime get createdAt;
  DateTime? get updatedAt;
  @JsonKey(includeIfNull: true)
  Map<String, dynamic>? get operationParamsJson;

  /// Create a copy of SyncEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SyncEntityCopyWith<SyncEntity> get copyWith =>
      _$SyncEntityCopyWithImpl<SyncEntity>(this as SyncEntity, _$identity);

  /// Serializes this SyncEntity to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SyncEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recordId, recordId) ||
                other.recordId == recordId) &&
            (identical(other.feature, feature) || other.feature == feature) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other.operationParamsJson, operationParamsJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      recordId,
      feature,
      operationType,
      syncStatus,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(operationParamsJson));

  @override
  String toString() {
    return 'SyncEntity(id: $id, recordId: $recordId, feature: $feature, operationType: $operationType, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt, operationParamsJson: $operationParamsJson)';
  }
}

/// @nodoc
abstract mixin class $SyncEntityCopyWith<$Res> {
  factory $SyncEntityCopyWith(
          SyncEntity value, $Res Function(SyncEntity) _then) =
      _$SyncEntityCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String recordId,
      String feature,
      String operationType,
      String syncStatus,
      DateTime createdAt,
      DateTime? updatedAt,
      @JsonKey(includeIfNull: true) Map<String, dynamic>? operationParamsJson});
}

/// @nodoc
class _$SyncEntityCopyWithImpl<$Res> implements $SyncEntityCopyWith<$Res> {
  _$SyncEntityCopyWithImpl(this._self, this._then);

  final SyncEntity _self;
  final $Res Function(SyncEntity) _then;

  /// Create a copy of SyncEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? recordId = null,
    Object? feature = null,
    Object? operationType = null,
    Object? syncStatus = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? operationParamsJson = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recordId: null == recordId
          ? _self.recordId
          : recordId // ignore: cast_nullable_to_non_nullable
              as String,
      feature: null == feature
          ? _self.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as String,
      operationType: null == operationType
          ? _self.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as String,
      syncStatus: null == syncStatus
          ? _self.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      operationParamsJson: freezed == operationParamsJson
          ? _self.operationParamsJson
          : operationParamsJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SyncEntity implements SyncEntity {
  const _SyncEntity(
      {required this.id,
      required this.recordId,
      required this.feature,
      required this.operationType,
      required this.syncStatus,
      required this.createdAt,
      required this.updatedAt,
      @JsonKey(includeIfNull: true)
      final Map<String, dynamic>? operationParamsJson})
      : _operationParamsJson = operationParamsJson;
  factory _SyncEntity.fromJson(Map<String, dynamic> json) =>
      _$SyncEntityFromJson(json);

  @override
  final String id;
// sync op id (UUID)
  @override
  final String recordId;
// task id
  @override
  final String feature;
// e.g., 'task'
  @override
  final String operationType;
// create/update/delete
  @override
  final String syncStatus;
// needSync, failed, etc.
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;
  final Map<String, dynamic>? _operationParamsJson;
  @override
  @JsonKey(includeIfNull: true)
  Map<String, dynamic>? get operationParamsJson {
    final value = _operationParamsJson;
    if (value == null) return null;
    if (_operationParamsJson is EqualUnmodifiableMapView)
      return _operationParamsJson;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Create a copy of SyncEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SyncEntityCopyWith<_SyncEntity> get copyWith =>
      __$SyncEntityCopyWithImpl<_SyncEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SyncEntityToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SyncEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.recordId, recordId) ||
                other.recordId == recordId) &&
            (identical(other.feature, feature) || other.feature == feature) &&
            (identical(other.operationType, operationType) ||
                other.operationType == operationType) &&
            (identical(other.syncStatus, syncStatus) ||
                other.syncStatus == syncStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality()
                .equals(other._operationParamsJson, _operationParamsJson));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      recordId,
      feature,
      operationType,
      syncStatus,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_operationParamsJson));

  @override
  String toString() {
    return 'SyncEntity(id: $id, recordId: $recordId, feature: $feature, operationType: $operationType, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt, operationParamsJson: $operationParamsJson)';
  }
}

/// @nodoc
abstract mixin class _$SyncEntityCopyWith<$Res>
    implements $SyncEntityCopyWith<$Res> {
  factory _$SyncEntityCopyWith(
          _SyncEntity value, $Res Function(_SyncEntity) _then) =
      __$SyncEntityCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String recordId,
      String feature,
      String operationType,
      String syncStatus,
      DateTime createdAt,
      DateTime? updatedAt,
      @JsonKey(includeIfNull: true) Map<String, dynamic>? operationParamsJson});
}

/// @nodoc
class __$SyncEntityCopyWithImpl<$Res> implements _$SyncEntityCopyWith<$Res> {
  __$SyncEntityCopyWithImpl(this._self, this._then);

  final _SyncEntity _self;
  final $Res Function(_SyncEntity) _then;

  /// Create a copy of SyncEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? recordId = null,
    Object? feature = null,
    Object? operationType = null,
    Object? syncStatus = null,
    Object? createdAt = null,
    Object? updatedAt = freezed,
    Object? operationParamsJson = freezed,
  }) {
    return _then(_SyncEntity(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      recordId: null == recordId
          ? _self.recordId
          : recordId // ignore: cast_nullable_to_non_nullable
              as String,
      feature: null == feature
          ? _self.feature
          : feature // ignore: cast_nullable_to_non_nullable
              as String,
      operationType: null == operationType
          ? _self.operationType
          : operationType // ignore: cast_nullable_to_non_nullable
              as String,
      syncStatus: null == syncStatus
          ? _self.syncStatus
          : syncStatus // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: freezed == updatedAt
          ? _self.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      operationParamsJson: freezed == operationParamsJson
          ? _self._operationParamsJson
          : operationParamsJson // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

// dart format on
