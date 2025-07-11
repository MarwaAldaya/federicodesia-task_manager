// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:bloc_arch/core/app/app_module.dart' as _i725;
import 'package:bloc_arch/core/app/app_notification_service.dart' as _i493;
import 'package:bloc_arch/core/data_sources/local/database/app_database.dart'
    as _i806;
import 'package:bloc_arch/core/data_sources/local/database/unit_of_work.dart'
    as _i863;
import 'package:bloc_arch/core/data_sources/utils/dio_factory.dart' as _i536;
import 'package:bloc_arch/core/data_sources/utils/network/base_network_info.dart'
    as _i669;
import 'package:bloc_arch/core/utils/routes/app_router.dart' as _i86;
import 'package:bloc_arch/features/auth/data/remote/services/auth_service.dart'
    as _i636;
import 'package:bloc_arch/features/auth/data/remote/source/auth_remote_data_source.dart'
    as _i28;
import 'package:bloc_arch/features/auth/data/repositories/auth_repository_impl.dart'
    as _i120;
import 'package:bloc_arch/features/auth/domain/repositories/auth_repository.dart'
    as _i255;
import 'package:bloc_arch/features/auth/domain/use_cases/login_usecase.dart'
    as _i220;
import 'package:bloc_arch/features/auth/domain/use_cases/logout_usecase.dart'
    as _i541;
import 'package:bloc_arch/features/auth/domain/use_cases/signup_usecase.dart'
    as _i336;
import 'package:bloc_arch/features/auth/presentation/login/cubit/login_cubit.dart'
    as _i644;
import 'package:bloc_arch/features/auth/presentation/register/cubit/register_cubit.dart'
    as _i445;
import 'package:bloc_arch/features/common/dropdown/status_dropdown/cubit/status_dropdown_cubit.dart'
    as _i449;
import 'package:bloc_arch/features/common/dropdown/user_dropdown/cubit/user_dropdown_cubit.dart'
    as _i850;
import 'package:bloc_arch/features/common/dropdown/workspace_dropdown/cubit/workspace_dropdown_cubit.dart'
    as _i971;
import 'package:bloc_arch/features/common/widgets/filter_date_widget/filter_date_cubit/filter_date_button_cubit.dart'
    as _i507;
import 'package:bloc_arch/features/splash/presentation/blocs/splash_bloc.dart'
    as _i364;
import 'package:bloc_arch/features/sync/data/data_source/sync_local_data_source.dart'
    as _i853;
import 'package:bloc_arch/features/sync/data/data_source/sync_manager.dart'
    as _i72;
import 'package:bloc_arch/features/sync/data/repositories/sync_repository_impl.dart'
    as _i589;
import 'package:bloc_arch/features/sync/domain/repository/sync_repository.dart'
    as _i455;
import 'package:bloc_arch/features/sync/domain/use_cases/delete_all_sync_records_use_case.dart'
    as _i918;
import 'package:bloc_arch/features/sync/domain/use_cases/delete_sync_record_by_id_use_case.dart'
    as _i928;
import 'package:bloc_arch/features/sync/domain/use_cases/get_all_sync_records_use_case.dart'
    as _i598;
import 'package:bloc_arch/features/sync/domain/use_cases/insert_sync_record_use_case.dart'
    as _i680;
import 'package:bloc_arch/features/task/data/repositories/task_repository_impl.dart'
    as _i851;
import 'package:bloc_arch/features/task/data/service/task_service.dart'
    as _i798;
import 'package:bloc_arch/features/task/data/source/task_local_data_source.dart'
    as _i404;
import 'package:bloc_arch/features/task/data/source/task_remote_data_source.dart'
    as _i151;
import 'package:bloc_arch/features/task/domain/repository/task_repository.dart'
    as _i208;
import 'package:bloc_arch/features/task/domain/use_cases/create_task_usecase.dart'
    as _i556;
import 'package:bloc_arch/features/task/domain/use_cases/delete_task_usecase.dart'
    as _i1021;
import 'package:bloc_arch/features/task/domain/use_cases/get_tasks_usecase.dart'
    as _i460;
import 'package:bloc_arch/features/task/domain/use_cases/get_upcoming_tasks_usecase.dart'
    as _i827;
import 'package:bloc_arch/features/task/domain/use_cases/update_task_usecase.dart'
    as _i896;
import 'package:bloc_arch/features/task/presentation/create_task/cubit/create_task_cubit.dart'
    as _i595;
import 'package:bloc_arch/features/task/presentation/task_list/bloc/task_bloc.dart'
    as _i712;
import 'package:bloc_arch/features/task/presentation/update/cubit/update_task_cubit.dart'
    as _i4;
