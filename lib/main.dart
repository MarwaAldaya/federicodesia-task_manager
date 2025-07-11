import 'package:bloc_arch/core/app/injectable_config.dart';
import 'package:bloc_arch/core/const/constants.dart';
import 'package:bloc_arch/features/task/data/source/task_local_data_source.dart';
import 'package:bloc_arch/firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'dart:math';

import 'core/app/my_app.dart';

import 'package:bloc_arch/features/sync/data/data_source/sync_manager.dart';
import 'package:bloc_arch/core/app/app_notification_service.dart';
import 'package:bloc_arch/core/app/app_preferences.dart';
import 'package:bloc_arch/features/task/domain/use_cases/get_upcoming_tasks_usecase.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/upcoming_tasks_params.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await configureDependencies();
  await AppNotificationService.initialize();

  // testFirebase();
  // testTaskCreation();
  // testWorkspaceCreation();

  // Start SyncManager
  getIt<SyncManager>().start();

  // Clear local tasks database in debug mode for testing
  // // if (kDebugMode) {
  // final localSource = getIt<TaskLocalDataSource>();
  // await localSource.clearAllTables();
  // print('🧹 Cleared all local tables (debug mode)');
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
  // Future<void>.delayed(const Duration(seconds: 3), () async {
  //   print('🔍 Starting upcoming tasks notification check...');

  //   // Test: Manually set app to background to test system notification
  //   // print('🧪 Testing background notification - setting app to background');
  //   // AppNotificationService.setBackgroundForTesting();

  //   final userId = await AppPreferences.getValue<String>('userId');
  //   print('👤 User ID: $userId');
  //   if (userId != null) {
  //     try {
  //       final getUpcomingTasksUseCase = getIt<GetUpcomingTasksUseCase>();
  //       final tomorrow = DateTime.now().add(const Duration(days: 1));
  //       print('📅 Checking for tasks due on: $tomorrow');
  //       final params = UpcomingTasksParams(userId: userId, dueDate: tomorrow);
  //       final result = await getUpcomingTasksUseCase(params);
  //       result.fold(
  //         (error) {
  //           print('❌ Error fetching upcoming tasks: $error');
  //           // Even if there's an error, the local data source should work
  //           print('💡 Local data source should handle offline scenarios');
  //         },
  //         (tasks) async {
  //           print('📋 Found ${tasks.length} upcoming tasks');
  //           if (tasks.isNotEmpty) {
  //             print('🔔 Showing notification for ${tasks.length} tasks');
  //             await AppNotificationService.showUpcomingTasksNotification(
  //               count: tasks.length,
  //               payload: 'upcoming_tasks',
  //             );
  //           } else {
  //             print('📭 No upcoming tasks found');
  //           }
  //         },
  //       );
  //     } catch (e) {
  //       print('❌ Exception in notification check: $e');
  //       print(
  //           '💡 This might be due to network issues, but local data should work');
  //     }
  //   } else {
  //     print('❌ No user ID found in preferences');
  //   }
  // });

  // Test SnackBar after 5 seconds to verify it works
  // Future<void>.delayed(const Duration(seconds: 5), () {
  //   print('🧪 Testing SnackBar system...');
  //   AppNotificationService.testSnackBar();
  // });
}

// Future<void> deleteDriftDatabase() async {
//   final dir = await getApplicationDocumentsDirectory();
//   final dbFile = File(p.join(dir.path, 'db.sqlite')); // غيّر الاسم إذا كان مختلف
//   if (await dbFile.exists()) {
//     await dbFile.delete();
//     print('Drift database deleted.');
//   }
// }
// // Simple Firestore test - create test user for dropdown
// Future<void> testFirebase() async {
//   try {
//     print('🧪 Testing Firebase connection...');

//     // Create a test user for dropdown functionality
//     await FirebaseFirestore.instance.collection('users').add({
//       'id': 'test_user_1',
//       'name': 'john_doe',
//       'email': 'john@example.com',
//       'password': 'password123',
//       'workspaces': [
//         {'id': 'workspace1', 'name': 'Development Team'},
//         {'id': 'workspace2', 'name': 'Marketing Team'}
//       ],
//       'timestamp': FieldValue.serverTimestamp(),
//     });

//     print('✅ Test user created successfully!');
//     print('📝 You can now test your dropdown with this user data');
//   } catch (e) {
//     print('❌ Firebase test failed: $e');
//     print('💡 Make sure to deploy your security rules first:');
//     print('   firebase deploy --only firestore');
//   }
// }

