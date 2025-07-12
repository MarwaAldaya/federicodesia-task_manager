// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'filter_date_button_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FilterDateButtonState {
  DateTime? get selectedDate;

  /// Create a copy of FilterDateButtonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FilterDateButtonStateCopyWith<FilterDateButtonState> get copyWith =>
      _$FilterDateButtonStateCopyWithImpl<FilterDateButtonState>(
          this as FilterDateButtonState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FilterDateButtonState &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDate);

  @override
  String toString() {
    return 'FilterDateButtonState(selectedDate: $selectedDate)';
  }
}

/// @nodoc
abstract mixin class $FilterDateButtonStateCopyWith<$Res> {
  factory $FilterDateButtonStateCopyWith(FilterDateButtonState value,
          $Res Function(FilterDateButtonState) _then) =
      _$FilterDateButtonStateCopyWithImpl;
  @useResult
  $Res call({DateTime? selectedDate});
}

/// @nodoc
class _$FilterDateButtonStateCopyWithImpl<$Res>
    implements $FilterDateButtonStateCopyWith<$Res> {
  _$FilterDateButtonStateCopyWithImpl(this._self, this._then);

  final FilterDateButtonState _self;
  final $Res Function(FilterDateButtonState) _then;

  /// Create a copy of FilterDateButtonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = freezed,
  }) {
    return _then(_self.copyWith(
      selectedDate: freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _FilterDateButtonState implements FilterDateButtonState {
  const _FilterDateButtonState({this.selectedDate});

  @override
  final DateTime? selectedDate;

  /// Create a copy of FilterDateButtonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FilterDateButtonStateCopyWith<_FilterDateButtonState> get copyWith =>
      __$FilterDateButtonStateCopyWithImpl<_FilterDateButtonState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FilterDateButtonState &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedDate);

  @override
  String toString() {
    return 'FilterDateButtonState(selectedDate: $selectedDate)';
  }
}

/// @nodoc
abstract mixin class _$FilterDateButtonStateCopyWith<$Res>
    implements $FilterDateButtonStateCopyWith<$Res> {
  factory _$FilterDateButtonStateCopyWith(_FilterDateButtonState value,
          $Res Function(_FilterDateButtonState) _then) =
      __$FilterDateButtonStateCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime? selectedDate});
}

/// @nodoc
class __$FilterDateButtonStateCopyWithImpl<$Res>
    implements _$FilterDateButtonStateCopyWith<$Res> {
  __$FilterDateButtonStateCopyWithImpl(this._self, this._then);

  final _FilterDateButtonState _self;
  final $Res Function(_FilterDateButtonState) _then;

  /// Create a copy of FilterDateButtonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedDate = freezed,
  }) {
    return _then(_FilterDateButtonState(
      selectedDate: freezed == selectedDate
          ? _self.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
