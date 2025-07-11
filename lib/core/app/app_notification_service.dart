import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/material.dart';
import 'package:bloc_arch/features/task/domain/use_cases/get_upcoming_tasks_usecase.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/upcoming_tasks_params.dart';
import 'package:bloc_arch/core/app/app_preferences.dart';
import 'package:bloc_arch/core/app/injectable_config.dart';
import 'package:intl/intl.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz_data;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class AppNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static Function(String)? _foregroundCallback;
  static bool _isAppInForeground = true;
  static GlobalKey<ScaffoldMessengerState>? _scaffoldMessengerKey;
  static bool _initialized = false;

  static void setForegroundCallback(Function(String) callback) {
    _foregroundCallback = callback;
  }

  static void setAppState(bool isInForeground) {
    _isAppInForeground = isInForeground;
    print(
        '🔍 App state updated: ${_isAppInForeground ? "FOREGROUND" : "BACKGROUND"}');
  }

  // // Test method to manually set background state for testing
  // static void setBackgroundForTesting() {
  //   print('🧪 Manually setting app to background for testing');
  //   _isAppInForeground = false;
  // }

  // // Test method to manually set foreground state for testing
  // static void setForegroundForTesting() {
  //   print('🧪 Manually setting app to foreground for testing');
  //   _isAppInForeground = true;
  // }

  static void setScaffoldMessengerKey(GlobalKey<ScaffoldMessengerState> key) {
    _scaffoldMessengerKey = key;
  }

  static Future<void> initialize() async {
    if (_initialized) return;
    // Timezone setup
    tz_data.initializeTimeZones();
    final String timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName));

    // Notification initialization
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        print('Notification tapped: ${details.payload}');
        if (_foregroundCallback != null) {
          _foregroundCallback!(details.payload ?? '');
        }
      },
    );
    _initialized = true;
  }

  /// Schedules daily summary notifications at 8:00 AM and 5:00 PM
  // static Future<void> scheduleDailyTaskSummaryNotifications(
  //     {required int taskCountMorning, required int taskCountEvening}) async {
  //   await initialize();
  //   // Cancel previous summary notifications (IDs 1001 and 1002)
  //   await _notificationsPlugin.cancel(1001);
  //   await _notificationsPlugin.cancel(1002);
  //   // 8:00 AM
  //   await _notificationsPlugin.zonedSchedule(
  //     1001,
  //     'Task Reminder',
  //     'You have $taskCountMorning tasks due today.',
  //     _nextInstanceOfTime(8, 0),
  //     const NotificationDetails(
  //       android: AndroidNotificationDetails('task_channel', 'Task Reminders',
  //           channelDescription: 'Daily task summary'),
  //       iOS: DarwinNotificationDetails(),
  //     ),
  //     androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //     matchDateTimeComponents: DateTimeComponents.time,
  //   );
  //   // 5:00 PM
  //   await _notificationsPlugin.zonedSchedule(
  //     1002,
  //     'Task Reminder',
  //     'You have $taskCountEvening tasks due today.',
  //     _nextInstanceOfTime(17, 0),
  //     const NotificationDetails(
  //       android: AndroidNotificationDetails('task_channel', 'Task Reminders',
  //           channelDescription: 'Daily task summary'),
  //       iOS: DarwinNotificationDetails(),
  //     ),
  //     androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
  //     matchDateTimeComponents: DateTimeComponents.time,
  //   );
  // }

  static tz.TZDateTime _nextInstanceOfTime(int hour, int minute,
      {bool addDay = false}) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, hour, minute);
    if (addDay || scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }

  static Future<void> showUpcomingTasksNotification(
      {required int count, String? payload}) async {
    print('🔔 Attempting to show notification for $count upcoming tasks');
    print("isin foreground ${_isAppInForeground}");
    if (_isAppInForeground) {
      // Show SnackBar from top when app is in foreground
      _showForegroundSnackBar(count, payload);
    } else {
      // Show system notification when app is in background
      await _showSystemNotification(count, payload);
    }
  }

  static Future<void> checkUpcomingTasksAndNotify() async {
    final userId = await AppPreferences.getValue<String>('userId');
    if (userId != null) {
      try {
        final getUpcomingTasksUseCase = getIt<GetUpcomingTasksUseCase>();
        final tomorrow = DateTime.now().add(const Duration(days: 1));
        final params = UpcomingTasksParams(userId: userId, dueDate: tomorrow);
        final result = await getUpcomingTasksUseCase(params);
        result.fold(
          (error) {
            // Optionally log error
          },
          (tasks) async {
            if (tasks.isNotEmpty) {
              await AppNotificationService.showUpcomingTasksNotification(
                count: tasks.length,
                payload: 'upcoming_tasks',
              );
            }
          },
        );
      } catch (e) {
        // Optionally log exception
      }
    }
  }

  // static Future<void> scheduleTodayTaskSummaryForCurrentUser() async {
  //   final userId = await AppPreferences.getValue<String>('userId');
  //   if (userId == null) return;

  //   final getUpcomingTasksUseCase = getIt<GetUpcomingTasksUseCase>();
  //   final today = DateTime.now();
  //   final params = UpcomingTasksParams(userId: userId, dueDate: today);
  //   final result = await getUpcomingTasksUseCase(params);

  //   int count = 0;
  //   result.fold(
  //     (error) => count = 0,
  //     (tasks) => count = tasks.length,
  //   );

  //   await AppNotificationService.scheduleDailyTaskSummaryNotifications(
  //     taskCountMorning: count,
  //     taskCountEvening: count,
  //   );
  // }

  static Future<void> scheduleTomorrowTaskSummaryForCurrentUser() async {
    final userId = await AppPreferences.getValue<String>('userId');
    if (userId == null) return;

    final getUpcomingTasksUseCase = getIt<GetUpcomingTasksUseCase>();
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    final params = UpcomingTasksParams(userId: userId, dueDate: tomorrow);
    final result = await getUpcomingTasksUseCase(params);

    int count = 0;
    result.fold(
      (error) => count = 0,
      (tasks) => count = tasks.length,
    );

    await AppNotificationService.scheduleTomorrowTaskSummaryNotification(
      taskCount: count,
      hour: 8,
      minute: 0,
      notificationId: 1001,
    );
    await AppNotificationService.scheduleTomorrowTaskSummaryNotification(
      taskCount: count,
      hour: 17,
      minute: 0,
      notificationId: 1002,
    );
  }

  static Future<void> scheduleTomorrowTaskSummaryNotification({
    required int taskCount,
    required int hour,
    required int minute,
    required int notificationId,
  }) async {
    await initialize();
    await _notificationsPlugin.cancel(notificationId);
    final scheduledTime = _nextInstanceOfTime(hour, minute, addDay: true);
    await _notificationsPlugin.zonedSchedule(
      notificationId,
      'Task Reminder',
      'You have $taskCount tasks due tomorrow.',
      scheduledTime,
      const NotificationDetails(
        android: AndroidNotificationDetails('task_channel', 'Task Reminders',
            channelDescription: 'Tomorrow task summary'),
        iOS: DarwinNotificationDetails(),
      ),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  // // Test method to verify SnackBar works
  // static void testSnackBar() {
  //   print('🧪 Testing SnackBar...');
  //   _showForegroundSnackBar(1, 'test');
  // }

  static void _showForegroundSnackBar(int count, String? payload) {
    print('📱 Showing foreground SnackBar from top');
    print('🔍 App in foreground: $_isAppInForeground');
    print('🔍 ScaffoldMessenger key: ${_scaffoldMessengerKey != null}');

    // Wait for the next frame to ensure Scaffold is ready
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('🔍 Post frame callback executed');
      print(
          '🔍 ScaffoldMessenger current state: ${_scaffoldMessengerKey?.currentState != null}');

      if (_scaffoldMessengerKey?.currentState != null) {
        try {
          print('🔍 Attempting to show SnackBar...');
          _scaffoldMessengerKey!.currentState!.showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.task_alt,
                      color: Colors.blue.shade700,
                      size: 18,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Upcoming Tasks',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'You have $count task(s) due soon',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.grey.shade800,
              duration: const Duration(seconds: 4),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(
                bottom: MediaQuery.of(_scaffoldMessengerKey!.currentContext!)
                        .size
                        .height -
                    150,
                right: 20,
                left: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          );
          print('✅ SnackBar notification shown successfully from top');
        } catch (e) {
          print(
              '❌ Error showing SnackBar: $e, falling back to system notification');
          _showSystemNotification(count, payload);
        }
      } else {
        print(
            '❌ Warning: ScaffoldMessenger not available, falling back to system notification');
        _showSystemNotification(count, payload);
      }
    });
  }

  static Future<void> _showSystemNotification(
      int count, String? payload) async {
    print('🔔 Showing system notification');
    try {
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
          AndroidNotificationDetails(
        'upcoming_tasks_channel',
        'Upcoming Tasks',
        channelDescription: 'Notifications for upcoming tasks',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        showWhen: true,
        enableVibration: true,
        playSound: true,
      );
      const DarwinNotificationDetails iOSPlatformChannelSpecifics =
          DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      );
      const NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics,
      );

      await _notificationsPlugin.show(
        0,
        'Upcoming Tasks',
        'You have $count task(s) due soon',
        platformChannelSpecifics,
        payload: payload,
      );
      print('✅ System notification shown successfully');
    } catch (e) {
      print('❌ Error showing system notification: $e');
    }
  }
}
