import 'package:bloc_arch/features/task/domain/params/get_task_params/filter_task_params.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_tasks_params.freezed.dart';
part 'get_tasks_params.g.dart';

@freezed
abstract class GetTasksParams with _$GetTasksParams {
  const factory GetTasksParams({
    FilterTaskParams? filterParams,
  }) = _GetTasksParams;

  factory GetTasksParams.all() => const GetTasksParams();
  factory GetTasksParams.withFilter(FilterTaskParams filterParams) =>
      GetTasksParams(filterParams: filterParams);

  factory GetTasksParams.fromJson(Map<String, dynamic> json) =>
      _$GetTasksParamsFromJson(json);
}
