import 'package:bloc_arch/core/widgets/loading_widget.dart';
import 'package:bloc_arch/features/common/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';

import '../../../core/app/injectable_config.dart';
import '../../../core/utils/routes/app_router.dart';
import 'blocs/splash_bloc.dart';
import 'blocs/splash_state.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SplashCubit>()..startTimer(),
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          switch (state.status) {
            case CycleStatus.success:
              context.router.replace(LoginRoute());
              break;
            default:
              break;
          }
        },
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                FlutterLogo(size: 150),
                SizedBox(height: 30),
                LoadingWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
