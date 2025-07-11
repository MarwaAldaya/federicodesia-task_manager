import 'package:bloc_arch/features/workspace/data/models/workspace_model.dart';
import 'package:bloc_arch/features/workspace/data/remote/services/workspace_service.dart';
import 'package:bloc_arch/core/data_sources/models/base_response/base_response.dart';
import 'package:injectable/injectable.dart';

abstract class WorkSpaceRemoteDataSource {
  Future<BaseResponse<List<WorkspaceModel>>> searchWorkSpace(String query);
  Future<BaseResponse<List<WorkspaceModel>>> getAllWorkSpaces();
  Future<BaseResponse<List<WorkspaceModel>>> getAllWorkSpacesForUser(
      String email);
}

@Injectable(as: WorkSpaceRemoteDataSource)
class WorkSpaceRemoteDataSourceImpl implements WorkSpaceRemoteDataSource {
  final WorkSpaceService workSpaceService;

  WorkSpaceRemoteDataSourceImpl({
    required this.workSpaceService,
  });

  @override
  Future<BaseResponse<List<WorkspaceModel>>> searchWorkSpace(
      String query) async {
    return await workSpaceService.searchWorkSpace(query);
  }

  @override
  Future<BaseResponse<List<WorkspaceModel>>> getAllWorkSpaces() async {
    return await workSpaceService.getAllWorkSpaces();
  }

  @override
  Future<BaseResponse<List<WorkspaceModel>>> getAllWorkSpacesForUser(
      String email) async {
    return await workSpaceService.getAllWorkSpacesForUser(email);
  }
}
