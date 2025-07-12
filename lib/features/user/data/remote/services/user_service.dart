import 'package:bloc_arch/features/user/data/models/user_model.dart';
import 'package:bloc_arch/features/workspace/data/models/workspace_model.dart';
import 'package:bloc_arch/core/data_sources/models/base_response/base_response.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:bloc_arch/core/const/constants.dart';
import 'package:bloc_arch/core/data_sources/utils/error_handler/exceptions.dart';

abstract class UserService {
  Future<BaseResponse<List<UserModel>>> searchUsers(String query);
  Future<BaseResponse<List<UserModel>>> getAllUsers();
}

@Injectable(as: UserService)
class UserServiceImpl implements UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<BaseResponse<List<UserModel>>> searchUsers(String query) async {
    try {
      // Search by username or email
      final usernameQuery = await _firestore
          .collection(FirestoreCollections.users)
          .where('username', isGreaterThanOrEqualTo: query)
          .where('username', isLessThan: query + '\uf8ff')
          .get();

      final emailQuery = await _firestore
          .collection(FirestoreCollections.users)
          .where('email', isGreaterThanOrEqualTo: query)
          .where('email', isLessThan: query + '\uf8ff')
          .get();

      // Combine and deduplicate results
      final allDocs = [...usernameQuery.docs, ...emailQuery.docs];
      final uniqueDocs = allDocs.toSet().toList();

      final users = uniqueDocs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; // Add document ID to the data

        // Parse workspaces
        final workspacesData = data['workspaces'] as List<dynamic>? ?? [];
        final workspaces = workspacesData.map((workspace) {
          return WorkspaceModel(
            id: workspace['id'] ?? '',
            name: workspace['name'] ?? '',
          );
        }).toList();

        return UserModel(
          id: data['id'] ?? '',
          username: data['name'] ?? '',
          email: data['email'] ?? '',
          workspaces: workspaces,
        );
      }).toList();

      return BaseResponse<List<UserModel>>(
        data: users,
        success: true,
      );
    } catch (e) {
      throw FirebaseServiceException('Failed to search users: $e');
    }
  }

  @override
  Future<BaseResponse<List<UserModel>>> getAllUsers() async {
    try {
      final querySnapshot =
          await _firestore.collection(FirestoreCollections.users).get();

      final users = querySnapshot.docs.map((doc) {
        final data = doc.data();
        data['id'] = doc.id; // Add document ID to the data

        // Parse workspaces
        final workspacesData = data['workspaces'] as List<dynamic>? ?? [];
        final workspaces = workspacesData.map((workspace) {
          return WorkspaceModel(
            id: workspace['id'] ?? '',
            name: workspace['name'] ?? '',
          );
        }).toList();

        return UserModel(
          id: data['id'] ?? '',
          username: data['name'] ?? '',
          email: data['email'] ?? '',
          workspaces: workspaces,
        );
      }).toList();

      return BaseResponse<List<UserModel>>(
        data: users,
        success: true,
      );
    } catch (e) {
      throw FirebaseServiceException('Failed to get all users: $e');
    }
  }
}
