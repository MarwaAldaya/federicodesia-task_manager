import 'package:freezed_annotation/freezed_annotation.dart';

part 'upcoming_tasks_params.freezed.dart';
part 'upcoming_tasks_params.g.dart';

@freezed
abstract class UpcomingTasksParams with _$UpcomingTasksParams {
  const factory UpcomingTasksParams({
    required String userId,
    required DateTime dueDate,
  }) = _UpcomingTasksParams;

  factory UpcomingTasksParams.fromJson(Map<String, dynamic> json) =>
      _$UpcomingTasksParamsFromJson(json);
}
