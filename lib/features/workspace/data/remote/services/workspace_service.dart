import 'package:bloc_arch/features/workspace/data/models/workspace_model.dart';
import 'package:bloc_arch/core/data_sources/models/base_response/base_response.dart';
import 'package:bloc_arch/core/data_sources/models/error_model/error_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_arch/core/const/constants.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/exceptions.dart';

abstract class WorkSpaceService {
  Future<BaseResponse<List<WorkspaceModel>>> searchWorkSpace(String query);
  Future<BaseResponse<List<WorkspaceModel>>> getAllWorkSpaces();
  Future<BaseResponse<List<WorkspaceModel>>> getAllWorkSpacesForUser(
      String email);
}

@Injectable(as: WorkSpaceService)
class WorkSpaceServiceImpl implements WorkSpaceService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<BaseResponse<List<WorkspaceModel>>> searchWorkSpace(
      String query) async {
    try {
      // Search by workspacename
      final workspacenameQuery = await _firestore
          .collection(FirestoreCollections.workspace)
          .where('workspacename', isGreaterThanOrEqualTo: query)
          .where('workspacename', isLessThan: query + '\uf8ff')
          .get();

      final allDocs = [...workspacenameQuery.docs];
      final uniqueDocs = allDocs.toSet().toList();

      final workspaces = uniqueDocs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; // Add document ID to the data

        return WorkspaceModel(
          id: data['id'] ?? '',
          name: data['name'] ?? '',
        );
      }).toList();

      return BaseResponse<List<WorkspaceModel>>(
        data: workspaces,
        success: true,
      );
    } catch (e) {
      throw FirebaseServiceException('Failed to search workspaces: $e');
    }
  }

  @override
  Future<BaseResponse<List<WorkspaceModel>>> getAllWorkSpaces() async {
    try {
      final querySnapshot =
          await _firestore.collection(FirestoreCollections.workspace).get();

      final workspaces = querySnapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; // Add document ID to the data

        return WorkspaceModel(
          id: data['id'] ?? '',
          name: data['name'] ?? '',
        );
      }).toList();

      return BaseResponse<List<WorkspaceModel>>(
        data: workspaces,
        success: true,
      );
    } catch (e) {
      throw FirebaseServiceException('Failed to get all workspaces: $e');
    }
  }

  @override
  Future<BaseResponse<List<WorkspaceModel>>> getAllWorkSpacesForUser(
      String email) async {
    try {
      // Find user by email in the users collection
      final userQuery = await _firestore
          .collection(FirestoreCollections.users)
          .where('email', isEqualTo: email)
          .get();

      if (userQuery.docs.isEmpty) {
        return BaseResponse<List<WorkspaceModel>>(
          data: [],
          success: true,
        );
      }

      final userDoc = userQuery.docs.first;
      final userData = userDoc.data();
      final workspacesData = userData['workspaces'] as List<dynamic>?;

      if (workspacesData == null || workspacesData.isEmpty) {
        return BaseResponse<List<WorkspaceModel>>(
          data: [],
          success: true,
        );
      }

      // Convert the workspaces data to WorkspaceModel objects
      final workspaces = workspacesData
          .map((workspaceData) {
            if (workspaceData is Map<String, dynamic>) {
              return WorkspaceModel(
                id: workspaceData['id'] ?? '',
                name: workspaceData['name'] ?? '',
              );
            }
            return null;
          })
          .whereType<WorkspaceModel>()
          .toList();

      return BaseResponse<List<WorkspaceModel>>(
        data: workspaces,
        success: true,
      );
    } catch (e) {
      throw FirebaseServiceException('Failed to get workspaces for user: $e');
    }
  }
}
