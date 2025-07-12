import 'package:bloc_arch/core/app/bloc/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:bloc_arch/core/app/app_preferences.dart';
import 'package:bloc_arch/core/const/data_store_keys.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());

  Future<void> logout() async {
    await AppPreferences.remove(DataStoreKeys.userId);
    // Optionally clear other user-related data
    emit(state.copyWith(isLoggedOut: true));
  }
}
