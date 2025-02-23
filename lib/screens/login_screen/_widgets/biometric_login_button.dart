import 'package:eko_assignment/screens/login_screen/cubit/auth_cubit/auth_cubit.dart';
import 'package:eko_assignment/services/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

class BiometricLoginButton extends StatefulWidget {
  const BiometricLoginButton({super.key});

  @override
  State<BiometricLoginButton> createState() => _BiometricLoginButtonState();
}

class _BiometricLoginButtonState extends State<BiometricLoginButton> {
  final _localAuth = LocalAuthentication();

  @override
  Widget build(BuildContext context) => SizedBox(
        width: 80,
        child: ElevatedButton(
          onPressed: () {
            di<AuthCubit>().authenticate(localAuth: _localAuth);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            elevation: 0,
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          child: const Icon(
            Icons.fingerprint,
            color: Colors.white,
            size: 48,
          ),
        ),
      );
}
