// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CreateTaskScreen]
class CreateTaskRoute extends PageRouteInfo<void> {
  const CreateTaskRoute({List<PageRouteInfo>? children})
    : super(CreateTaskRoute.name, initialChildren: children);

  static const String name = 'CreateTaskRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CreateTaskScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterScreen();
    },
  );
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [TaskListWrapperScreen]
class TaskListWrapperRoute extends PageRouteInfo<void> {
  const TaskListWrapperRoute({List<PageRouteInfo>? children})
    : super(TaskListWrapperRoute.name, initialChildren: children);

  static const String name = 'TaskListWrapperRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const TaskListWrapperScreen();
    },
  );
}

/// generated route for
/// [UpdateTaskScreen]
class UpdateTaskRoute extends PageRouteInfo<UpdateTaskRouteArgs> {
  UpdateTaskRoute({
    Key? key,
    required TaskEntity task,
    List<PageRouteInfo>? children,
  }) : super(
         UpdateTaskRoute.name,
         args: UpdateTaskRouteArgs(key: key, task: task),
         initialChildren: children,
       );

  static const String name = 'UpdateTaskRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<UpdateTaskRouteArgs>();
      return UpdateTaskScreen(key: args.key, task: args.task);
    },
  );
}

class UpdateTaskRouteArgs {
  const UpdateTaskRouteArgs({this.key, required this.task});

  final Key? key;

  final TaskEntity task;

  @override
  String toString() {
    return 'UpdateTaskRouteArgs{key: $key, task: $task}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! UpdateTaskRouteArgs) return false;
    return key == other.key && task == other.task;
  }

  @override
  int get hashCode => key.hashCode ^ task.hashCode;
}
