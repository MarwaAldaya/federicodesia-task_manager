import 'package:bloc_arch/features/sync/domain/params/sync_params.dart';
import 'package:bloc_arch/features/sync/domain/repository/sync_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class InsertSyncRecordUseCase {
  final SyncRepository _repository;
  InsertSyncRecordUseCase(this._repository);

  Future<void> call(SyncParams syncParams) =>
      _repository.insertSyncRecord(syncParams);
}
