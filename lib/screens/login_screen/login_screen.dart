import 'package:eko_assignment/main.dart';
import 'package:eko_assignment/screens/games_screen/games_screen.dart';
import 'package:eko_assignment/screens/login_screen/_widgets/biometric_login_button.dart';
import 'package:eko_assignment/screens/login_screen/_widgets/login_button.dart';
import 'package:eko_assignment/screens/login_screen/_widgets/login_field.dart';
import 'package:eko_assignment/screens/login_screen/cubit/auth_cubit/auth_cubit.dart';
import 'package:eko_assignment/screens/login_screen/cubit/login_screen_cubit/login_screen_cubit.dart';
import 'package:eko_assignment/services/dependency_injection.dart';
import 'package:eko_assignment/utils/validate_email.dart';
import 'package:eko_assignment/widgets/app_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = 'loginScreen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        floatingActionButton: const BiometricLoginButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: BlocListener<AuthCubit, AuthState>(
          listener: (context, authState) {
            if (authState.isLoggedIn == true) {
              appLogger.i('User is logged in');
              context.goNamed(GamesScreen.routeName);
            } else if (authState.isLoggedIn == false) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cannot Login..')),
              );
            }
          },
          child: BlocBuilder<AuthCubit, AuthState>(
            buildWhen: (p, c) => p.isLoaderVisible != c.isLoaderVisible,
            builder: (context, authState) => Stack(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LoginField(
                        controller: emailController,
                        hintText: 'Enter email',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (email) {
                          di<LoginScreenCubit>().toggleEmailValid(validateEmail(email));
                          di<LoginScreenCubit>().emitEmail(email);
                        },
                      ),
                      const SizedBox(height: 10),
                      BlocBuilder<LoginScreenCubit, LoginScreenState>(
                        buildWhen: (p, c) => p.isPasswordObscured != c.isPasswordObscured,
                        builder: (_, loginScreenState) => LoginField(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: loginScreenState.isPasswordObscured,
                          suffixIcon: GestureDetector(
                            onTap: () => di<LoginScreenCubit>().togglePasswordVisibility(),
                            child: Icon(loginScreenState.isPasswordObscured ? Icons.visibility_off : Icons.visibility),
                          ),
                          onChanged: (password) {
                            di<LoginScreenCubit>().emitPassword(password);
                            di<LoginScreenCubit>().togglePasswordValid(password.length > 5);
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      const LoginButton(),
                    ],
                  ),
                ),
                if (authState.isLoaderVisible == true) const AppLoader(),
              ],
            ),
          ),
        ),
      );
}
