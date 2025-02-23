import 'package:eko_assignment/screens/login_screen/cubit/auth_cubit/auth_cubit.dart';
import 'package:eko_assignment/screens/login_screen/cubit/login_screen_cubit/login_screen_cubit.dart';
import 'package:eko_assignment/services/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => di<AuthCubit>(),
        child: BlocBuilder<LoginScreenCubit, LoginScreenState>(
          buildWhen: (p, c) => p.isMailValid != c.isMailValid || p.isPasswordValid != c.isPasswordValid,
          builder: (context, loginScreenState) {
            final bool isFormValid = loginScreenState.isMailValid == true && loginScreenState.isPasswordValid == true;
            return SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isFormValid
                    ? () async {
                        await di<AuthCubit>().login(
                          email: loginScreenState.email.toString(),
                          password: loginScreenState.password.toString(),
                        );
                        di<LoginScreenCubit>().reset();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isFormValid ? Colors.green : Colors.grey,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text('Login Now', style: TextStyle(color: isFormValid ? Colors.white : Colors.grey)),
              ),
            );
          },
        ),
      );
}
