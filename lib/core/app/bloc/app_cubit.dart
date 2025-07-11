import 'package:bloc_arch/core/app/bloc/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_arch/core/app/app_preferences.dart';
import 'package:bloc_arch/core/const/data_store_keys.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState(themeMode: ThemeMode.light));

  void toggleTheme() async {
    final isDark = state.themeMode == ThemeMode.dark;
    final newMode = isDark ? ThemeMode.light : ThemeMode.dark;
    await AppPreferences.setValue<String>(
        DataStoreKeys.themeMode, newMode.name);
    emit(state.copyWith(themeMode: newMode));
  }

  Future<void> loadTheme() async {
    final mode = await AppPreferences.getValue<String>(DataStoreKeys.themeMode);
    if (mode == 'dark') {
      emit(state.copyWith(themeMode: ThemeMode.dark));
    } else {
      emit(state.copyWith(themeMode: ThemeMode.light));
    }
  }

  Future<void> logout() async {
    await AppPreferences.remove(DataStoreKeys.userId);
    // Optionally clear other user-related data
    emit(state.copyWith(isLoggedOut: true));
  }
}
