import 'package:eko_assignment/screens/login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  static const routeName = 'splashScreen';

  @override
  Widget build(BuildContext context) => const _SplashScreenView();
}

class _SplashScreenView extends StatefulWidget {
  const _SplashScreenView();

  @override
  State<_SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<_SplashScreenView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;
      await Future<void>.delayed(const Duration(milliseconds: 1000));

      if (mounted) {
        context.pushReplacementNamed(LoginScreen.routeName);
        // context.pushReplacementNamed(GamesScreen.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) => const Scaffold(
        body: Center(
          child: Text(
            'Odds\nApp',
            textAlign: TextAlign.center,
          ),
        ),
      );
}
