import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../const/constants.dart';

// Export task-related extensions
export 'task_extensions.dart';

extension Date on String {
  String getFormatDate() {
    String date = DateFormat('dd-MM-yyyy').format(DateTime.parse(this));
    return date;
  }

  String getFormatDateWithDayName() {
    String date = DateFormat().add_yMMMMEEEEd().format(DateTime.parse(this));
    return date;
  }

  String getFormatTime() {
    String date = DateFormat.jm().format(DateTime.parse(this));
    return date;
  }

  num getAge() {
    final today = DateTime.now();
    final birthDate = DateTime.parse(this);
    int age = today.year - birthDate.year;
    int month = today.month - birthDate.month;
    if (month < 0 || (month == 0 && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  int getYear() {
    final date = DateTime.parse(this);
    return date.year;
  }

  int getMonth() {
    final date = DateTime.parse(this);
    return date.month;
  }

  int getDay() {
    final date = DateTime.parse(this);
    return date.day;
  }
}

extension StringDate on DateTime {
  /// Format date as dd/MM/yyyy
  String formatDate() {
    return '${day.toString().padLeft(2, '0')}/${month.toString().padLeft(2, '0')}/$year';
  }

  /// Format date as "Jul 5, 2024" (short month name, day, year)
  String formatDateShort() {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return "${months[month - 1]} $day, $year";
  }

  /// Format date as "July 5, 2024" (full month name, day, year)
  String formatDateLong() {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return "${months[month - 1]} $day, $year";
  }

  /// Format date using intl package with custom pattern
  String formatDateWithPattern(String pattern) {
    return DateFormat(pattern).format(this);
  }

  /// Format date as relative time (e.g., "2 days ago", "in 3 hours")
  String formatRelativeTime() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inDays > 0) {
      return "${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago";
    } else if (difference.inHours > 0) {
      return "${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago";
    } else if (difference.inMinutes > 0) {
      return "${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago";
    } else {
      return "Just now";
    }
  }
}

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return Constants.empty;
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZero() {
    if (this == null) {
      return Constants.zero.toDouble();
    } else {
      return this!;
    }
  }
}

extension NonNullNum on num? {
  num orZero() {
    if (this == null) {
      return Constants.zero;
    } else {
      return this!;
    }
  }
}

extension NonNullBool on bool? {
  bool orFalse() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

extension ValidationExtension on String {
  bool isValidEmail() {
    return RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9-]+\.[a-zA-Z]+").hasMatch(this);
  }

  bool isValidPassword() {
    return contains(RegExp(r'\d')) && contains(RegExp(r'[a-zA-Z]'));
  }
}

extension ContextExtension on BuildContext {
  void dismissKeyboard() {
    var focus = FocusManager.instance.primaryFocus;
    if (focus != null) {
      focus.unfocus();
    }
  }
}

extension ImageAssetsExtension on String {
  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      this,
      bundle: bundle,
      package: package,
    );
  }
}

extension StringExtension on String {
  bool containsNumber() {
    // Regular expression to check if the string contains any digit
    return RegExp(r'\d').hasMatch(this);
  }
}

extension ThemeTextStyles on BuildContext {
  TextTheme get textStyles => Theme.of(this).textTheme;
}

extension ThemeColors on BuildContext {
  ThemeData get theme => Theme.of(this);

  ColorScheme get colors => theme.colorScheme;
}
