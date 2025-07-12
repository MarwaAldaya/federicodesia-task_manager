import 'package:bloc_arch/features/sync/domain/models/sync_model.dart';
import 'package:bloc_arch/features/sync/data/data_source/sync_local_data_source.dart';
import 'package:bloc_arch/features/sync/domain/params/sync_params.dart';
import 'package:bloc_arch/features/sync/domain/repository/sync_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SyncRepository)
class SyncRepositoryImpl implements SyncRepository {
  final SyncLocalDataSource _localDataSource;
  SyncRepositoryImpl(this._localDataSource);

  @override
  Future<void> insertSyncRecord(SyncParams syncParams) =>
      _localDataSource.insertSyncRecord(syncParams);

  @override
  Future<List<SyncModel>> getAllSyncRecords({List<String>? statues}) =>
      _localDataSource.getAllSyncRecords(statuses: statues);

  @override
  Future<void> deleteSyncRecordById(String id) =>
      _localDataSource.deleteSyncRecordById(id);

  @override
  Future<void> deleteAllSyncRecords() =>
      _localDataSource.deleteAllSyncRecords();
}
