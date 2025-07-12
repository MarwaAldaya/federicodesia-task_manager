import 'package:bloc_arch/features/sync/domain/repository/sync_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeleteSyncRecordByIdUseCase {
  final SyncRepository _repository;
  DeleteSyncRecordByIdUseCase(this._repository);

  Future<void> call(String id) => _repository.deleteSyncRecordById(id);
}
