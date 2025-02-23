import 'package:eko_assignment/main.dart';
import 'package:eko_assignment/screens/games_screen/games_screen.dart';
import 'package:eko_assignment/screens/login_screen/login_screen.dart';
import 'package:eko_assignment/screens/splash_screen/splash_screen.dart';
import 'package:eko_assignment/screens/what_a_terrible_failure/what_a_terrible_failure.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

GlobalKey<NavigatorState> whichNavigatorKey({
  required bool isRootNavigator,
}) =>
    isRootNavigator ? _rootNavigatorKey : _shellNavigatorKey;

class AppRouter {
  static Page<dynamic> buildPageWithDefaultTransition<T>({
    required BuildContext context,
    required GoRouterState state,
    required Widget child,
  }) =>
      MaterialPage(
        key: state.pageKey,
        child: child,
      );

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    observers: [
      GoRouterObserver(),
    ],
    routes: [
      GoRoute(
        path: '/',
        name: SplashScreen.routeName,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: '/${LoginScreen.routeName}',
        name: LoginScreen.routeName,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/${GamesScreen.routeName}',
        name: GamesScreen.routeName,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child: const GamesScreen(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const WhatATerribleFailure(),
  );
}

class GoRouterObserver extends NavigatorObserver {
  GoRouterObserver();

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (kDebugMode) {
      appLogger.i('PUSHED SCREEN: ${route.settings}');
    }
  }
}
