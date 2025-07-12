/// A comprehensive notification service that handles both local and system notifications
/// for the BlocArch application.
///
/// This service provides functionality for:
/// - Scheduling daily notifications for upcoming tasks
/// - Showing in-app notifications (SnackBars) when the app is in foreground
/// - Showing system notifications when the app is in background
/// - Managing notification permissions and initialization
/// - Handling notification taps and user interactions
///
/// ## Features
/// - Automatic foreground/background detection
/// - Daily scheduled notifications at 8:00 AM and 5:00 PM
/// - In-app SnackBar notifications with action buttons
/// - System notifications with proper channel configuration
/// - Timezone-aware scheduling
/// - Comprehensive error handling and logging
///
/// ## Usage Examples
/// ```dart
/// // Initialize the service
/// await AppNotificationService.initialize();
///
/// // Schedule daily notifications
/// await AppNotificationService.scheduleTomorrowTaskSummaryForCurrentUser();
///
/// // Show notification for upcoming tasks
/// await AppNotificationService.showUpcomingTasksNotification(
///   count: 5,
///   payload: 'upcoming_tasks',
/// );
/// ```
///
/// ## Setup Requirements
/// - Android: Requires notification channel configuration
/// - iOS: Requires permission requests for alerts, badges, and sounds
/// - Both platforms: Requires proper icon configuration
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:bloc_arch/core/utils/logger.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

/// Service for managing local notifications and in-app notification displays.
///
/// Handles the complete notification lifecycle including initialization,
/// scheduling, display, and user interaction handling.
class AppNotificationService {
  /// Flutter local notifications plugin instance.
  static final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  /// Tracks whether the app is currently in the foreground.
  static bool _isAppInForeground = true;

  /// Global key for accessing the ScaffoldMessenger to show SnackBars.
  static GlobalKey<ScaffoldMessengerState>? _scaffoldMessengerKey;

  /// Initializes the notification service with platform-specific settings.
  ///
  /// This method must be called before using any notification functionality.
  /// It sets up timezone support, notification channels, and permission requests.
  ///
  /// ## Platform-specific behavior:
  /// - **Android**: Creates notification channels and requests permissions
  /// - **iOS**: Requests alert, badge, and sound permissions
  ///
  /// ## Throws
  /// - Platform-specific exceptions if initialization fails
  static Future<void> initialize() async {
    Logger.notification('Initializing notification service');

    // Initialize timezone
    tz.initializeTimeZones();

    // Initialize notification settings
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _notifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    Logger.notification('Notification service initialized successfully');
  }

  /// Updates the app's foreground/background state.
  ///
  /// This method should be called whenever the app's lifecycle state changes
  /// to ensure notifications are displayed appropriately.
  ///
  /// [isInForeground] Whether the app is currently in the foreground.
  static void setAppState(bool isInForeground) {
    _isAppInForeground = isInForeground;
    Logger.notification(
        'App state changed: ${isInForeground ? 'foreground' : 'background'}');
  }

  /// Sets the ScaffoldMessenger key for displaying in-app notifications.
  ///
  /// This key is used to show SnackBar notifications when the app is in
  /// the foreground. It should be set from the main app widget.
  ///
  /// [key] The GlobalKey for the ScaffoldMessenger.
  static void setScaffoldMessengerKey(GlobalKey<ScaffoldMessengerState> key) {
    _scaffoldMessengerKey = key;
  }

  /// Handles notification tap events.
  ///
  /// Called when a user taps on a system notification. This method can be
  /// extended to handle navigation or other actions based on the notification.
  ///
  /// [details] Information about the tapped notification.
  static void _onNotificationTapped(NotificationResponse details) {
    Logger.notification('Notification tapped: ${details.payload}');
    // Handle notification tap - navigate to specific screen, etc.
  }

  /// Schedules daily notifications for upcoming tasks due tomorrow.
  ///
  /// Creates two scheduled notifications:
  /// - 8:00 AM daily reminder
  /// - 5:00 PM daily reminder
  ///
  /// These notifications will repeat daily and can be used to remind users
  /// about tasks due the following day.
  ///
  /// ## Throws
  /// - Platform-specific exceptions if scheduling fails
  static Future<void> scheduleTomorrowTaskSummaryForCurrentUser() async {
    try {
      // Schedule for 8:00 AM daily
      await _notifications.zonedSchedule(
        1, // Unique ID for this notification
        'Upcoming Tasks',
        'You have tasks due tomorrow',
        _nextInstanceOf(8, 0), // 8:00 AM
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'upcoming_tasks_channel',
            'Upcoming Tasks',
            channelDescription: 'Notifications for upcoming tasks',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: 'upcoming_tasks',
      );

      // Schedule for 5:00 PM daily
      await _notifications.zonedSchedule(
        2, // Unique ID for this notification
        'Upcoming Tasks',
        'You have tasks due tomorrow',
        _nextInstanceOf(17, 0), // 5:00 PM
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'upcoming_tasks_channel',
            'Upcoming Tasks',
            channelDescription: 'Notifications for upcoming tasks',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        matchDateTimeComponents: DateTimeComponents.time,
        payload: 'upcoming_tasks',
      );

      Logger.notification('Scheduled daily task summary notifications');
    } catch (e) {
      Logger.error('Failed to schedule task summary notifications', e);
    }
  }

