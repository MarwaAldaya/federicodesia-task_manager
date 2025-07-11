import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'status_dropdown_state.dart';

@injectable
class StatusDropdownCubit extends Cubit<StatusDropdownState> {
  StatusDropdownCubit() : super(const StatusDropdownState.initial()) {
    loadStatuses();
  }

  void loadStatuses() {
    emit(StatusDropdownState.success(TaskStatus.values));
  }
}
