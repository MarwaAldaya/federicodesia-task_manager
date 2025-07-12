// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workspace_dropdown_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkspaceDropdownState {
  List<WorkspaceEntity> get allWorkspaces;
  List<String> get items;
  String get selectedWorkspaceId;
  WorkspaceDropdownStatus get status;
  Failure? get failure;

  /// Create a copy of WorkspaceDropdownState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WorkspaceDropdownStateCopyWith<WorkspaceDropdownState> get copyWith =>
      _$WorkspaceDropdownStateCopyWithImpl<WorkspaceDropdownState>(
          this as WorkspaceDropdownState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WorkspaceDropdownState &&
            const DeepCollectionEquality()
                .equals(other.allWorkspaces, allWorkspaces) &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.selectedWorkspaceId, selectedWorkspaceId) ||
                other.selectedWorkspaceId == selectedWorkspaceId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(allWorkspaces),
      const DeepCollectionEquality().hash(items),
      selectedWorkspaceId,
      status,
      failure);

  @override
  String toString() {
    return 'WorkspaceDropdownState(allWorkspaces: $allWorkspaces, items: $items, selectedWorkspaceId: $selectedWorkspaceId, status: $status, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class $WorkspaceDropdownStateCopyWith<$Res> {
  factory $WorkspaceDropdownStateCopyWith(WorkspaceDropdownState value,
          $Res Function(WorkspaceDropdownState) _then) =
      _$WorkspaceDropdownStateCopyWithImpl;
  @useResult
  $Res call(
      {List<WorkspaceEntity> allWorkspaces,
      List<String> items,
      String selectedWorkspaceId,
      WorkspaceDropdownStatus status,
      Failure? failure});
}

/// @nodoc
class _$WorkspaceDropdownStateCopyWithImpl<$Res>
    implements $WorkspaceDropdownStateCopyWith<$Res> {
  _$WorkspaceDropdownStateCopyWithImpl(this._self, this._then);

  final WorkspaceDropdownState _self;
  final $Res Function(WorkspaceDropdownState) _then;

  /// Create a copy of WorkspaceDropdownState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allWorkspaces = null,
    Object? items = null,
    Object? selectedWorkspaceId = null,
    Object? status = null,
    Object? failure = freezed,
  }) {
    return _then(_self.copyWith(
      allWorkspaces: null == allWorkspaces
          ? _self.allWorkspaces
          : allWorkspaces // ignore: cast_nullable_to_non_nullable
              as List<WorkspaceEntity>,
      items: null == items
          ? _self.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedWorkspaceId: null == selectedWorkspaceId
          ? _self.selectedWorkspaceId
          : selectedWorkspaceId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkspaceDropdownStatus,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _WorkspaceDropdownState extends WorkspaceDropdownState {
  const _WorkspaceDropdownState(
      {final List<WorkspaceEntity> allWorkspaces = const [],
      final List<String> items = const [],
      this.selectedWorkspaceId = '',
      this.status = WorkspaceDropdownStatus.initial,
      this.failure})
      : _allWorkspaces = allWorkspaces,
        _items = items,
        super._();

  final List<WorkspaceEntity> _allWorkspaces;
  @override
  @JsonKey()
  List<WorkspaceEntity> get allWorkspaces {
    if (_allWorkspaces is EqualUnmodifiableListView) return _allWorkspaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allWorkspaces);
  }

  final List<String> _items;
  @override
  @JsonKey()
  List<String> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final String selectedWorkspaceId;
  @override
  @JsonKey()
  final WorkspaceDropdownStatus status;
  @override
  final Failure? failure;

  /// Create a copy of WorkspaceDropdownState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WorkspaceDropdownStateCopyWith<_WorkspaceDropdownState> get copyWith =>
      __$WorkspaceDropdownStateCopyWithImpl<_WorkspaceDropdownState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WorkspaceDropdownState &&
            const DeepCollectionEquality()
                .equals(other._allWorkspaces, _allWorkspaces) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.selectedWorkspaceId, selectedWorkspaceId) ||
                other.selectedWorkspaceId == selectedWorkspaceId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.failure, failure) || other.failure == failure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allWorkspaces),
      const DeepCollectionEquality().hash(_items),
      selectedWorkspaceId,
      status,
      failure);

  @override
  String toString() {
    return 'WorkspaceDropdownState(allWorkspaces: $allWorkspaces, items: $items, selectedWorkspaceId: $selectedWorkspaceId, status: $status, failure: $failure)';
  }
}

/// @nodoc
abstract mixin class _$WorkspaceDropdownStateCopyWith<$Res>
    implements $WorkspaceDropdownStateCopyWith<$Res> {
  factory _$WorkspaceDropdownStateCopyWith(_WorkspaceDropdownState value,
          $Res Function(_WorkspaceDropdownState) _then) =
      __$WorkspaceDropdownStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {List<WorkspaceEntity> allWorkspaces,
      List<String> items,
      String selectedWorkspaceId,
      WorkspaceDropdownStatus status,
      Failure? failure});
}

/// @nodoc
class __$WorkspaceDropdownStateCopyWithImpl<$Res>
    implements _$WorkspaceDropdownStateCopyWith<$Res> {
  __$WorkspaceDropdownStateCopyWithImpl(this._self, this._then);

  final _WorkspaceDropdownState _self;
  final $Res Function(_WorkspaceDropdownState) _then;

  /// Create a copy of WorkspaceDropdownState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? allWorkspaces = null,
    Object? items = null,
    Object? selectedWorkspaceId = null,
    Object? status = null,
    Object? failure = freezed,
  }) {
    return _then(_WorkspaceDropdownState(
      allWorkspaces: null == allWorkspaces
          ? _self._allWorkspaces
          : allWorkspaces // ignore: cast_nullable_to_non_nullable
              as List<WorkspaceEntity>,
      items: null == items
          ? _self._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selectedWorkspaceId: null == selectedWorkspaceId
          ? _self.selectedWorkspaceId
          : selectedWorkspaceId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as WorkspaceDropdownStatus,
      failure: freezed == failure
          ? _self.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

// dart format on
