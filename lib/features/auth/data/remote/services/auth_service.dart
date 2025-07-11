import 'package:bloc_arch/core/data_sources/models/base_response/base_response.dart';
import 'package:bloc_arch/core/data_sources/models/error_model/error_model.dart';
import 'package:bloc_arch/features/auth/data/models/login_model.dart';
import 'package:bloc_arch/features/auth/domain/entities/login_param.dart';
import 'package:bloc_arch/features/auth/domain/entities/register_param.dart';
import 'package:bloc_arch/features/user/data/models/user_model.dart';
import 'package:bloc_arch/features/workspace/data/models/workspace_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:bloc_arch/core/const/constants.dart';

abstract class AuthService {
  Future<BaseResponse<AuthModel>> login(LoginParams params);
  Future<BaseResponse<AuthModel>> register(RegisterParams params);
  Future<BaseResponse<void>> logout();
}

@Injectable(as: AuthService)
class AuthServiceImpl implements AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<BaseResponse<AuthModel>> login(LoginParams params) async {
    // Sign in with Firebase Auth
    final userCredential = await _auth.signInWithEmailAndPassword(
      email: params.email, // Using username as email
      password: params.password,
    );

    if (userCredential.user != null) {
      // Get the ID token
      final token = await userCredential.user!.getIdToken();

      // Get user data from Firestore
      final userDoc = await _firestore
          .collection(FirestoreCollections.users)
          .doc(userCredential.user!.uid)
          .get();
      UserModel? userModel;
      if (userDoc.exists) {
        userModel = UserModel.fromJson(userDoc.data()!);
        final workspaceId = params.workspaceId;
        final userWorkspaces = userModel.workspaces ?? [];
        final workspaceExists =
            userWorkspaces.any((ws) => ws.id == workspaceId);
        if (!workspaceExists) {
          return BaseResponse<AuthModel>(
            data: null,
            success: false,
            error: ErrorModel(info: LocaleKeys.workspace_not_assigned.tr()),
          );
        }
      }

      return BaseResponse<AuthModel>(
        data: AuthModel(
          user: userModel,
          token: token,
        ),
        success: true,
      );
    } else {
      return BaseResponse<AuthModel>(
        data: null,
        success: false,
      );
    }
  }

  @override
  Future<BaseResponse<AuthModel>> register(RegisterParams params) async {
    // Create user with Firebase Auth
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );

    try {
      final userModel = UserModel(
        id: userCredential.user!.uid,
        username: params.email.split('@')[0],
        email: params.email,
        workspaces: [WorkspaceModel.fromParams(params.workspace)],
      );

      await _firestore
          .collection(FirestoreCollections.users)
          .doc(userCredential.user!.uid)
          .set(userModel.toJson());

      // Get the ID token
      final token = await userCredential.user!.getIdToken();

      return BaseResponse<AuthModel>(
        data: AuthModel(
          user: userModel,
          token: token,
        ),
        success: true,
      );
    } catch (e) {
      // Rollback: delete the created Firebase Auth user
      await userCredential.user?.delete();
      rethrow; // or handle error as needed
    }
  }

  @override
  Future<BaseResponse<void>> logout() async {
    await _auth.signOut();
    return BaseResponse<void>(
      data: null,
      success: true,
    );
  }
}
