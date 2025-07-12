import 'package:bloc_arch/features/sync/domain/models/sync_model.dart';
import 'package:bloc_arch/features/sync/domain/params/sync_params.dart';

abstract class SyncRepository {
  Future<void> insertSyncRecord(SyncParams syncParams);
  Future<List<SyncModel>> getAllSyncRecords({List<String>? statues});
  Future<void> deleteSyncRecordById(String id);
  Future<void> deleteAllSyncRecords();
  // TODO: Add remote sync methods in the future
}
