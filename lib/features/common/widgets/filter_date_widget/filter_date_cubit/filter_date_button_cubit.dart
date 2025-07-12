import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'filter_date_button_state.dart';

@Injectable()
class FilterDateButtonCubit extends Cubit<FilterDateButtonState> {
  FilterDateButtonCubit() : super(const FilterDateButtonState());

  void selectDate(DateTime? date) {
    emit(state.copyWith(selectedDate: date));
  }

  void clearFilter() {
    emit(state.copyWith(selectedDate: null));
  }
}
