import 'package:eko_assignment/config/app_constants.dart';
import 'package:eko_assignment/config/navigation/app_router.dart';
import 'package:eko_assignment/main.dart';
import 'package:eko_assignment/screens/login_screen/cubit/auth_cubit/auth_cubit.dart';
import 'package:eko_assignment/screens/login_screen/cubit/login_screen_cubit/login_screen_cubit.dart';
import 'package:eko_assignment/screens/what_a_terrible_failure/what_a_terrible_failure.dart';
import 'package:eko_assignment/services/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AssignmentApp extends StatefulWidget {
  const AssignmentApp({super.key});

  @override
  State<AssignmentApp> createState() => _AssignmentAppState();
}

class _AssignmentAppState extends State<AssignmentApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    appLogger.i('///${state.toString().split('.').last}///');
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => di<AuthCubit>(),
            ),
            BlocProvider(
              create: (context) => di<LoginScreenCubit>(),
            ),
          ],
          child: MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: AppRouter.router,
            supportedLocales: const [Locale('en', '')],
            localeResolutionCallback: (locale, supportedLocales) =>
                supportedLocales.contains(locale) ? locale : const Locale('en', ''),
            title: AppConstants.appName,
            builder: (_, screen) {
              ErrorWidget.builder = (FlutterErrorDetails errorDetails) => const WhatATerribleFailure();
              return screen ?? const SizedBox.shrink();
            },
          ),
        ),
      );
}
