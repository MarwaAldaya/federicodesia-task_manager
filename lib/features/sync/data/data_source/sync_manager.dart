/// Background synchronization manager for offline-first operations.
///
/// This class provides automatic synchronization of local changes to the remote
/// server using a cron-based scheduling system. It monitors internet connectivity
/// and processes sync records in the background to ensure data consistency.
///
/// ## Features
/// - **Cron-based scheduling**: Runs sync jobs every 10 minutes
/// - **Connectivity monitoring**: Immediate sync when internet is restored
/// - **Error handling**: Comprehensive error handling with retry logic
/// - **Feature extensibility**: Easy to add new features beyond tasks
/// - **Background processing**: Non-blocking sync operations
/// - **Detailed logging**: Comprehensive logging for debugging
///
/// ## Architecture
/// The SyncManager implements a robust synchronization strategy:
/// - **Scheduled sync**: Regular background sync every 10 minutes
/// - **Event-driven sync**: Immediate sync on connectivity restoration
/// - **Retry mechanism**: Failed operations are retried on next sync cycle
/// - **Feature isolation**: Each feature handles its own sync logic
///
/// ## Sync Process
/// 1. **Discovery**: Find all records with `needSync` or `failed` status
/// 2. **Processing**: Execute each operation based on feature type
/// 3. **Cleanup**: Remove successful sync records
/// 4. **Error handling**: Mark failed operations for retry
///
/// ## Usage Examples
/// ```dart
/// // Start the sync manager (called from main.dart)
/// final syncManager = getIt<SyncManager>();
/// syncManager.start();
///
/// // Stop the sync manager (e.g., on app shutdown)
/// syncManager.stop();
/// ```
///
/// ## Supported Features
/// - **Tasks**: Create, update, and delete operations
/// - **Extensible**: Easy to add new features (users, workspaces, etc.)
///
/// ## Error Handling
/// - Failed operations are marked with `failed` status
/// - Retry attempts on next sync cycle
/// - Detailed error logging for debugging
/// - Graceful degradation when sync fails
import 'package:cron/cron.dart';
import 'package:bloc_arch/features/sync/data/data_source/sync_local_data_source.dart';
import 'package:bloc_arch/features/task/data/source/task_remote_data_source.dart';
import 'package:bloc_arch/features/sync/domain/models/sync_model.dart';
import 'package:bloc_arch/features/task/domain/params/create_task_params/create_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/update_task_params/update_task_params.dart';
import 'package:bloc_arch/features/sync/domain/params/sync_params.dart';
import 'dart:developer';
import 'package:bloc_arch/core/const/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'dart:async';
import 'package:bloc_arch/core/data_sources/utils/error_handler/exceptions.dart';

/// Background synchronization manager for offline-first operations.
///
/// Manages the synchronization of local changes to remote servers using
/// scheduled jobs and connectivity monitoring. Implements a robust retry
/// mechanism and comprehensive error handling.
@LazySingleton()
class SyncManager {
  /// Local sync data source for managing sync records.
  final SyncLocalDataSource syncLocalDataSource;

  /// Remote task data source for API operations.
  final TaskRemoteDataSource taskRemoteDataSource;

  /// Internet connectivity checker for monitoring connection status.
  final InternetConnectionChecker connectionChecker;

  /// Cron scheduler for running periodic sync jobs.
  final Cron _cron = Cron();

  /// Subscription for internet connectivity changes.
  StreamSubscription<InternetConnectionStatus>? _connectionSubscription;

  /// Creates a new SyncManager instance.
  ///
  /// [syncLocalDataSource] The local sync data source for managing sync records.
  /// [taskRemoteDataSource] The remote task data source for API operations.
  /// [connectionChecker] The internet connectivity checker.
  SyncManager({
    required this.syncLocalDataSource,
    required this.taskRemoteDataSource,
    required this.connectionChecker,
  });