// // Test function to create 5 random tasks
// Future<void> testTaskCreation() async {
//   try {
//     print('🧪 Creating test tasks...');

//     final random = Random();
//     final taskTitles = [
//       'Implement user authentication',
//       'Design mobile app UI',
//       'Write API documentation',
//       'Fix critical bug in login',
//       'Optimize database queries',
//       'Add push notifications',
//       'Create unit tests',
//       'Deploy to production',
//       'Code review pull request',
//       'Update dependencies'
//     ];

//     final taskDescriptions = [
//       'Implement secure user authentication using Firebase Auth',
//       'Create beautiful and responsive UI for mobile app',
//       'Write comprehensive API documentation for developers',
//       'Fix the critical bug that prevents users from logging in',
//       'Optimize database queries to improve performance',
//       'Add push notification functionality to the app',
//       'Create comprehensive unit tests for all features',
//       'Deploy the latest version to production environment',
//       'Review the latest pull request and provide feedback',
//       'Update all dependencies to their latest versions'
//     ];

//     final priorities = ['low', 'medium', 'high'];
//     final statuses = ['todo', 'inProgress', 'done'];
//     final assignees = [
//       {
//         'id': 'user1',
//         'name': 'John Doe',
//       },
//       {'id': 'user2', 'name': 'Jane Smith'},
//       {'id': 'user3', 'name': 'Mike Johnson'},
//       null
//     ];

//     for (int i = 0; i < 5; i++) {
//       final title = taskTitles[random.nextInt(taskTitles.length)];
//       final description =
//           taskDescriptions[random.nextInt(taskDescriptions.length)];
//       final priority = priorities[random.nextInt(priorities.length)];
//       final status = statuses[random.nextInt(statuses.length)];
//       final assignee = assignees[random.nextInt(assignees.length)];

//       // Random due date between today and 30 days from now
//       final dueDate = DateTime.now().add(Duration(days: random.nextInt(30)));
//       final id =
//           'task_${DateTime.now().millisecondsSinceEpoch}_${random.nextInt(10000)}';
//       final syncModel = {
//         'id': id,
//         'operationType': 'create',
//         'syncStatus': 'synced',
//       };
//       final assigneeJson = assignee == null
//           ? null
//           : {
//               'id': assignee['id'],
//               'name': assignee['name'],
//               'email': assignee['email'] ?? '',
//               'workspaces': [],
//             };
//       await FirebaseFirestore.instance.collection('tasks').add({
//         'id': id,
//         'title': title,
//         'description': description,
//         'priority': priority,
//         'status': status,
//         'assignee': assigneeJson,
//         'dueDate': dueDate.toIso8601String(),
//         'createdAt': FieldValue.serverTimestamp(),
//         'updatedAt': FieldValue.serverTimestamp(),
//         'syncModel': syncModel,
//       });
//       print('✅ Created task: $title');
//     }

//     print('🎉 Successfully created 5 random tasks!');
//     print('📱 You can now test your task list screen');
//   } catch (e) {
//     print('❌ Task creation test failed: $e');
//     print('💡 Make sure your Firestore rules allow write access');
//   }
// }

// // Test function to create 2 workspaces for dropdown testing
// Future<void> testWorkspaceCreation() async {
//   try {
//     print('🧪 Creating test workspaces...');

//     final workspaces = [
//       {
//         'id': 'workspace_4',
//         'name': 'selling Team',
//         'description': 'Main development workspace for the engineering team',
//         'createdAt': FieldValue.serverTimestamp(),
//         'updatedAt': FieldValue.serverTimestamp(),
//       },
//       {
//         'id': 'workspace_3',
//         'name': 'social Team',
//         'description': 'Marketing and communications workspace',
//         'createdAt': FieldValue.serverTimestamp(),
//         'updatedAt': FieldValue.serverTimestamp(),
//       },
//     ];

//     for (final workspace in workspaces) {
//       await FirebaseFirestore.instance.collection('workspace').add(workspace);
//       print('✅ Created workspace: ${workspace['name']}');
//     }

//     print('🎉 Successfully created ${workspaces.length} test workspaces!');
//     print('📱 You can now test your workspace dropdown with this data');
//   } catch (e) {
//     print('❌ Workspace creation test failed: $e');
//     print(
//         '💡 Make sure your Firestore rules allow write access to workspaces collection');
//   }
// }
