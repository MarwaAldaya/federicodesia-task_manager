import 'package:flutter/material.dart';
import 'package:bloc_arch/core/utils/routes/app_router.dart';
import 'package:bloc_arch/core/app/app_notification_service.dart';
import 'package:bloc_arch/core/app/injectable_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/resources/theme_manager.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_arch/core/app/bloc/app_cubit.dart';
import 'package:bloc_arch/core/utils/extensions/extensions.dart';
import 'package:bloc_arch/core/app/bloc/app_state.dart';
import 'package:bloc_arch/generated/locale_keys.g.dart';
import 'package:bloc_arch/core/widgets/app_drawer.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  final _appRouter = getIt<AppRouter>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    // Set up the scaffold messenger key for SnackBar notifications
    AppNotificationService.setScaffoldMessengerKey(_scaffoldMessengerKey);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    print('🔄 App lifecycle state changed: $state');

    // Update app state for notification service
    switch (state) {
      case AppLifecycleState.resumed:
        print('📱 App resumed - setting to foreground');
        AppNotificationService.setAppState(true);
        break;
      case AppLifecycleState.inactive:
        print(
            '📱 App inactive - keeping foreground (user might be interacting with notification)');
        // Keep as foreground when inactive (user might be interacting with notification)
        AppNotificationService.setAppState(true);
        break;
      case AppLifecycleState.paused:
        print('📱 App paused - setting to background');
        AppNotificationService.setAppState(false);
        break;
      case AppLifecycleState.detached:
        print('📱 App detached - setting to background');
        AppNotificationService.setAppState(false);
        break;
      case AppLifecycleState.hidden:
        print('📱 App hidden - setting to background');
        AppNotificationService.setAppState(false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppCubit()..loadTheme(),
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, appState) {
          return ScreenUtilInit(
            designSize: MediaQuery.of(context).size,
            minTextAdapt: true,
            useInheritedMediaQuery: true,
            builder: (context, child) {
              return MaterialApp.router(
                title: "Challenge",
                debugShowCheckedModeBanner: false,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                theme: getLightTheme(),
                // theme: getDarkTheme(),
                themeMode: appState.themeMode,
                routerConfig: _appRouter.config(),
                scaffoldMessengerKey: _scaffoldMessengerKey,
                builder: (context, child) {
                  return Scaffold(
                    drawer: AppDrawer(themeMode: appState.themeMode),
                    body: child,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
