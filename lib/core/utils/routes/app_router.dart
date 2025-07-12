import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:bloc_arch/features/task/domain/entities/task_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../features/auth/presentation/login/screens/login_screen.dart';
import '../../../features/auth/presentation/register/screens/register_screen.dart';
import '../../../features/splash/presentation/splash_screen.dart';
import '../../../features/task/presentation/task_list/screens/task_list_wrapper_screen.dart';
import '../../../features/task/presentation/create_task/screens/create_task_screen.dart';
import '../../../features/task/presentation/update/screens/update_task_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
@LazySingleton()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: TaskListWrapperRoute.page),
        AutoRoute(page: CreateTaskRoute.page),
        AutoRoute(page: UpdateTaskRoute.page),
      ];
}