  /// Starts the synchronization manager.
  ///
  /// Initializes the cron job scheduler and connectivity monitoring:
  /// - **Scheduled sync**: Runs every 10 minutes using cron expression `*/10 * * * *`
  /// - **Connectivity monitoring**: Listens for internet connection changes
  /// - **Immediate sync**: Triggers sync when internet is restored
  ///
  /// ## Cron Schedule
  /// The sync job runs every 10 minutes to balance between:
  /// - **Responsiveness**: Frequent enough for good user experience
  /// - **Efficiency**: Not too frequent to avoid unnecessary API calls
  /// - **Battery life**: Reasonable interval for mobile devices
  ///
  /// ## Connectivity Monitoring
  /// When internet connectivity is restored, an immediate sync is triggered
  /// to process any pending offline operations as quickly as possible.
  void start() {
    // Runs every 10 minutes
    _cron.schedule(Schedule.parse('*/10 * * * *'), () async {
      log('[SyncManager] Running sync job...', name: 'SyncManager');
      await _runSyncJob();
    });
    log('[SyncManager] Cron job scheduled to run every 10 minutes.',
        name: 'SyncManager');

    // Listen for internet connection changes
    _connectionSubscription = connectionChecker.onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.connected) {
        log('[SyncManager] Internet restored. Running immediate sync...',
            name: 'SyncManager');
        _runSyncJob();
      }
    });
  }

  /// Stops the synchronization manager.
  ///
  /// Cleans up resources by:
  /// - Canceling the cron job scheduler
  /// - Unsubscribing from connectivity monitoring
  /// - Logging the shutdown for debugging purposes
  ///
  /// ## Usage
  /// Call this method when the app is shutting down or when sync
  /// functionality is no longer needed to prevent resource leaks.
  void stop() {
    _cron.close();
    _connectionSubscription?.cancel();
    log('[SyncManager] Cron job stopped.', name: 'SyncManager');
  }

  /// Executes the main synchronization job.
  ///
  /// This method is the core of the sync process:
  /// 1. **Connectivity check**: Ensures internet is available
  /// 2. **Record discovery**: Finds all pending sync records
  /// 3. **Processing**: Executes each operation based on feature type
  /// 4. **Cleanup**: Removes successful records and marks failed ones
  ///
  /// ## Error Handling
  /// - Individual record failures don't stop the entire sync process
  /// - Failed operations are marked for retry on the next cycle
  /// - Comprehensive logging for debugging sync issues
  ///
  /// ## Performance
  /// - Processes records sequentially to avoid overwhelming the server
  /// - Early exit if no internet connectivity
  /// - Efficient database queries with proper indexing
  Future<void> _runSyncJob() async {
    final hasInternet = await connectionChecker.hasConnection;
    if (!hasInternet) {
      log('[SyncManager] Skipping sync: No internet connection.',
          name: 'SyncManager');
      return;
    }

    try {
      // Get all records with status needSync or failed, sorted oldest first
      final records = await syncLocalDataSource.getAllSyncRecords(
        statuses: [SyncStatus.needSync.name, SyncStatus.failed.name],
      );

      for (final record in records) {
        await _processRecord(record);
      }
    } catch (e, st) {
      log('[SyncManager] Exception in sync job: $e',
          name: 'SyncManager', stackTrace: st);
      // throw FirebaseServiceException('SyncManager Firestore error: $e');
    }
  }

  /// Processes a single sync record.
  ///
  /// Executes the appropriate operation based on the record's feature type
  /// and handles success/failure scenarios appropriately.
  ///
  /// [record] The sync record to process.
  ///
  /// ## Processing Flow
  /// 1. **Feature routing**: Routes to appropriate handler based on feature
  /// 2. **Operation execution**: Executes the specific operation
  /// 3. **Success handling**: Removes the sync record
  /// 4. **Failure handling**: Marks record as failed for retry
  ///
  /// ## Supported Features
  /// - **Tasks**: Create, update, and delete operations
  /// - **Extensible**: Easy to add new features by extending the switch statement
  ///
  /// ## Error Handling
  /// - Individual record failures are logged but don't stop processing
  /// - Failed records are marked for retry on the next sync cycle
  /// - Detailed error logging includes stack traces for debugging
  Future<void> _processRecord(SyncModel record) async {
    try {
      switch (record.feature) {
        case FeatureNames.task:
          await _processTaskRecord(record);
          break;
        // Add other features here in the future
        default:
          log('[SyncManager] Unknown feature: ${record.feature}',
              name: 'SyncManager');
          return;
      }

      // If successful, delete the sync record
      await syncLocalDataSource.deleteSyncRecordById(record.id);
      log('[SyncManager] Synced and deleted record: ${record.id}',
          name: 'SyncManager');
    } catch (e, st) {
      // On failure, update status to failed
      final syncParams = record.toParams().copyWith(
            syncStatus: SyncStatus.failed,
          );
      await syncLocalDataSource.updateSyncRecord(syncParams);
      log('[SyncManager] Failed to sync record: ${record.id}, error: $e',
          name: 'SyncManager', stackTrace: st);
      // throw FirebaseServiceException('SyncManager Firestore error: $e');
    }
  }

  /// Processes a task-related sync record.
  ///
  /// Executes the appropriate task operation based on the operation type
  /// stored in the sync record.
  ///
  /// [record] The sync record containing task operation details.
  ///
  /// ## Supported Operations
  /// - **Create**: Creates a new task using parameters from the record
  /// - **Update**: Updates an existing task using parameters from the record
  /// - **Delete**: Deletes a task by its record ID
  ///
  /// ## Parameter Handling
  /// - **Create/Update**: Uses `operationParamsJson` to reconstruct parameters
  /// - **Delete**: Uses `recordId` as the task ID to delete
  /// - **Error handling**: Throws exception for unknown operation types
  ///
  /// ## Notes
  /// - Parameters are deserialized from JSON stored in the sync record
  /// - This allows complex objects to be stored and reconstructed later
  /// - The remote data source handles the actual API calls
  Future<void> _processTaskRecord(SyncModel record) async {
    switch (record.operationType) {
      case OperationTypes.create:
        await taskRemoteDataSource.createTask(
          CreateTaskParams.fromJson(record.operationParamsJson ?? {}),
        );
        break;
      case OperationTypes.update:
        await taskRemoteDataSource.updateTask(
          UpdateTaskParams.fromJson(record.operationParamsJson ?? {}),
        );
        break;
      case OperationTypes.delete:
        await taskRemoteDataSource.deleteTask(record.recordId);
        break;
      default:
        throw Exception('Unknown operation type: ${record.operationType}');
    }
  }
}
