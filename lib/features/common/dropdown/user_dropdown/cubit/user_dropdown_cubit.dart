import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_arch/features/user/domain/use_cases/get_all_users_usecase.dart';
import 'package:bloc_arch/features/user/domain/use_cases/search_users_usecase.dart';
import 'package:bloc_arch/core/domain/use_cases/usecase.dart';
import 'user_dropdown_state.dart';

@injectable
class UserDropdownCubit extends Cubit<UserDropdownState> {
  final GetAllUsersUseCase _getAllUsersUseCase;
  final SearchUsersUseCase _searchUsersUseCase;

  UserDropdownCubit(
    this._getAllUsersUseCase,
    this._searchUsersUseCase,
  ) : super(const UserDropdownState.initial());

  Future<void> loadAllUsers() async {
    emit(const UserDropdownState.loading());

    try {
      final result = await _getAllUsersUseCase(params: NoParams());
      result.fold(
        (failure) => emit(UserDropdownState.failure(
            failure.failure.message ?? 'Failed to load users')),
        (users) => emit(UserDropdownState.success(users)),
      );
    } catch (e) {
      if (!isClosed) (UserDropdownState.failure(e.toString()));
    }
  }

  Future<void> searchUsers(String query) async {
    if (query.isEmpty) {
      await loadAllUsers();
      return;
    }

    emit(const UserDropdownState.loading());

    try {
      final result = await _searchUsersUseCase(params: query);
      result.fold(
        (failure) => emit(UserDropdownState.failure(
            failure.failure.message ?? 'Failed to search users')),
        (users) => emit(UserDropdownState.success(users)),
      );
    } catch (e) {
      emit(UserDropdownState.failure(e.toString()));
    }
  }

  void clearSearch() {
    loadAllUsers();
  }
}
