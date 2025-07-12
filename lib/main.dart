import 'package:bloc_arch/core/app/injectable_config.dart';
import 'package:bloc_arch/core/const/constants.dart';
import 'package:bloc_arch/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/app/my_app.dart';

import 'package:bloc_arch/features/sync/data/data_source/sync_manager.dart';
import 'package:bloc_arch/core/app/app_notification_service.dart';
import 'package:bloc_arch/core/app/app_preferences.dart';
import 'package:bloc_arch/features/task/domain/use_cases/get_upcoming_tasks_usecase.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/upcoming_tasks_params.dart';
import 'package:bloc_arch/core/utils/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();
  await AppNotificationService.initialize();

  // Start SyncManager
  getIt<SyncManager>().start();

  // Clear local tasks database in debug mode for testing
  // // if (kDebugMode) {
  // final localSource = getIt<TaskLocalDataSource>();
  // await localSource.clearAllTables();
  // Logger.database('🧹 Cleared all local tables (debug mode)');
  // }
  await AppPreferences.setValue<String>(
      'userId', 'mdArE6PjeGWBRPfvBocBFcW6yzZ2');
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale(Constants.localen, Constants.localeEN),
      ],
      path: 'assets/translations',
      fallbackLocale: Locale(Constants.localen, Constants.localeEN),
      child: const MyApp(),
    ),
  );

  // --- Notification logic for upcoming tasks ---
  // This should be moved to a background/periodic service in production
  Future<void>.delayed(const Duration(seconds: 3), () async {
    Logger.notification('🔍 Starting upcoming tasks notification check...');

    final userId = await AppPreferences.getValue<String>('userId');
    Logger.notification('👤 User ID: $userId');
    if (userId != null) {
      try {
        final getUpcomingTasksUseCase = getIt<GetUpcomingTasksUseCase>();
        final tomorrow = DateTime.now().add(const Duration(days: 1));
        Logger.notification('📅 Checking for tasks due on: $tomorrow');
        final params = UpcomingTasksParams(userId: userId, dueDate: tomorrow);
        final result = await getUpcomingTasksUseCase(params);
        result.fold(
          (error) {
            Logger.error('❌ Error fetching upcoming tasks', error);
            // Even if there's an error, the local data source should work
            Logger.notification(
                '💡 Local data source should handle offline scenarios');
          },
          (tasks) async {
            Logger.notification('📋 Found ${tasks.length} upcoming tasks');
            if (tasks.isNotEmpty) {
              Logger.notification(
                  '🔔 Showing notification for ${tasks.length} tasks');
              await AppNotificationService.showUpcomingTasksNotification(
                count: tasks.length,
                payload: 'upcoming_tasks',
              );
            } else {
              Logger.notification('📭 No upcoming tasks found');
            }
          },
        );
      } catch (e) {
        Logger.error('❌ Exception in notification check', e);
        Logger.notification(
            '💡 This might be due to network issues, but local data should work');
      }
    } else {
      Logger.warning('❌ No user ID found in preferences');
    }
  });
}