import 'package:bloc_arch/features/user/data/remote/services/user_service.dart'
    as _i1067;
import 'package:bloc_arch/features/user/data/remote/source/user_remote_data_source.dart'
    as _i531;
import 'package:bloc_arch/features/user/data/repositories/user_repository_impl.dart'
    as _i794;
import 'package:bloc_arch/features/user/domain/repositories/user_repository.dart'
    as _i1072;
import 'package:bloc_arch/features/user/domain/use_cases/get_all_users_usecase.dart'
    as _i237;
import 'package:bloc_arch/features/user/domain/use_cases/search_users_usecase.dart'
    as _i507;
import 'package:bloc_arch/features/workspace/data/remote/services/workspace_service.dart'
    as _i801;
import 'package:bloc_arch/features/workspace/data/remote/source/workspace_remote_data_source.dart'
    as _i617;
import 'package:bloc_arch/features/workspace/data/repositories/workspace_repository_impl.dart'
    as _i796;
import 'package:bloc_arch/features/workspace/domain/repositories/workspace_repository.dart'
    as _i161;
import 'package:bloc_arch/features/workspace/domain/use_cases/get_all_workspaces_usecase.dart'
    as _i948;
import 'package:bloc_arch/features/workspace/domain/use_cases/get_workspaces_for_user_usecase.dart'
    as _i352;
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    await gh.factoryAsync<_i361.Dio>(
      () => appModule.dio,
      preResolve: true,
    );
    gh.factory<_i364.SplashCubit>(() => _i364.SplashCubit());
    gh.factory<_i449.StatusDropdownCubit>(() => _i449.StatusDropdownCubit());
    gh.factory<_i507.FilterDateButtonCubit>(
        () => _i507.FilterDateButtonCubit());
    gh.lazySingleton<_i536.DioFactory>(() => appModule.dioFactory);
    gh.lazySingleton<_i973.InternetConnectionChecker>(
        () => appModule.connectionChecker);
    gh.lazySingleton<_i669.NetworkInfo>(() => appModule.networkInfo);
    gh.lazySingleton<_i493.AppNotificationService>(
        () => appModule.appNotificationService);
    gh.lazySingleton<_i86.AppRouter>(() => _i86.AppRouter());
    gh.lazySingleton<_i806.AppDatabase>(() => _i806.AppDatabase());
    gh.factory<_i1067.UserService>(() => _i1067.UserServiceImpl());
    gh.factory<_i801.WorkSpaceService>(() => _i801.WorkSpaceServiceImpl());
    gh.lazySingleton<_i853.SyncLocalDataSource>(
        () => _i853.SyncLocalDataSourceImpl(gh<_i806.AppDatabase>()));
    gh.factory<_i636.AuthService>(() => _i636.AuthServiceImpl());
    gh.factory<_i798.TaskService>(() => _i798.TaskServiceImpl());
    gh.factory<_i531.UserRemoteDataSource>(() =>
        _i531.UserRemoteDataSourceImpl(userService: gh<_i1067.UserService>()));
    gh.factory<_i404.TaskLocalDataSource>(
        () => _i404.TaskLocalDataSourceImpl(gh<_i806.AppDatabase>()));
    gh.factory<_i1072.UserRepository>(() => _i794.UserRepositoryImpl(
          remoteDataSource: gh<_i531.UserRemoteDataSource>(),
          networkInfo: gh<_i669.NetworkInfo>(),
        ));
    gh.lazySingleton<_i863.UnitOfWork>(
        () => _i863.UnitOfWork(gh<_i806.AppDatabase>()));
    gh.factory<_i617.WorkSpaceRemoteDataSource>(() =>
        _i617.WorkSpaceRemoteDataSourceImpl(
            workSpaceService: gh<_i801.WorkSpaceService>()));
    gh.factory<_i28.AuthRemoteDataSource>(
        () => _i28.AuthRemoteDataSourceImpl(gh<_i636.AuthService>()));
    gh.lazySingleton<_i151.TaskRemoteDataSource>(
        () => _i151.TaskRemoteDataSourceImpl(gh<_i798.TaskService>()));
    gh.lazySingleton<_i455.SyncRepository>(
        () => _i589.SyncRepositoryImpl(gh<_i853.SyncLocalDataSource>()));
    gh.factory<_i161.WorkspaceRepository>(() => _i796.WorkSpaceRepositoryImpl(
          remoteDataSource: gh<_i617.WorkSpaceRemoteDataSource>(),
          networkInfo: gh<_i669.NetworkInfo>(),
        ));
    gh.factory<_i208.TaskRepository>(() => _i851.TaskRepositoryImpl(
          gh<_i151.TaskRemoteDataSource>(),
          gh<_i404.TaskLocalDataSource>(),
          gh<_i973.InternetConnectionChecker>(),
          gh<_i853.SyncLocalDataSource>(),
          gh<_i863.UnitOfWork>(),
        ));
    gh.lazySingleton<_i72.SyncManager>(() => _i72.SyncManager(
          syncLocalDataSource: gh<_i853.SyncLocalDataSource>(),
          taskRemoteDataSource: gh<_i151.TaskRemoteDataSource>(),
          connectionChecker: gh<_i973.InternetConnectionChecker>(),
        ));
    gh.factory<_i507.SearchUsersUseCase>(
        () => _i507.SearchUsersUseCase(gh<_i1072.UserRepository>()));
    gh.factory<_i237.GetAllUsersUseCase>(
        () => _i237.GetAllUsersUseCase(gh<_i1072.UserRepository>()));
    gh.factory<_i352.GetWorkspacesForUserUseCase>(() =>
        _i352.GetWorkspacesForUserUseCase(gh<_i161.WorkspaceRepository>()));
    gh.factory<_i948.GetAllWorkspacesUseCase>(
        () => _i948.GetAllWorkspacesUseCase(gh<_i161.WorkspaceRepository>()));
    gh.factory<_i255.AuthRepository>(() => _i120.AuthRepositoryImpl(
          remoteDataSource: gh<_i28.AuthRemoteDataSource>(),
          networkInfo: gh<_i669.NetworkInfo>(),
        ));
    gh.factory<_i598.GetAllSyncRecordsUseCase>(
        () => _i598.GetAllSyncRecordsUseCase(gh<_i455.SyncRepository>()));
    gh.factory<_i928.DeleteSyncRecordByIdUseCase>(
        () => _i928.DeleteSyncRecordByIdUseCase(gh<_i455.SyncRepository>()));
    gh.factory<_i918.DeleteAllSyncRecordsUseCase>(
        () => _i918.DeleteAllSyncRecordsUseCase(gh<_i455.SyncRepository>()));
    gh.factory<_i680.InsertSyncRecordUseCase>(
        () => _i680.InsertSyncRecordUseCase(gh<_i455.SyncRepository>()));
    gh.factory<_i971.WorkspaceDropdownCubit>(() => _i971.WorkspaceDropdownCubit(
          gh<_i948.GetAllWorkspacesUseCase>(),
          gh<_i352.GetWorkspacesForUserUseCase>(),
        ));
    gh.factory<_i336.SignupUseCase>(
        () => _i336.SignupUseCase(repository: gh<_i255.AuthRepository>()));
    gh.factory<_i220.LoginUseCase>(
        () => _i220.LoginUseCase(repository: gh<_i255.AuthRepository>()));
    gh.factory<_i541.LogoutUseCase>(
        () => _i541.LogoutUseCase(repository: gh<_i255.AuthRepository>()));
    gh.factory<_i850.UserDropdownCubit>(() => _i850.UserDropdownCubit(
          gh<_i237.GetAllUsersUseCase>(),
          gh<_i507.SearchUsersUseCase>(),
        ));
    gh.factory<_i896.UpdateTaskUseCase>(
        () => _i896.UpdateTaskUseCase(repository: gh<_i208.TaskRepository>()));
    gh.factory<_i1021.DeleteTaskUseCase>(
        () => _i1021.DeleteTaskUseCase(repository: gh<_i208.TaskRepository>()));
    gh.factory<_i556.CreateTaskUseCase>(
        () => _i556.CreateTaskUseCase(repository: gh<_i208.TaskRepository>()));
    gh.factory<_i460.GetTasksUseCase>(
        () => _i460.GetTasksUseCase(repository: gh<_i208.TaskRepository>()));
    gh.factory<_i827.GetUpcomingTasksUseCase>(
        () => _i827.GetUpcomingTasksUseCase(gh<_i208.TaskRepository>()));
    gh.factory<_i644.LoginCubit>(
        () => _i644.LoginCubit(gh<_i220.LoginUseCase>()));
    gh.factory<_i712.TaskBloc>(() => _i712.TaskBloc(
          gh<_i460.GetTasksUseCase>(),
          gh<_i1021.DeleteTaskUseCase>(),
        ));
    gh.factory<_i4.UpdateTaskCubit>(
        () => _i4.UpdateTaskCubit(gh<_i896.UpdateTaskUseCase>()));
    gh.factory<_i595.CreateTaskCubit>(
        () => _i595.CreateTaskCubit(gh<_i556.CreateTaskUseCase>()));
    gh.factory<_i445.RegisterCubit>(
        () => _i445.RegisterCubit(gh<_i336.SignupUseCase>()));
    return this;
  }
}

class _$AppModule extends _i725.AppModule {}
