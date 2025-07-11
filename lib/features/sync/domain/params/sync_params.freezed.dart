// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sync_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SyncParams {
  String get id; // sync op id (UUID)
  String get recordId; // task id
  String get feature; // e.g., FeatureNames.task
  String get operationType; // OperationTypes.create/update/delete
  @SyncStatusConverter()
  SyncStatus get syncStatus; // needSync, failed, etc.
  DateTime get createdAt;
  DateTime? get updatedAt;
  @JsonKey(includeIfNull: true)
  Map<String, dynamic>? get operationParamsJson;

  /// Create a copy of SyncParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SyncParamsCopyWith<SyncParams> get copyWith =>
      _$SyncParamsCopyWithImpl<SyncParams>(this as SyncParams, _$identity);

  /// Serializes this SyncParams to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SyncParams &&
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
    return 'SyncParams(id: $id, recordId: $recordId, feature: $feature, operationType: $operationType, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt, operationParamsJson: $operationParamsJson)';
  }
}

/// @nodoc
abstract mixin class $SyncParamsCopyWith<$Res> {
  factory $SyncParamsCopyWith(
          SyncParams value, $Res Function(SyncParams) _then) =
      _$SyncParamsCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String recordId,
      String feature,
      String operationType,
      @SyncStatusConverter() SyncStatus syncStatus,
      DateTime createdAt,
      DateTime? updatedAt,
      @JsonKey(includeIfNull: true) Map<String, dynamic>? operationParamsJson});
}

/// @nodoc
class _$SyncParamsCopyWithImpl<$Res> implements $SyncParamsCopyWith<$Res> {
  _$SyncParamsCopyWithImpl(this._self, this._then);

  final SyncParams _self;
  final $Res Function(SyncParams) _then;

  /// Create a copy of SyncParams
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
              as SyncStatus,
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
class _SyncParams implements SyncParams {
  const _SyncParams(
      {required this.id,
      required this.recordId,
      required this.feature,
      required this.operationType,
      @SyncStatusConverter() required this.syncStatus,
      required this.createdAt,
      this.updatedAt,
      @JsonKey(includeIfNull: true)
      final Map<String, dynamic>? operationParamsJson})
      : _operationParamsJson = operationParamsJson;
  factory _SyncParams.fromJson(Map<String, dynamic> json) =>
      _$SyncParamsFromJson(json);

  @override
  final String id;
// sync op id (UUID)
  @override
  final String recordId;
// task id
  @override
  final String feature;
// e.g., FeatureNames.task
  @override
  final String operationType;
// OperationTypes.create/update/delete
  @override
  @SyncStatusConverter()
  final SyncStatus syncStatus;
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

  /// Create a copy of SyncParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SyncParamsCopyWith<_SyncParams> get copyWith =>
      __$SyncParamsCopyWithImpl<_SyncParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SyncParamsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SyncParams &&
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
    return 'SyncParams(id: $id, recordId: $recordId, feature: $feature, operationType: $operationType, syncStatus: $syncStatus, createdAt: $createdAt, updatedAt: $updatedAt, operationParamsJson: $operationParamsJson)';
  }
}

/// @nodoc
abstract mixin class _$SyncParamsCopyWith<$Res>
    implements $SyncParamsCopyWith<$Res> {
  factory _$SyncParamsCopyWith(
          _SyncParams value, $Res Function(_SyncParams) _then) =
      __$SyncParamsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String recordId,
      String feature,
      String operationType,
      @SyncStatusConverter() SyncStatus syncStatus,
      DateTime createdAt,
      DateTime? updatedAt,
      @JsonKey(includeIfNull: true) Map<String, dynamic>? operationParamsJson});
}

/// @nodoc
class __$SyncParamsCopyWithImpl<$Res> implements _$SyncParamsCopyWith<$Res> {
  __$SyncParamsCopyWithImpl(this._self, this._then);

  final _SyncParams _self;
  final $Res Function(_SyncParams) _then;

  /// Create a copy of SyncParams
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
    return _then(_SyncParams(
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
              as SyncStatus,
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
