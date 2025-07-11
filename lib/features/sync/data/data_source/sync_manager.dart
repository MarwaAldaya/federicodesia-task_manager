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

/// SyncManager runs a cron job every 2 minutes to sync local changes to the remote server.
/// It is currently implemented for tasks, but can be extended for other features.
@LazySingleton()
class SyncManager {
  final SyncLocalDataSource syncLocalDataSource;
  final TaskRemoteDataSource taskRemoteDataSource;
  final InternetConnectionChecker connectionChecker;
  final Cron _cron = Cron();
  StreamSubscription<InternetConnectionStatus>? _connectionSubscription;

  SyncManager({
    required this.syncLocalDataSource,
    required this.taskRemoteDataSource,
    required this.connectionChecker,
  });

  void start() {
    // Runs every 2 minutes
    _cron.schedule(Schedule.parse('*/10 * * * *'), () async {
      log('[SyncManager] Running sync job...', name: 'SyncManager');
      await _runSyncJob();
    });
    log('[SyncManager] Cron job scheduled to run every 2 minutes.',
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

  void stop() {
    _cron.close();
    _connectionSubscription?.cancel();
    log('[SyncManager] Cron job stopped.', name: 'SyncManager');
  }

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
