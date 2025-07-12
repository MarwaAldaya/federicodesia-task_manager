import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_arch/features/task/presentation/task_list/bloc/task_bloc.dart';
import 'package:bloc_arch/core/app/injectable_config.dart';
import 'package:bloc_arch/features/task/presentation/task_list/screens/task_list_screen.dart';

@RoutePage()
class TaskListWrapperScreen extends StatelessWidget {
  const TaskListWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TaskBloc>(),
      child: const TaskListScreen(),
    );
  }
}
