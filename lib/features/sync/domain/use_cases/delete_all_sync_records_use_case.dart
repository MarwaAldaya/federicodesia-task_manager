import 'package:bloc_arch/features/sync/domain/repository/sync_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteAllSyncRecordsUseCase {
  final SyncRepository _repository;
  DeleteAllSyncRecordsUseCase(this._repository);

  Future<void> call() => _repository.deleteAllSyncRecords();
}
