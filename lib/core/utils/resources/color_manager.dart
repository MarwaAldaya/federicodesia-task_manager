import 'package:flutter/material.dart';

class ColorManager {
  // Shared colors (used in both light and dark)
  static const Color primary = Color(0xFF006D77);
  static const Color secondary = Color(0xFF83C5BE);
  static const Color redError = Color(0xFFEF476F);
  static const Color white = Colors.white;
  static const Color black = Colors.black;

  // Task Priority Colors (standard task management conventions)
  static const Color priorityHigh = Color(0xFFDC3545); // Red - urgent/important
  static const Color priorityMedium = Color(0xFFFFC107); // Amber - moderate
  static const Color priorityLow = Color(0xFF28A745); // Green - low urgency

  // Task Status Colors (standard task management conventions)
  static const Color statusTodo = Color(0xFF6C757D); // Gray - not started
  static const Color statusInProgress = Color(0xFF007BFF); // Blue - in progress
  static const Color statusDone = Color(0xFF28A745); // Green - completed

  // Light theme specific
  static const Color lightScaffold = Color(0xFFF8F9FA);
  static const Color lightCard = Colors.white;
  static const Color lightGrey = Color(0xFF6C757D);
  static const Color lightDivider = Color(0xFFDEE2E6);

  // Dark theme specific
  static const Color darkScaffold = Color(0xFF121212);
  static const Color darkCard = Color(0xFF1E1E1E);
  static const Color darkGrey = Color(0xFF9E9E9E);
  static const Color darkDivider = Color(0xFF2C2C2C);
}