  /// Calculates the next occurrence of a specific time.
  ///
  /// Returns a [tz.TZDateTime] representing the next occurrence of the
  /// specified hour and minute. If the time has already passed today,
  /// it schedules for tomorrow.
  ///
  /// [hour] The hour (0-23) for the scheduled time.
  /// [minute] The minute (0-59) for the scheduled time.
  ///
  /// Returns the next occurrence of the specified time.
  static tz.TZDateTime _nextInstanceOf(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    return scheduledDate;
  }

  /// Shows a notification for upcoming tasks.
  ///
  /// Automatically determines whether to show an in-app notification
  /// (SnackBar) or a system notification based on the app's foreground state.
  ///
  /// [count] The number of upcoming tasks to mention in the notification.
  /// [payload] Optional payload data to include with the notification.
  ///
  /// ## Behavior
  /// - **Foreground**: Shows a SnackBar with task count and "View" action
  /// - **Background**: Shows a system notification with task count
  static Future<void> showUpcomingTasksNotification({
    required int count,
    String? payload,
  }) async {
    Logger.notification(
        '🔔 Attempting to show notification for $count upcoming tasks');
    Logger.notification("isin foreground ${_isAppInForeground}");

    if (_isAppInForeground) {
      // Show in-app notification (SnackBar)
      await _showForegroundNotification(count);
    } else {
      // Show system notification
      await _showSystemNotification(count, payload);
    }
  }

  /// Shows an in-app notification (SnackBar) when the app is in foreground.
  ///
  /// Displays a SnackBar with task count information and a "View" action button.
  /// Uses post-frame callback to ensure the widget tree is properly built.
  ///
  /// [count] The number of upcoming tasks to display.
  ///
  /// ## Features
  /// - Orange background with white text
  /// - 4-second duration
  /// - "View" action button for navigation
  /// - Proper error handling if ScaffoldMessenger is unavailable
  static Future<void> _showForegroundNotification(int count) async {
    if (_scaffoldMessengerKey?.currentState == null) {
      Logger.warning(
          'ScaffoldMessenger not available for foreground notification');
      return;
    }

    // Use post frame callback to ensure the widget tree is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Logger.notification('📱 Showing foreground SnackBar from top');
      Logger.notification('🔍 App in foreground: $_isAppInForeground');
      Logger.notification(
          '🔍 ScaffoldMessenger key: ${_scaffoldMessengerKey != null}');

      if (_scaffoldMessengerKey?.currentState != null) {
        Logger.notification('🔍 Post frame callback executed');
        Logger.notification(
            '🔍 ScaffoldMessenger state: ${_scaffoldMessengerKey!.currentState}');

        try {
          Logger.notification('🔍 Attempting to show SnackBar...');
          _scaffoldMessengerKey!.currentState!.showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.notifications, color: Colors.white),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'You have $count task${count > 1 ? 's' : ''} due tomorrow',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.orange,
              duration: const Duration(seconds: 4),
              action: SnackBarAction(
                label: 'View',
                textColor: Colors.white,
                onPressed: () {
                  // Navigate to task list or specific task
                  Logger.notification('User tapped "View" on SnackBar');
                },
              ),
            ),
          );
          Logger.notification(
              '✅ SnackBar notification shown successfully from top');
        } catch (e) {
          Logger.error('❌ Error showing SnackBar notification', e);
        }
      } else {
        Logger.warning(
            '❌ ScaffoldMessenger state is null after post frame callback');
      }
    });
  }

  /// Shows a system notification when the app is in background.
  ///
  /// Displays a system notification with task count information.
  /// Uses the 'upcoming_tasks_channel' for Android notifications.
  ///
  /// [count] The number of upcoming tasks to display.
  /// [payload] Optional payload data to include with the notification.
  ///
  /// ## Features
  /// - High importance and priority for Android
  /// - Proper channel configuration
  /// - Error handling with logging
  static Future<void> _showSystemNotification(
      int count, String? payload) async {
    try {
      Logger.notification('🔔 Showing system notification');

      await _notifications.show(
        0, // Unique ID
        'Upcoming Tasks',
        'You have $count task${count > 1 ? 's' : ''} due tomorrow',
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'upcoming_tasks_channel',
            'Upcoming Tasks',
            channelDescription: 'Notifications for upcoming tasks',
            importance: Importance.high,
            priority: Priority.high,
          ),
          iOS: DarwinNotificationDetails(),
        ),
        payload: payload,
      );

      Logger.notification('✅ System notification shown successfully');
    } catch (e) {
      Logger.error('❌ Error showing system notification', e);
    }
  }

  /// Cancels all scheduled and pending notifications.
  ///
  /// Removes all notifications from the system, including scheduled ones.
  /// Useful for cleanup or when notifications are no longer needed.
  static Future<void> cancelAllNotifications() async {
    await _notifications.cancelAll();
    Logger.notification('All notifications cancelled');
  }

  /// Cancels a specific notification by its ID.
  ///
  /// Removes a single notification from the system.
  ///
  /// [id] The unique identifier of the notification to cancel.
  static Future<void> cancelNotification(int id) async {
    await _notifications.cancel(id);
    Logger.notification('Cancelled notification with ID: $id');
  }
}
