import 'dart:convert';
import 'package:bloc_arch/core/data_sources/utils/error_handler/exceptions.dart';
import 'package:bloc_arch/features/sync/domain/models/sync_model.dart';
import 'package:bloc_arch/core/data_sources/local/database/app_database.dart';
import 'package:bloc_arch/features/sync/domain/params/sync_params.dart';
import 'package:bloc_arch/features/task/data/source/task_local_data_source.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'dart:developer';

/// Local data source for sync records, handling all local sync operations and logging actions.
abstract class SyncLocalDataSource {
  /// Inserts a sync record into the local database.
  Future<void> insertSyncRecord(SyncParams syncParams);

  /// Updates a sync record in the local database.
  Future<void> updateSyncRecord(SyncParams syncParams);

  /// Retrieves all sync records, optionally filtered by a list of statuses, and sorted by oldest (createdAt, then updatedAt).
  Future<List<SyncModel>> getAllSyncRecords({List<String>? statuses});

  /// Deletes a sync record by its id.
  Future<void> deleteSyncRecordById(String id);

  /// Deletes all sync records from the local database.
  Future<void> deleteAllSyncRecords();
}

@LazySingleton(as: SyncLocalDataSource)
class SyncLocalDataSourceImpl implements SyncLocalDataSource {
  final AppDatabase _database;
  SyncLocalDataSourceImpl(this._database);

  /// Inserts a sync record into the local database and logs the operation.
  @override
  Future<void> insertSyncRecord(SyncParams syncParams) async {
    try {
      final record = SyncRecordsCompanion(
          id: Value(syncParams.id),
          recordId: Value(syncParams.recordId),
          feature: Value(syncParams.feature),
          operationType: Value(syncParams.operationType),
          syncStatus: Value(syncParams.syncStatus.name),
          createdAt: Value(syncParams.createdAt),
          updatedAt: Value(syncParams.updatedAt),
          operationParamsJson: Value(syncParams.operationParamsJson == null
              ? null
              : jsonEncode(syncParams.operationParamsJson)));
      log('[SyncLocalDataSource] Inserting sync record: ${syncParams.id}',
          name: 'SyncLocalDataSource');
      // await logTableCount(
      //   getCount: () async =>
      //       (await _database.select(_database.tasks).get()).length,
      //   label: 'before',
      // );
      await _database.into(_database.syncRecords).insert(record);
      log('[SyncLocalDataSource] Sync record inserted: ${syncParams.id}',
          name: 'SyncLocalDataSource');
      // await logTableCount(
      //   getCount: () async =>
      //       (await _database.select(_database.tasks).get()).length,
      //   label: 'after',
      // );
    } catch (e) {
      log('[SyncLocalDataSource] Failed to insert sync record: $e',
          name: 'SyncLocalDataSource');
      throw LocalDatabaseException('Failed to insert sync record: $e');
    }
  }

  /// Updates a sync record in the local database and logs the operation.
  @override
  Future<void> updateSyncRecord(SyncParams syncParams) async {
    try {
      final record = SyncRecordsCompanion(
          id: Value(syncParams.id),
          recordId: Value(syncParams.recordId),
          feature: Value(syncParams.feature),
          operationType: Value(syncParams.operationType),
          syncStatus: Value(syncParams.syncStatus.name),
          createdAt: Value(syncParams.createdAt),
          updatedAt: Value(syncParams.updatedAt),
          operationParamsJson: Value(syncParams.operationParamsJson == null
              ? null
              : jsonEncode(syncParams.operationParamsJson)));
      log('[SyncLocalDataSource] Updating sync record: ${syncParams.id}',
          name: 'SyncLocalDataSource');
      await (_database.update(_database.syncRecords)
            ..where((tbl) => tbl.id.equals(syncParams.id)))
          .write(record);
      log('[SyncLocalDataSource] Sync record updated: ${syncParams.id}',
          name: 'SyncLocalDataSource');
    } catch (e) {
      log('[SyncLocalDataSource] Failed to update sync record: $e',
          name: 'SyncLocalDataSource');
      throw LocalDatabaseException('Failed to update sync record: $e');
    }
  }

  /// Retrieves all sync records, optionally filtered by a list of statuses, and logs the operation. Sorted by oldest (createdAt, then updatedAt).
  @override
  Future<List<SyncModel>> getAllSyncRecords({List<String>? statuses}) async {
    try {
      log('[SyncLocalDataSource] Fetching all sync records. Status filter: $statuses',
          name: 'SyncLocalDataSource');
      final query = _database.select(_database.syncRecords);
      if (statuses != null && statuses.isNotEmpty) {
        query.where((tbl) => tbl.syncStatus.isIn(statuses));
      }
      query.orderBy([
        (tbl) =>
            OrderingTerm(expression: tbl.createdAt, mode: OrderingMode.asc),
        (tbl) =>
            OrderingTerm(expression: tbl.updatedAt, mode: OrderingMode.asc),
      ]);
      final records = await query.get();
      log('[SyncLocalDataSource] Fetched ${records.length} sync records.',
          name: 'SyncLocalDataSource');
      return records
          .map((row) => SyncModel(
              id: row.id,
              recordId: row.recordId,
              feature: row.feature,
              operationType: row.operationType,
              syncStatus: row.syncStatus,
              createdAt: row.createdAt,
              updatedAt: row.updatedAt,
              operationParamsJson: row.operationParamsJson == null
                  ? null
                  : jsonDecode(row.operationParamsJson!)
                      as Map<String, dynamic>))
          .toList();
    } catch (e) {
      log('[SyncLocalDataSource] Failed to fetch sync records: $e',
          name: 'SyncLocalDataSource');
      throw LocalDatabaseException('Failed to get all sync record: $e');
    }
  }

  /// Deletes a sync record by its id and logs the operation.
  @override
  Future<void> deleteSyncRecordById(String id) async {
    try {
      log('[SyncLocalDataSource] Deleting sync record: $id',
          name: 'SyncLocalDataSource');
      await (_database.delete(_database.syncRecords)
            ..where((tbl) => tbl.id.equals(id)))
          .go();
      log('[SyncLocalDataSource] Sync record deleted: $id',
          name: 'SyncLocalDataSource');
    } catch (e) {
      log('[SyncLocalDataSource] Failed to delete sync record: $e',
          name: 'SyncLocalDataSource');
      throw LocalDatabaseException('Failed to add deleted sync record: $e');
    }
  }

  /// Deletes all sync records from the local database and logs the operation.
  @override
  Future<void> deleteAllSyncRecords() async {
    try {
      log('[SyncLocalDataSource] Deleting all sync records.',
          name: 'SyncLocalDataSource');
      await _database.delete(_database.syncRecords).go();
      log('[SyncLocalDataSource] All sync records deleted.',
          name: 'SyncLocalDataSource');
    } catch (e) {
      log('[SyncLocalDataSource] Failed to delete all sync records: $e',
          name: 'SyncLocalDataSource');
      throw LocalDatabaseException('Failed to add deleted all sync record: $e');
    }
  }
}
