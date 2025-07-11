import 'package:bloc_arch/core/data_sources/models/base_response/base_response.dart';
import 'package:bloc_arch/core/data_sources/models/error_model/error_model.dart';
import 'package:bloc_arch/features/sync/domain/params/sync_params.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/upcoming_tasks_params.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bloc_arch/features/task/data/models/task_model.dart';
import 'package:bloc_arch/features/task/domain/params/create_task_params/create_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/update_task_params/update_task_params.dart';
import 'package:bloc_arch/features/task/domain/params/get_task_params/filter_task_params.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_arch/core/const/constants.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/exceptions.dart';

abstract class TaskService {
  Future<BaseResponse<List<TaskModel>>> getAllTasks({
    FilterTaskParams? filterParams,
  });

  Future<BaseResponse<TaskModel>> createTask(CreateTaskParams params);
  Future<BaseResponse<TaskModel>> updateTask(UpdateTaskParams params);
  Future<BaseResponse<void>> deleteTask(String taskId);
  Future<BaseResponse<TaskModel?>> getTaskById(String taskId);
  Future<BaseResponse<List<TaskModel>>> getUpcomingTasksForUser(
      UpcomingTasksParams params);
}

@Injectable(as: TaskService)
class TaskServiceImpl implements TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = FirestoreCollections.tasks;

  TaskModel _taskModelFromDoc(DocumentSnapshot doc) {
    return TaskModel.fromJson({
      'id': doc.id,
      'syncStatus': SyncStatus.synced.name,
      ...doc.data() as Map<String, dynamic>,
    });
  }

  @override
  Future<BaseResponse<List<TaskModel>>> getAllTasks({
    FilterTaskParams? filterParams,
  }) async {
    try {
      Query query = _firestore.collection(_collection);

      // Apply only equality filters in Firestore for maximum performance
      if (filterParams != null) {
        // Filter by user IDs (equality filter - very fast)
        if (filterParams.userIds != null && filterParams.userIds!.isNotEmpty) {
          if (filterParams.userIds!.length == 1) {
            query = query.where('assignee.id',
                isEqualTo: filterParams.userIds!.first);
          } else {
            query = query.where('assignee.id', whereIn: filterParams.userIds);
          }
        }

        // Filter by status (equality filter - very fast)
        if (filterParams.statuses != null &&
            filterParams.statuses!.isNotEmpty) {
          final statusList = filterParams.statuses!.map((s) => s.name).toList();
          if (statusList.length == 1) {
            query = query.where('status', isEqualTo: statusList.first);
          } else {
            query = query.where('status', whereIn: statusList);
          }
        }

        // Note: We do NOT apply dueDate filter in Firestore query
        // It will be applied in memory after fetching for better performance
      }

      // Order by creation date (this works with equality filters)
      query = query.orderBy('createdAt', descending: true);

      final QuerySnapshot snapshot = await query.get();

      List<TaskModel> tasks = snapshot.docs.map(_taskModelFromDoc).toList();

      // Apply due date filter in memory (fast for reasonable dataset sizes)
      if (filterParams?.dueDate != null) {
        final startOfDay = DateTime(
          filterParams!.dueDate!.year,
          filterParams.dueDate!.month,
          filterParams.dueDate!.day,
        );
        final endOfDay = startOfDay.add(const Duration(days: 1));

        tasks = tasks.where((task) {
          if (task.dueDate == null) return false;
          return task.dueDate!.isAfter(
                  startOfDay.subtract(const Duration(microseconds: 1))) &&
              task.dueDate!.isBefore(endOfDay);
        }).toList();
      }

      return BaseResponse<List<TaskModel>>(
        data: tasks,
        success: true,
      );
    } catch (e) {
      // Provide more helpful error message for index issues
      String errorMessage = 'Failed to get tasks: $e';
      if (e.toString().contains('index')) {
        errorMessage =
            'Firestore index required. Please create the necessary composite indexes for the fields being filtered and ordered.';
      }
      throw FirebaseServiceException(errorMessage);
    }
  }

  @override
  Future<BaseResponse<TaskModel>> createTask(CreateTaskParams params) async {
    try {
      final taskData = params.toFirestoreJson();

      // Add server timestamps
      taskData['createdAt'] = FieldValue.serverTimestamp();
      taskData['updatedAt'] = FieldValue.serverTimestamp();

      final docRef = _firestore
          .collection(_collection)
          .doc(taskData['id']); // generate a new doc ref
      // taskData['id'] = docRef.id; // set the id field to match the doc id

      await docRef.set(taskData);

      final doc = await docRef.get();

      final task = TaskModel.fromJson({
        ..._taskModelFromDoc(doc).toJson(),
      });

      return BaseResponse<TaskModel>(
        data: task,
        success: true,
      );
    } catch (e) {
      throw FirebaseServiceException('Failed to create task: $e');
    }
  }

  @override
  Future<BaseResponse<TaskModel>> updateTask(UpdateTaskParams params) async {
    try {
      final taskData = params.toFirestoreJson();
      // Add server timestamp
      taskData['updatedAt'] = FieldValue.serverTimestamp();
      await _firestore.collection(_collection).doc(params.id).update(taskData);
      // Get the updated document
      final DocumentSnapshot doc =
          await _firestore.collection(_collection).doc(params.id).get();
      final task = TaskModel.fromJson({
        ..._taskModelFromDoc(doc).toJson(),
      });
      return BaseResponse<TaskModel>(
        data: task,
        success: true,
      );
    } catch (e) {
      throw FirebaseServiceException('Failed to update task: $e');
    }
  }

  @override
  Future<BaseResponse<void>> deleteTask(String taskId) async {
    try {
      await _firestore.collection(_collection).doc(taskId).delete();

      return BaseResponse<void>(
        data: null,
        success: true,
      );
    } catch (e) {
      throw FirebaseServiceException('Failed to delete task: $e');
    }
  }

  @override
  Future<BaseResponse<TaskModel?>> getTaskById(String taskId) async {
    try {
      final DocumentSnapshot doc =
          await _firestore.collection(_collection).doc(taskId).get();

      if (doc.exists) {
        final task = TaskModel.fromJson({
          'id': doc.id,
          'syncStatus': SyncStatus.synced.name,
          ...doc.data() as Map<String, dynamic>,
        });
      }

      return BaseResponse<TaskModel?>(
        data: null,
        success: true,
      );
    } catch (e) {
      throw FirebaseServiceException('Failed to get task: $e');
    }
  }

  @override
  Future<BaseResponse<List<TaskModel>>> getUpcomingTasksForUser(
      UpcomingTasksParams params) async {
    try {
      // Create date range for the given date (start of day to end of day)
      final startOfDay = DateTime(
        params.dueDate.year,
        params.dueDate.month,
        params.dueDate.day,
      );
      final endOfDay = startOfDay.add(const Duration(days: 1));

      Query query = _firestore
          .collection(_collection)
          .where('assigneeId', isEqualTo: params.userId)
          .where('dueDate',
              isGreaterThanOrEqualTo: startOfDay.toIso8601String())
          .where('dueDate', isLessThan: endOfDay.toIso8601String());

      final QuerySnapshot snapshot = await query.get();
      List<TaskModel> tasks = snapshot.docs.map(_taskModelFromDoc).toList();
      return BaseResponse<List<TaskModel>>(
        data: tasks,
        success: true,
      );
    } catch (e) {
      throw FirebaseServiceException('Failed to get upcoming tasks: $e');
    }
  }
}
