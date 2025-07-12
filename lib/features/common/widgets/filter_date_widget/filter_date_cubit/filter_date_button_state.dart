import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_date_button_state.freezed.dart';

@freezed
sealed class FilterDateButtonState with _$FilterDateButtonState {
  const factory FilterDateButtonState({
    DateTime? selectedDate,
  }) = _FilterDateButtonState;
}
