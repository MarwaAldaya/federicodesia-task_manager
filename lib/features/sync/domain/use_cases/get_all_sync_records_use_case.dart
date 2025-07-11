import 'package:bloc_arch/features/sync/domain/models/sync_model.dart';
import 'package:bloc_arch/features/sync/domain/repository/sync_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllSyncRecordsUseCase {
  final SyncRepository _repository;
  GetAllSyncRecordsUseCase(this._repository);

  Future<List<SyncModel>> call({List<String>? statues}) =>
      _repository.getAllSyncRecords(statues: statues);
}
