import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_arch/features/sync/domain/params/sync_params.dart';

part 'delete_task_params.freezed.dart';
part 'delete_task_params.g.dart';

@freezed
abstract class DeleteTaskParams with _$DeleteTaskParams {
  const factory DeleteTaskParams({
    required String id,
  }) = _DeleteTaskParams;

  factory DeleteTaskParams.fromJson(Map<String, dynamic> json) =>
      _$DeleteTaskParamsFromJson(json);
}

Map<String, dynamic> _syncParamsToJson(SyncParams params) => params.toJson();
