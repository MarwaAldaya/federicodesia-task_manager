import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required ThemeMode themeMode,
    @Default(false) bool isLoggedOut,
  }) = _AppState;
}
